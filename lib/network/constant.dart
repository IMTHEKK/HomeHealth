enum Environment { DEV, STAGING, PROD }

class Constants {
  static Map<String, dynamic> _config = new Map();

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.DEV:
        _config = _Config.debugConstants;
        break;
      case Environment.STAGING:
        _config = _Config.qaConstants;
        break;
      case Environment.PROD:
        _config = _Config.prodConstants;
        break;
    }
  }

  static get SERVER_ONE {
    return _config[_Config.SERVER_ONE];
  }

  static get SERVER_TWO {
    return _config[_Config.SERVER_TWO];
  }

  static get WHERE_AM_I {
    return _config[_Config.WHERE_AM_I];
  }
}

class _Config {
  static const SERVER_ONE = "https://iconhomehealth.ca";
  static const SERVER_TWO = "SERVER_TWO";
  static const WHERE_AM_I = "WHERE_AM_I";

  static Map<String, dynamic> debugConstants = {
    SERVER_ONE: "http://18.209.14.47:5000/api/",
    SERVER_TWO: "http://18.209.14.47:5000/api/",
    WHERE_AM_I: "Dev Env",
  };

  static Map<String, dynamic> qaConstants = {
    SERVER_ONE: "http://18.209.14.47:5000/api/",
    SERVER_TWO: "http://18.209.14.47:5000/api/",
    WHERE_AM_I: "Staging Env",
  };

  static Map<String, dynamic> prodConstants = {
    SERVER_ONE: "http://18.209.14.47:5000/api/",
    SERVER_TWO: "http://18.209.14.47:5000/api/",
    WHERE_AM_I: "Production"
  };
}
