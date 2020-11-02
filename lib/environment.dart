abstract class Environment {
  String apiPath;
}

class EnvironmentProduction extends Environment {
  String apiPath = "prod.api";
}

class EnvironmentStaging extends Environment {
  String apiPath = "staging.api";
}
