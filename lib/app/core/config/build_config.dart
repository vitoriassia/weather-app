enum BuildConfigType { production }

class BuildConfig {
  static late BuildConfig instance;
  final BuildConfigType type;
  final String apiBaseUrl;
  static const _versionApi = '2.5';
  static const String apiKey = '8b5e04f9b2723f7aea89a4ba9402d761';

  BuildConfig.baseProduction({
    this.type = BuildConfigType.production,
    this.apiBaseUrl = 'https://api.openweathermap.org/data/$_versionApi/',
  }) {
    instance = this;
  }
}
