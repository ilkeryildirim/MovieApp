import 'package:easy_localization/easy_localization.dart';

class AppStrings {
  // Private constructor to prevent instantiation
  const AppStrings._();
  
  // String keys - for reference and debugging (private)
  // static const _Keys _keys = _Keys._(); // Removed unused field
  
  // Translated strings - ready to use
  static const _Translates _translates = _Translates._();
  
  // App
  static String get appTitle => _translates.appTitle;
  static String get appName => _translates.appName;
  
  // Authentication
  static String get welcomeBack => _translates.welcomeBack;
  static String get signInToContinue => _translates.signInToContinue;
  static String get email => _translates.email;
  static String get password => _translates.password;
  static String get login => _translates.login;
  static String get logout => _translates.logout;
  static String get enterYourEmail => _translates.enterYourEmail;
  static String get enterYourPassword => _translates.enterYourPassword;
  static String get pleaseEnterYourEmail => _translates.pleaseEnterYourEmail;
  static String get pleaseEnterValidEmail => _translates.pleaseEnterValidEmail;
  static String get pleaseEnterYourPassword => _translates.pleaseEnterYourPassword;
  static String get passwordMustBeAtLeast6Characters => _translates.passwordMustBeAtLeast6Characters;
  static String get dontHaveAnAccount => _translates.dontHaveAnAccount;
  static String get signUp => _translates.signUp;
  static String get forgotPassword => _translates.forgotPassword;
  static String get register => _translates.register;
  static String get createAccount => _translates.createAccount;
  static String get signUpToGetStarted => _translates.signUpToGetStarted;
  static String get name => _translates.name;
  static String get enterYourName => _translates.enterYourName;
  static String get pleaseEnterYourName => _translates.pleaseEnterYourName;
  static String get nameMustBeAtLeast2Characters => _translates.nameMustBeAtLeast2Characters;
  static String get confirmPassword => _translates.confirmPassword;
  static String get confirmYourPassword => _translates.confirmYourPassword;
  static String get pleaseConfirmYourPassword => _translates.pleaseConfirmYourPassword;
  static String get passwordsDoNotMatch => _translates.passwordsDoNotMatch;
  static String get alreadyHaveAnAccount => _translates.alreadyHaveAnAccount;
  
  // Navigation
  static String get home => _translates.home;
  static String get profile => _translates.profile;
  static String get settings => _translates.settings;
  static String get notifications => _translates.notifications;
  static String get security => _translates.security;
  static String get help => _translates.help;
  
  // Actions
  static String get quickActions => _translates.quickActions;
  static String get cancel => _translates.cancel;
  static String get goHome => _translates.goHome;
  
  // Messages
  static String get areYouSureYouWantToLogout => _translates.areYouSureYouWantToLogout;
  static String get error => _translates.error;
  static String get oopsSomethingWentWrong => _translates.oopsSomethingWentWrong;
  static String get unknownError => _translates.unknownError;
  static String get welcomeBackComma => _translates.welcomeBackComma;
  
  // Error Messages
  static String get sessionExpiredPleaseLoginAgain => _translates.sessionExpiredPleaseLoginAgain;
  static String get accessDenied => _translates.accessDenied;
  static String get resourceNotFound => _translates.resourceNotFound;
  static String get serverErrorOccurred => _translates.serverErrorOccurred;
  static String get connectionTimeout => _translates.connectionTimeout;
  static String get requestCancelled => _translates.requestCancelled;
  static String get networkError => _translates.networkError;
  static String get badRequest => _translates.badRequest;
  static String get validationFailed => _translates.validationFailed;
  
  // Parameterized strings
  static String welcomeUser(String name) => _translates.welcomeUser(name);
}

class _Keys {
  const _Keys._();
  
  // App
  static const String appTitle = 'app_title';
  static const String appName = 'app_name';
  
  // Authentication
  static const String welcomeBack = 'welcome_back';
  static const String signInToContinue = 'sign_in_to_continue';
  static const String email = 'email';
  static const String password = 'password';
  static const String login = 'login';
  static const String logout = 'logout';
  static const String enterYourEmail = 'enter_your_email';
  static const String enterYourPassword = 'enter_your_password';
  static const String pleaseEnterYourEmail = 'please_enter_your_email';
  static const String pleaseEnterValidEmail = 'please_enter_valid_email';
  static const String pleaseEnterYourPassword = 'please_enter_your_password';
  static const String passwordMustBeAtLeast6Characters = 'password_must_be_at_least_6_characters';
  static const String dontHaveAnAccount = 'dont_have_an_account';
  static const String signUp = 'sign_up';
  static const String forgotPassword = 'forgot_password';
  static const String register = 'register';
  static const String createAccount = 'create_account';
  static const String signUpToGetStarted = 'sign_up_to_get_started';
  static const String name = 'name';
  static const String enterYourName = 'enter_your_name';
  static const String pleaseEnterYourName = 'please_enter_your_name';
  static const String nameMustBeAtLeast2Characters = 'name_must_be_at_least_2_characters';
  static const String confirmPassword = 'confirm_password';
  static const String confirmYourPassword = 'confirm_your_password';
  static const String pleaseConfirmYourPassword = 'please_confirm_your_password';
  static const String passwordsDoNotMatch = 'passwords_do_not_match';
  static const String alreadyHaveAnAccount = 'already_have_an_account';
  
  // Navigation
  static const String home = 'home';
  static const String profile = 'profile';
  static const String settings = 'settings';
  static const String notifications = 'notifications';
  static const String security = 'security';
  static const String help = 'help';
  
  // Actions
  static const String quickActions = 'quick_actions';
  static const String cancel = 'cancel';
  static const String goHome = 'go_home';
  
  // Messages
  static const String areYouSureYouWantToLogout = 'are_you_sure_you_want_to_logout';
  static const String error = 'error';
  static const String oopsSomethingWentWrong = 'oops_something_went_wrong';
  static const String unknownError = 'unknown_error';
  static const String welcomeBackComma = 'welcome_back_comma';
  static const String welcomeUser = 'welcome_user';
  
  // Error Messages
  static const String sessionExpiredPleaseLoginAgain = 'session_expired_please_login_again';
  static const String accessDenied = 'access_denied';
  static const String resourceNotFound = 'resource_not_found';
  static const String serverErrorOccurred = 'server_error_occurred';
  static const String connectionTimeout = 'connection_timeout';
  static const String requestCancelled = 'request_cancelled';
  static const String networkError = 'network_error';
  static const String badRequest = 'bad_request';
  static const String validationFailed = 'validation_failed';
}

class _Translates {
  const _Translates._();
  
  // App
  String get appTitle => _Keys.appTitle.tr();
  String get appName => _Keys.appName.tr();
  
  // Authentication
  String get welcomeBack => _Keys.welcomeBack.tr();
  String get signInToContinue => _Keys.signInToContinue.tr();
  String get email => _Keys.email.tr();
  String get password => _Keys.password.tr();
  String get login => _Keys.login.tr();
  String get logout => _Keys.logout.tr();
  String get enterYourEmail => _Keys.enterYourEmail.tr();
  String get enterYourPassword => _Keys.enterYourPassword.tr();
  String get pleaseEnterYourEmail => _Keys.pleaseEnterYourEmail.tr();
  String get pleaseEnterValidEmail => _Keys.pleaseEnterValidEmail.tr();
  String get pleaseEnterYourPassword => _Keys.pleaseEnterYourPassword.tr();
  String get passwordMustBeAtLeast6Characters => _Keys.passwordMustBeAtLeast6Characters.tr();
  String get dontHaveAnAccount => _Keys.dontHaveAnAccount.tr();
  String get signUp => _Keys.signUp.tr();
  String get forgotPassword => _Keys.forgotPassword.tr();
  String get register => _Keys.register.tr();
  String get createAccount => _Keys.createAccount.tr();
  String get signUpToGetStarted => _Keys.signUpToGetStarted.tr();
  String get name => _Keys.name.tr();
  String get enterYourName => _Keys.enterYourName.tr();
  String get pleaseEnterYourName => _Keys.pleaseEnterYourName.tr();
  String get nameMustBeAtLeast2Characters => _Keys.nameMustBeAtLeast2Characters.tr();
  String get confirmPassword => _Keys.confirmPassword.tr();
  String get confirmYourPassword => _Keys.confirmYourPassword.tr();
  String get pleaseConfirmYourPassword => _Keys.pleaseConfirmYourPassword.tr();
  String get passwordsDoNotMatch => _Keys.passwordsDoNotMatch.tr();
  String get alreadyHaveAnAccount => _Keys.alreadyHaveAnAccount.tr();
  
  // Navigation
  String get home => _Keys.home.tr();
  String get profile => _Keys.profile.tr();
  String get settings => _Keys.settings.tr();
  String get notifications => _Keys.notifications.tr();
  String get security => _Keys.security.tr();
  String get help => _Keys.help.tr();
  
  // Actions
  String get quickActions => _Keys.quickActions.tr();
  String get cancel => _Keys.cancel.tr();
  String get goHome => _Keys.goHome.tr();
  
  // Messages
  String get areYouSureYouWantToLogout => _Keys.areYouSureYouWantToLogout.tr();
  String get error => _Keys.error.tr();
  String get oopsSomethingWentWrong => _Keys.oopsSomethingWentWrong.tr();
  String get unknownError => _Keys.unknownError.tr();
  String get welcomeBackComma => _Keys.welcomeBackComma.tr();
  
  // Error Messages
  String get sessionExpiredPleaseLoginAgain => _Keys.sessionExpiredPleaseLoginAgain.tr();
  String get accessDenied => _Keys.accessDenied.tr();
  String get resourceNotFound => _Keys.resourceNotFound.tr();
  String get serverErrorOccurred => _Keys.serverErrorOccurred.tr();
  String get connectionTimeout => _Keys.connectionTimeout.tr();
  String get requestCancelled => _Keys.requestCancelled.tr();
  String get networkError => _Keys.networkError.tr();
  String get badRequest => _Keys.badRequest.tr();
  String get validationFailed => _Keys.validationFailed.tr();
  
  // Parameterized strings
  String welcomeUser(String name) => _Keys.welcomeUser.tr(namedArgs: {'name': name});
} 