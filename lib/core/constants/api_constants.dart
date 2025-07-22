class ApiConstants {
  // Base URL
  static const String baseUrl = 'https://caseapi.servicelabs.tech/';
  
  // Auth endpoints
  static const String loginEndpoint = 'user/login';
  static const String registerEndpoint = 'user/register';
  static const String refreshTokenEndpoint = 'user/refresh-token';
  static const String logoutEndpoint = 'user/logout';
  static const String profileEndpoint = 'user/profile';
  static const String changePasswordEndpoint = 'user/change-password';
  static const String forgotPasswordEndpoint = 'user/forgot-password';
  
  // Movie endpoints
  static const String movieListEndpoint = 'movie/list';
  static const String movieFavoriteEndpoint = 'movie/favorite';
  static const String movieFavoritesEndpoint = 'movie/favorites';
  
  // Photo upload endpoints
  static const String photoUploadEndpoint = 'user/upload_photo';
  
  // Headers
  static const String contentType = 'Content-Type';
  static const String accept = 'Accept';
  static const String authorization = 'Authorization';
  static const String bearer = 'Bearer';
  
  // Content types
  static const String applicationJson = 'application/json';
} 