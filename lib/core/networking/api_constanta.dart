class ApiConstanta {
  static const String apiBaseUrl = 'http://11.11.11.74:3000/api';
  // static const String apiBaseUrl = 'http://10.0.2.2:3000/api';
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String allLost = '/reports/lost';
  static const String myReports = '/reports';
  static const String deleteReport = '/reports';
  static const String createReport = '/reports';
  static const String editReport = '/reports';
  static const String getUserData = '/auth/user';
  static const String editUserData = '/auth/user';
  //admin
  static const String allFound = '/reports/existing';
  static const String matching = '/reports/matched-reports';
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
