import 'package:easy_localization/easy_localization.dart';

class AppStrings {
  // Private constructor to prevent instantiation
  const AppStrings._();

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
  
  // Auth Page Strings
  static String get hello => _translates.hello;
  static String get welcomeSubtitle => _translates.welcomeSubtitle;
  static String get emailHint => _translates.emailHint;
  static String get passwordHint => _translates.passwordHint;
  static String get forgotPasswordLink => _translates.forgotPasswordLink;
  static String get loginButton => _translates.loginButton;
  static String get dontHaveAccount => _translates.dontHaveAccount;
  static String get signUpLink => _translates.signUpLink;
  static String get welcomeRegister => _translates.welcomeRegister;
  static String get registerSubtitle => _translates.registerSubtitle;
  static String get nameHint => _translates.nameHint;
  static String get passwordConfirmHint => _translates.passwordConfirmHint;
  static String get termsAndConditions => _translates.termsAndConditions;
  static String get registerButton => _translates.registerButton;
  static String get alreadyHaveAccount => _translates.alreadyHaveAccount;
  static String get signInLink => _translates.signInLink;
  static String get continueWithGoogle => _translates.continueWithGoogle;
  static String get continueWithApple => _translates.continueWithApple;
  static String get continueWithFacebook => _translates.continueWithFacebook;
  static String get continueWithTwitter => _translates.continueWithTwitter;
  
  // Terms and Conditions
  static String get iHaveReadAndAccept => _translates.iHaveReadAndAccept;
  static String get userAgreement => _translates.userAgreement;
  static String get privacyPolicy => _translates.privacyPolicy;
  static String get termsOfService => _translates.termsOfService;
  static String get close => _translates.close;
  static String get iUnderstand => _translates.iUnderstand;
  static String get scrollToBottomToConfirm => _translates.scrollToBottomToConfirm;
  static String get userAgreementContent => _translates.userAgreementContent;
  
  // Movie
  static String get showMore => _translates.showMore;
  static String get showLess => _translates.showLess;
  static String get posterLoadError => _translates.posterLoadError;
  static String get goToFirst => _translates.goToFirst;
  static String get pullUpToGoFirst => _translates.pullUpToGoFirst;
  static String get refresh => _translates.refresh;
  static String get releaseToRefresh => _translates.releaseToRefresh;
  static String get releaseToGoFirst => _translates.releaseToGoFirst;
  
  // Error
  static String get errorOccurred => _translates.errorOccurred;
  static String get retry => _translates.retry;
  
  // Profile
  static String get profileDetail => _translates.profileDetail;
  static String get limitedOffer => _translates.limitedOffer;
  static String get defaultUser => _translates.defaultUser;
  static String get addPhoto => _translates.addPhoto;
  static String get favoriteMovies => _translates.favoriteMovies;
  static String get noFavoriteMoviesYet => _translates.noFavoriteMoviesYet;
  static String get movieTitle => _translates.movieTitle;
  static String get defaultDirector => _translates.defaultDirector;
  
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
  
  // Auth Page Strings
  static const String hello = 'hello';
  static const String welcomeSubtitle = 'welcome_subtitle';
  static const String emailHint = 'email_hint';
  static const String passwordHint = 'password_hint';
  static const String forgotPasswordLink = 'forgot_password_link';
  static const String loginButton = 'login_button';
  static const String dontHaveAccount = 'dont_have_account';
  static const String signUpLink = 'sign_up_link';
  static const String welcomeRegister = 'welcome_register';
  static const String registerSubtitle = 'register_subtitle';
  static const String nameHint = 'name_hint';
  static const String passwordConfirmHint = 'password_confirm_hint';
  static const String termsAndConditions = 'terms_and_conditions';
  static const String registerButton = 'register_button';
  static const String alreadyHaveAccount = 'already_have_account';
  static const String signInLink = 'sign_in_link';
  static const String continueWithGoogle = 'continue_with_google';
  static const String continueWithApple = 'continue_with_apple';
  static const String continueWithFacebook = 'continue_with_facebook';
  static const String continueWithTwitter = 'continue_with_twitter';
  
  // Terms and Conditions
  static const String iHaveReadAndAccept = 'i_have_read_and_accept';
  static const String userAgreement = 'user_agreement';
  static const String privacyPolicy = 'privacy_policy';
  static const String termsOfService = 'terms_of_service';
  static const String close = 'close';
  static const String iUnderstand = 'i_understand';
  static const String scrollToBottomToConfirm = 'scroll_to_bottom_to_confirm';
  static const String userAgreementContent = 'user_agreement_content';
  
  // Movie
  static const String showMore = 'show_more';
  static const String showLess = 'show_less';
  static const String posterLoadError = 'poster_load_error';
  static const String goToFirst = 'go_to_first';
  static const String pullUpToGoFirst = 'pull_up_to_go_first';
  static const String refresh = 'refresh';
  static const String releaseToRefresh = 'release_to_refresh';
  static const String releaseToGoFirst = 'release_to_go_first';
  
  // Error
  static const String errorOccurred = 'error_occurred';
  static const String retry = 'retry';
  
  // Profile
  static const String profileDetail = 'profile_detail';
  static const String limitedOffer = 'limited_offer';
  static const String defaultUser = 'default_user';
  static const String addPhoto = 'add_photo';
  static const String favoriteMovies = 'favorite_movies';
  static const String noFavoriteMoviesYet = 'no_favorite_movies_yet';
  static const String movieTitle = 'movie_title';
  static const String defaultDirector = 'default_director';
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
  
  // Auth Page Strings
  String get hello => _Keys.hello.tr();
  String get welcomeSubtitle => _Keys.welcomeSubtitle.tr();
  String get emailHint => _Keys.emailHint.tr();
  String get passwordHint => _Keys.passwordHint.tr();
  String get forgotPasswordLink => _Keys.forgotPasswordLink.tr();
  String get loginButton => _Keys.loginButton.tr();
  String get dontHaveAccount => _Keys.dontHaveAccount.tr();
  String get signUpLink => _Keys.signUpLink.tr();
  String get welcomeRegister => _Keys.welcomeRegister.tr();
  String get registerSubtitle => _Keys.registerSubtitle.tr();
  String get nameHint => _Keys.nameHint.tr();
  String get passwordConfirmHint => _Keys.passwordConfirmHint.tr();
  String get termsAndConditions => _Keys.termsAndConditions.tr();
  String get registerButton => _Keys.registerButton.tr();
  String get alreadyHaveAccount => _Keys.alreadyHaveAccount.tr();
  String get signInLink => _Keys.signInLink.tr();
  String get continueWithGoogle => _Keys.continueWithGoogle.tr();
  String get continueWithApple => _Keys.continueWithApple.tr();
  String get continueWithFacebook => _Keys.continueWithFacebook.tr();
  String get continueWithTwitter => _Keys.continueWithTwitter.tr();
  
  // Terms and Conditions
  String get iHaveReadAndAccept => _Keys.iHaveReadAndAccept.tr();
  String get userAgreement => _Keys.userAgreement.tr();
  String get privacyPolicy => _Keys.privacyPolicy.tr();
  String get termsOfService => _Keys.termsOfService.tr();
  String get close => _Keys.close.tr();
  String get iUnderstand => _Keys.iUnderstand.tr();
  String get scrollToBottomToConfirm => _Keys.scrollToBottomToConfirm.tr();
  String get userAgreementContent => _Keys.userAgreementContent.tr();
  
  // Movie
  String get showMore => _Keys.showMore.tr();
  String get showLess => _Keys.showLess.tr();
  String get posterLoadError => _Keys.posterLoadError.tr();
  String get goToFirst => _Keys.goToFirst.tr();
  String get pullUpToGoFirst => _Keys.pullUpToGoFirst.tr();
  String get refresh => _Keys.refresh.tr();
  String get releaseToRefresh => _Keys.releaseToRefresh.tr();
  String get releaseToGoFirst => _Keys.releaseToGoFirst.tr();
  
  // Error
  String get errorOccurred => _Keys.errorOccurred.tr();
  String get retry => _Keys.retry.tr();
  
  // Profile
  String get profileDetail => _Keys.profileDetail.tr();
  String get limitedOffer => _Keys.limitedOffer.tr();
  String get defaultUser => _Keys.defaultUser.tr();
  String get addPhoto => _Keys.addPhoto.tr();
  String get favoriteMovies => _Keys.favoriteMovies.tr();
  String get noFavoriteMoviesYet => _Keys.noFavoriteMoviesYet.tr();
  String get movieTitle => _Keys.movieTitle.tr();
  String get defaultDirector => _Keys.defaultDirector.tr();
  
  // Parameterized strings
  String welcomeUser(String name) => _Keys.welcomeUser.tr(namedArgs: {'name': name});
} 