//

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neuro_wood/app/ui/widgets/primary_button.dart';
import 'package:neuro_wood/core/ui/neuro_wood_icons.dart';
import 'package:neuro_wood/core/ui/theme.dart';

///
/// Callback function that accepts the index of moment and
/// returns its' Duration
///
typedef MomentDurationGetter = Duration Function(int index);

///
/// Builder function that accepts current build context, moment index,
/// moment progress and gap between each segment and returns widget for segment
///
typedef ProgressSegmentBuilder =
    Widget Function(
      BuildContext context,
      int index,
      double progress,
      double gap,
    );

///
/// Widget that allows you to use stories mechanism in your apps
///
/// **Usage:**
///
/// ```dart
/// Story(
///   onFlashForward: Navigator.of(context).pop,
///   onFlashBack: Navigator.of(context).pop,
///   momentCount: 4,
///   momentDurationGetter: (idx) => Duration(seconds: 4),
///   momentBuilder: (context, idx) {
///     return Container(
///       color: CupertinoColors.destructiveRed,
///       child: Center(
///         child: Text(
///           'Moment ${idx + 1}',
///           style: TextStyle(color: CupertinoColors.white),
///         ),
///       ),
///     );
///   },
/// )
/// ```
///
class Story extends StatefulWidget {
  const Story({
    super.key,
    required this.stories,
    required this.momentDurationGetter,
    required this.onEndStories,
    this.onFlashForward,
    this.hasNextButton = false,
    this.onFlashBack,
    this.progressSegmentGap = 8.0,
    this.progressOpacityDuration = const Duration(milliseconds: 300),
    this.momentSwitcherFraction = 0.5,
    this.startAt = 0,
    this.topOffset,
    this.lastStoryButtonOnTap,
    required this.overlayColor,
    this.disableSkip = false,
  }) : assert(momentSwitcherFraction >= 0),
       assert(momentSwitcherFraction < double.infinity),
       assert(progressSegmentGap >= 0),
       assert(momentSwitcherFraction < double.infinity);

  final List<StoryItem> stories;

  final VoidCallback? lastStoryButtonOnTap;

  final bool hasNextButton;

  final Color overlayColor;

  final MomentDurationGetter momentDurationGetter;

  final bool disableSkip;

  ///
  /// Gets executed when user taps the right portion of the screen
  /// on the last moment in story or when story finishes playing
  ///
  final VoidCallback? onFlashForward;

  ///
  /// Gets executed when user taps the left portion
  /// of the screen on the first moment in story
  ///
  final VoidCallback? onFlashBack;

  final VoidCallback onEndStories;

  ///
  /// Sets the ratio of left and right tappable portions
  /// of the screen: left for switching back, right for switching forward
  ///
  final double momentSwitcherFraction;

  ///
  /// Sets the gap between each progress segment
  ///
  final double progressSegmentGap;

  ///
  /// Sets the duration for the progress bar show/hide animation
  ///
  final Duration progressOpacityDuration;

  ///
  /// Sets the index of the first moment that will be displayed
  ///
  final int startAt;

  ///
  /// Controls progress segments's container oofset from top of the screen
  ///
  final double? topOffset;

  @override
  StoryState createState() => StoryState();
}

class StoryState extends State<Story> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late int _currentIdx;
  int? _timeStampTap;
  Function? _onTapFinish;
  final GlobalKey _buttonKey = GlobalKey();

  void _switchToNextOrFinish() {
    _controller.stop();
    if (_currentIdx + 1 >= widget.stories.length &&
        widget.onFlashForward != null) {
      widget.onFlashForward!();
    } else if (_currentIdx + 1 < widget.stories.length) {
      _controller.reset();
      setState(() => _currentIdx += 1);
      _controller.duration = widget.momentDurationGetter(_currentIdx);
      _controller.forward();
    } else if (_currentIdx == widget.stories.length - 1) {
      widget.onEndStories();
    }
  }

  void _switchToPrevOrFinish() {
    _controller.stop();
    if (_currentIdx - 1 < 0 && widget.onFlashBack != null) {
      widget.onFlashBack!();
    } else {
      _controller.reset();
      if (_currentIdx - 1 >= 0) {
        setState(() => _currentIdx -= 1);
      }
      _controller.duration = widget.momentDurationGetter(_currentIdx);
      _controller.forward();
    }
  }

  void _onTapDown(TapDownDetails details) {
    if (widget.disableSkip) {
      return;
    }
    final rect = _getWidgetInfo();
    if (rect != null) {
      bool con = rect.contains(details.localPosition);
      if (con) {
        return;
      }
    }
    _timeStampTap = DateTime.now().millisecondsSinceEpoch;
    _controller.stop();
    final width = MediaQuery.of(context).size.width;
    if (details.localPosition.dx < width * widget.momentSwitcherFraction) {
      _onTapFinish = _switchToPrevOrFinish;
    } else {
      _onTapFinish = _switchToNextOrFinish;
    }
  }

  void _onTapUp(TapUpDetails details) {
    if (widget.disableSkip) {
      return;
    }
    _onTapCancel();
  }

  void _onTapCancel() {
    if (widget.disableSkip) {
      return;
    }
    int now = DateTime.now().millisecondsSinceEpoch;
    if ((now - (_timeStampTap ?? 0)) > 250) {
      _controller.forward();
      _timeStampTap = null;
      return;
    } else if (_onTapFinish != null) {
      _onTapFinish!();
      _onTapFinish = null;
    }
  }

  _Rect? _getWidgetInfo() {
    final RenderBox? renderBox =
        _buttonKey.currentContext?.findRenderObject() as RenderBox?;

    if (renderBox == null) {
      return null;
    }
    final Size size = renderBox.size;

    final Offset offset = renderBox.localToGlobal(Offset.zero);

    return _Rect(
      Offset(offset.dx, offset.dy - size.height / 2),
      Offset(offset.dx + size.width, offset.dy + size.height / 2),
    );
  }

  @override
  void initState() {
    _currentIdx = widget.startAt;

    _controller =
        AnimationController(
          vsync: this,
          duration: widget.momentDurationGetter(_currentIdx),
        )..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            _switchToNextOrFinish();
          }
        });

    _controller.forward();

    super.initState();
  }

  @override
  void didUpdateWidget(Story oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _storyProgress(
    BuildContext context,
    int index,
    double progress,
    double gap,
  ) => Container(
    height: 4.0,
    margin: EdgeInsets.only(
      left: index == 0 ? 0 : gap / 2,
      right: index == widget.stories.length - 1 ? 0 : gap / 2,
    ),
    decoration: BoxDecoration(
      color: const Color(0xFFFFFFFF).withValues(alpha: 0.4),
      borderRadius: BorderRadius.circular(4.0),
    ),
    child: FractionallySizedBox(
      alignment: Alignment.centerLeft,
      widthFactor: progress,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: const Color(0xffffffff),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    bool isNotLastStory = _currentIdx + 1 < widget.stories.length;
    return Container(
      decoration: widget.stories[_currentIdx].imageIsCover
          ? BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.stories[_currentIdx].imagePath),
                fit: BoxFit.cover,
              ),
            )
          : BoxDecoration(color: widget.overlayColor),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0, .33, .54, 1],
            colors: [
              Colors.black.withValues(alpha: .6),
              Colors.black.withValues(alpha: 0),
              Colors.black.withValues(alpha: .2),
              Colors.black.withValues(alpha: .8),
            ],
          ),
        ),
        child: SafeArea(
          child: GestureDetector(
            onTapDown: _onTapDown,
            onTapCancel: _onTapCancel,
            onTapUp: _onTapUp,
            behavior: HitTestBehavior.translucent,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                24,
                24,
                24,
                widget.hasNextButton ? 35 : 35,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: <Widget>[
                      ...List.generate(widget.stories.length, (idx) {
                        return Expanded(
                          flex: idx == _currentIdx ? 4 : 1,
                          child: idx == _currentIdx
                              ? AnimatedBuilder(
                                  animation: _controller,
                                  builder: (context, _) {
                                    return _storyProgress(
                                      context,
                                      idx,
                                      _controller.value,
                                      widget.progressSegmentGap,
                                    );
                                  },
                                )
                              : _storyProgress(
                                  context,
                                  idx,
                                  idx < _currentIdx ? 1.0 : 0.0,
                                  widget.progressSegmentGap,
                                ),
                        );
                      }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: context.pop,
                        child: const Padding(
                          padding: EdgeInsets.only(top: 12),
                          child: Icon(Icons.close, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  if (widget.stories[_currentIdx].imageIsCover) ...[
                    const Spacer(),
                    Text(
                      widget.stories[_currentIdx].text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        height: 1.3,
                        fontSize: 16,
                      ),
                    ),
                    if (widget.hasNextButton) ...[
                      const SizedBox(height: 20),
                      PrimaryButton(
                        key: _buttonKey,
                        text: isNotLastStory
                            ? "nextButtonStory".tr()
                            : "startButtonStory".tr(),
                        icon: isNotLastStory
                            ? const Icon(NeuroWoodIcons.arrowRight)
                            : null,
                        primaryColor: isNotLastStory
                            ? Colors.white.withValues(alpha: .3)
                            : NeuroWoodColors.green,
                        onPressed: _switchToNextOrFinish,
                      ),
                    ],
                  ] else ...[
                    Expanded(
                      child: Stack(
                        children: [
                          Positioned(
                            top: 44,
                            left: 0,
                            right: 0,
                            bottom:
                                widget.lastStoryButtonOnTap != null &&
                                    !isNotLastStory
                                ? 122
                                : 50,
                            child: Image.asset(
                              widget.stories[_currentIdx].imagePath,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  widget.stories[_currentIdx].text,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    height: 1.3,
                                    fontSize: 16,
                                  ),
                                ),
                                if (widget.lastStoryButtonOnTap != null &&
                                    !isNotLastStory) ...[
                                  const SizedBox(height: 22),
                                  PrimaryButton(
                                    key: _buttonKey,
                                    text: 'Измерить древесину',
                                    icon: const Icon(Icons.camera_alt_outlined),
                                    primaryColor: NeuroWoodColors.green,
                                    onPressed: widget.lastStoryButtonOnTap,
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Rect {
  final Offset lt;
  final Offset rb;

  _Rect(this.lt, this.rb);

  @override
  String toString() {
    return '($lt, $rb)';
  }

  bool contains(Offset point) {
    return (point.dx >= lt.dx && point.dx <= rb.dx) &&
        (point.dy >= lt.dy && point.dy <= rb.dy);
  }
}

class StoryItem {
  final String text;
  final String imagePath;
  final Duration duration;
  final bool imageIsCover;

  const StoryItem({
    required this.text,
    required this.imagePath,
    this.duration = const Duration(seconds: 5),
    this.imageIsCover = false,
  });
}
