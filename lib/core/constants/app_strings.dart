import 'package:easy_localization/easy_localization.dart';

class AppStrings {
  // Private constructor to prevent instantiation
  const AppStrings._();
  
  // String keys - for reference and debugging
  static const Keys keys = Keys._();
  
  // Translated strings - ready to use
  static const Translates translates = Translates._();
  
  // For backwards compatibility and convenience
  static String get appTitle => translates.appTitle;
  static String get welcomeBack => translates.welcomeBack;
  static String get signInToContinue => translates.signInToContinue;
  static String get email => translates.email;
  static String get password => translates.password;
  static String get login => translates.login;
  static String get logout => translates.logout;
  

}

class Keys {
  const Keys._();
  
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
}

class Translates {
  const Translates._();
  
  // App
  String get appTitle => Keys.appTitle.tr();
  String get appName => Keys.appName.tr();
  
  // Authentication
  String get welcomeBack => Keys.welcomeBack.tr();
  String get signInToContinue => Keys.signInToContinue.tr();
  String get email => Keys.email.tr();
  String get password => Keys.password.tr();
  String get login => Keys.login.tr();
  String get logout => Keys.logout.tr();
  String get enterYourEmail => Keys.enterYourEmail.tr();
  String get enterYourPassword => Keys.enterYourPassword.tr();
  String get pleaseEnterYourEmail => Keys.pleaseEnterYourEmail.tr();
  String get pleaseEnterValidEmail => Keys.pleaseEnterValidEmail.tr();
  String get pleaseEnterYourPassword => Keys.pleaseEnterYourPassword.tr();
  String get passwordMustBeAtLeast6Characters => Keys.passwordMustBeAtLeast6Characters.tr();
  String get dontHaveAnAccount => Keys.dontHaveAnAccount.tr();
  String get signUp => Keys.signUp.tr();
  String get forgotPassword => Keys.forgotPassword.tr();
  
  // Navigation
  String get home => Keys.home.tr();
  String get profile => Keys.profile.tr();
  String get settings => Keys.settings.tr();
  String get notifications => Keys.notifications.tr();
  String get security => Keys.security.tr();
  String get help => Keys.help.tr();
  
  // Actions
  String get quickActions => Keys.quickActions.tr();
  String get cancel => Keys.cancel.tr();
  String get goHome => Keys.goHome.tr();
  
  // Messages
  String get areYouSureYouWantToLogout => Keys.areYouSureYouWantToLogout.tr();
  String get error => Keys.error.tr();
  String get oopsSomethingWentWrong => Keys.oopsSomethingWentWrong.tr();
  String get unknownError => Keys.unknownError.tr();
  String get welcomeBackComma => Keys.welcomeBackComma.tr();
  
  // Parameterized strings
  String welcomeUser(String name) => 'welcome_user'.tr(namedArgs: {'name': name});
} 