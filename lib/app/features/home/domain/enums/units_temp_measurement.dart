enum UnitsTempMeasurement {
  ///For temperature in Kelvin use units=standard
  standard,

  ///For temperature in Celsius use units=metric
  metric,

  /// For temperature in Fahrenheit use units=imperial
  imperial;

  String get toAPIKey {
    switch (this) {
      case UnitsTempMeasurement.standard:
        return 'standard';
      case UnitsTempMeasurement.metric:
        return 'metric';
      case UnitsTempMeasurement.imperial:
        return 'imperial';
      default:
        return 'metric';
    }
  }
}
