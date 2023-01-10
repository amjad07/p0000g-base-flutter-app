
enum Flavor { production, staging, development }

class FlavorValues {
  FlavorValues({required this.apiBaseUrl, required this.apiKey});

  final String apiBaseUrl;
  final String apiKey;
}

class FlavorConfig {
  final Flavor flavor;
  final FlavorValues values;
  static FlavorConfig? _instance;

  factory FlavorConfig({required Flavor flavor, required FlavorValues values}) {
    _instance ??= FlavorConfig._internal(flavor, values);
    return _instance ??
        FlavorConfig(
            values: FlavorValues(apiBaseUrl: "", apiKey: ""),
            flavor: Flavor.development);
  }

  FlavorConfig._internal(this.flavor, this.values);

  static FlavorConfig? get instance {
    return _instance;
  }

  static bool isProduction() => _instance?.flavor == Flavor.production;

  static bool isDevelopment() => _instance?.flavor == Flavor.development;

  static bool isStaging() => _instance?.flavor == Flavor.staging;
}
