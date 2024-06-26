bool isLoggedInUser = false;

class ApiConstants {
  static const String apiBaseurl = 'https://api.escuelajs.co/api/v1/';
  static const String login = 'auth/login';
  static const String profile = 'auth/profile';
  static const String upload = 'files/upload';
  static const String signup = 'users/';
  static const String getAllProducts = 'products/';
  static const String getAllCategories = 'categories/';
  static const String getAllUsers = 'users/';
}

class ApiErrors {
  static const String badRequestError = 'badRequestError';
  static const String noContent = 'noContent';
  static const String forbiddenError = 'forbiddenError';
  static const String unauthorizedError = 'unauthorizedError';
  static const String notFoundError = 'notFoundError';
  static const String conflictError = 'conflictError';
  static const String internalServerError = 'internalServerError';
  static const String unknownError = 'unknownError';
  static const String timeoutError = 'timeoutError';
  static const String defaultError = 'defaultError';
  static const String cacheError = 'cacheError';
  static const String noInternetError = 'noInternetError';
  static const String loadingMessage = 'loading_message';
  static const String retryAgainMessage = 'retry_again_message';
  static const String ok = 'Ok';
}
