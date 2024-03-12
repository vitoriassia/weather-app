enum BuildConfigType { production }

class BuildConfig {
  static late BuildConfig instance;
  final BuildConfigType type;
  final String apiBaseUrl;
  static const _versionApi = '2';

  BuildConfig.baseProduction({
    this.type = BuildConfigType.production,
    this.apiBaseUrl = 'https://pokeapi.co/api/v$_versionApi/',
  }) {
    instance = this;
  }
}
