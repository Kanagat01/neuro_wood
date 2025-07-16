import 'package:flutter/cupertino.dart';

class LaunchAction {
  final Uri uri;
  final String title;
  final Function(BuildContext context)? fallback;

  const LaunchAction({
    required this.uri,
    required this.title,
    this.fallback,
  });
}
