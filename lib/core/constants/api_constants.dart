class ApiConstants {
  // Base URL
  static const String baseUrl = 'https://caseapi.servicelabs.tech';
  
  // Auth endpoints
  static const String login = '/user/login';
  static const String register = '/user/register';
  static const String refreshToken = '/user/refresh-token';
  static const String logout = '/user/logout';
  
  // Movie endpoints
  static const String movieList = '/movie/list';
  
  // Headers
  static const String contentType = 'Content-Type';
  static const String accept = 'Accept';
  static const String authorization = 'Authorization';
  static const String bearer = 'Bearer';
  
  // Content types
  static const String applicationJson = 'application/json';
} 