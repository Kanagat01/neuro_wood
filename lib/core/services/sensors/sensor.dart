import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'dart:math' as math;

import 'package:aeyrium_sensor/aeyrium_sensor.dart';
import 'package:neuro_wood/core/buisness_constraints.dart';
import 'package:rxdart/rxdart.dart';

class InclineSensor {
  late StreamSubscription _subsAcc;
  InclineMeasure? _oldMesaure;
  SensorEvent? _oldEvent;

  InclineSensor() {
    _init();
  }

  _init() {
    int Function(double) deg = Platform.isIOS ? toDegIos : toDeg;
    _subsAcc = AeyriumSensor.sensorEvents.throttleTime(const Duration(milliseconds: 100)).listen((event) {
      if (!event.isEqual(_oldEvent)) {
        final e = InclineMeasure(deg(event.pitch), deg(event.roll));
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

  int toDeg(double d) =>(d * _deg).round();

  int toDegIos(double d){
    int deg = (d * _deg).round();
    if(deg < -180){
      deg+=360;
    }
    return deg;
  }

  static const _deg = 180 / math.pi;

  final BehaviorSubject<InclineMeasure> _sc = BehaviorSubject<InclineMeasure>();

  dispose() {
    log('DISPOSE SENSOR');
    _subsAcc.cancel();
    _sc.close();
  }

  /*  Stream<InclineMeasure> get stream {
    return AeyriumSensor.sensorEvents
        .throttleTime(const Duration(milliseconds: 100))
        .map((event) => InclineMeasure(toDeg(event.pitch), toDeg(event.roll)))
        .where((e) {
          bool res = e != _oldMesaure;
          if (res) {
            _oldMesaure = e;
          }
          return res;
        });
  } */
  Stream<InclineMeasure> get stream {
    return _sc.stream;
  }

  pause() {
    _subsAcc.pause();
  }

  play() {
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
  bool operator ==(other) {
    if (other is! InclineMeasure) return false;
    return other.pitch == pitch && other.roll == roll;
  }

  bool get isAllowable => isAllowableRoll && isAllowablePitch;

  bool get isAllowablePitch =>
      pitch <= BuisnessConstraints.allowPitchIncline && pitch >= -BuisnessConstraints.allowPitchIncline;

  bool get isAllowableRoll =>
      roll <= BuisnessConstraints.allowRollIncline && roll >= -BuisnessConstraints.allowRollIncline;

  @override
  int get hashCode => pitch.hashCode ^ roll.hashCode;
}

extension AEE on SensorEvent {
  bool isEqual(SensorEvent? o) {
    if (o == null) return false;
    return o.pitch.toStringAsFixed(2) == pitch.toStringAsFixed(2) &&
        o.roll.toStringAsFixed(2) == roll.toStringAsFixed(2);
  }
}
