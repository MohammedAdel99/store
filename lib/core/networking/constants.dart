bool isLoggedInUser = false;

class ApiConstants {
  static const String apiBaseurl = 'https://api.escuelajs.co/';
  static const String login = 'api/v1/auth/login';
  static const String profile = 'api/v1/auth/profile';
  static const String upload = 'api/v1/files/upload';
  static const String signup = 'api/v1/users/';
  static const String getAllProducts = 'api/v1/products/';
  static const String getAllCategories = 'api/v1/categories/';
  static const String getAllUsers = 'api/v1/users/';
  static const String graphql = 'graphql';
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
