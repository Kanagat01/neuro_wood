import 'dart:async';
import 'dart:developer';
import 'dart:math' as math;

import 'package:neuro_wood/core/buisness_constraints.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sensors_plus/sensors_plus.dart';

class InclineSensor {
  late StreamSubscription _subsAcc;
  InclineMeasure? _oldMesaure;
  AccelerometerEvent? _oldEvent;

  InclineSensor() {
    _init();
  }

  final BehaviorSubject<InclineMeasure> _sc = BehaviorSubject<InclineMeasure>();

  Stream<InclineMeasure> get stream => _sc.stream;

  static const _deg = 180 / math.pi;

  void _init() {
    _subsAcc = accelerometerEventStream()
        .throttleTime(const Duration(milliseconds: 100))
        .listen((event) {
          if (!event.isEqual(_oldEvent)) {
            _oldEvent = event;
            final pitch = _calculatePitch(event);
            final roll = _calculateRoll(event);
            final e = InclineMeasure(pitch, roll);
            if (e != _oldMesaure) {
              _oldMesaure = e;
              if (_sc.isClosed) {
                _subsAcc.cancel();
              } else {
                _sc.add(e);
              }
            }
          }
        });
  }

  int _calculatePitch(AccelerometerEvent e) {
    final radians = math.atan2(e.x, math.sqrt(e.y * e.y + e.z * e.z));
    return _toDeg(radians);
  }

  int _calculateRoll(AccelerometerEvent e) {
    final radians = math.atan2(e.y, e.z);
    return _toDeg(radians);
  }

  int _toDeg(double rad) => (rad * _deg).round();

  void dispose() {
    log('DISPOSE SENSOR');
    _subsAcc.cancel();
    _sc.close();
  }

  void pause() {
    _subsAcc.pause();
  }

  void play() {
    _init();
    _subsAcc.resume();
  }
}

class InclineMeasure {
  final int pitch, roll;

  InclineMeasure(this.pitch, this.roll);

  @override
  String toString() => "Incline ($pitch°, $roll°)";

  @override
  bool operator ==(Object other) =>
      other is InclineMeasure && other.pitch == pitch && other.roll == roll;

  @override
  int get hashCode => pitch.hashCode ^ roll.hashCode;

  bool get isAllowable => isAllowableRoll && isAllowablePitch;

  bool get isAllowablePitch =>
      pitch <= BuisnessConstraints.allowPitchIncline &&
      pitch >= -BuisnessConstraints.allowPitchIncline;

  bool get isAllowableRoll =>
      roll <= BuisnessConstraints.allowRollIncline &&
      roll >= -BuisnessConstraints.allowRollIncline;
}

extension AccelerometerCompare on AccelerometerEvent {
  bool isEqual(AccelerometerEvent? o) {
    if (o == null) return false;
    return o.x.toStringAsFixed(2) == x.toStringAsFixed(2) &&
        o.y.toStringAsFixed(2) == y.toStringAsFixed(2) &&
        o.z.toStringAsFixed(2) == z.toStringAsFixed(2);
  }
}
