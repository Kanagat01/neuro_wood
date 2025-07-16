enum MeasureType {
  /// В лесовозе
  timberCarrier,

  /// В штабеле
  stack,

  /// Геометрический
  // geometry
}

extension MeasureTypeExt on MeasureType {
  String toSend() {
    switch (this) {
      case MeasureType.timberCarrier:
        return 'timber_carrier';
      case MeasureType.stack:
        return 'stack';
      // case MeasureType.geometry:
      //   return 'geometry';
    }
  }
}

MeasureType getMeasureTypeFromString(String? value) {
  switch (value) {
    case 'timber_carrier':
      return MeasureType.timberCarrier;
    case 'stack':
      return MeasureType.stack;
    // case 'geometry':
    //   return MeasureType.geometry;
    default:
      return MeasureType.timberCarrier;
  }
}
