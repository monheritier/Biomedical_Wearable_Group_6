class AppData {

  // Fitbit Client ID (replace XXX with your client ID)
  static const String fitbitClientID = '238K7K';

  // Fitbit Client Secret (replace XXX with your client secret)
  static const String fitbitClientSecret = '03f4d2224ecdbb1ba000ac92355813cf';

  /// Auth Uri (replace XXX with your Uri)
  static const String fitbitRedirectUri = 'monjour://fitbit/auth';

  /// Callback scheme (replace XXX with your callback scheme)
  static const String fitbitCallbackScheme = 'monjour';
  
  static const String baseURL = fitbitRedirectUri;
  static const String login = baseURL + "/session";
  static const String register = baseURL + "/registration";
  static const String forgotPassword = baseURL + "/forgot-password";
}//Strings
