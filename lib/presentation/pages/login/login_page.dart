import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/extensions/string_extensions.dart';
import '../../../core/utils/svg_helper.dart';
import '../../../core/widgets/loading_widget.dart';
import '../../../core/widgets/safe_click_widget.dart';
import '../../../core/mixins/form_validation_mixin.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../../router/app_router.dart';
import '../../widgets/custom_input_field.dart';
import '../../widgets/social_login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with FormValidationMixin {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late final Map<String, ValidationConfig> _validationConfigs;

  @override
  void initState() {
    super.initState();
    _setupValidation();
  }

  void _setupValidation() {
    _validationConfigs = {
      'email': ValidationConfig(
        controller: _emailController,
        rules: ValidationRules.emailRules,
      ),
      'password': ValidationConfig(
        controller: _passwordController,
        rules: ValidationRules.passwordRules,
      ),
    };

    // Listen to field changes
    _emailController.addListener(() {
      if (isFieldTouched('email')) {
        validateField('email', _emailController.text, ValidationRules.emailRules);
      }
    });

    _passwordController.addListener(() {
      if (isFieldTouched('password')) {
        validateField('password', _passwordController.text, ValidationRules.passwordRules);
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    // Manually validate all fields
    touchField('email');
    touchField('password');
    
    validateField('email', _emailController.text, ValidationRules.emailRules);
    validateField('password', _passwordController.text, ValidationRules.passwordRules);
    
    if (isFormValid) {
      context.read<AuthBloc>().add(
            AuthEvent.login(
              email: _emailController.text.trim(),
              password: _passwordController.text,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            authenticated: (_) => context.go(AppRoutes.home),
            error: (message) => context.showErrorSnackBar(message),
            orElse: () {},
          );
        },
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildHeader(),
                      SizedBox(height: 40.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _buildEmailField(),
                            SizedBox(height: 14.h),
                            _buildPasswordField(),
                            SizedBox(height: 30.h),
                            _buildForgotPasswordLink(),
                            SizedBox(height: 24.h),
                            _buildLoginButton(),
                          ],
                        ),
                      ),
                      SizedBox(height: 36.h),
                      _buildSocialButtons(),
                      SizedBox(height: 32.h),
                      _buildSignUpLink(),
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 82.w),
      child: Column(
        children: [
          Text(
            AppStrings.hello,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.whiteText,
              height: 1.0,
              letterSpacing: 0,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(
            AppStrings.welcomeSubtitle,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.grayText,
              height: 1.0,
              letterSpacing: 0,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildEmailField() {
    return CustomInputField(
      controller: _emailController,
      hintText: AppStrings.emailHint,
      type: InputFieldType.email,
      prefixIcon: AppAssets.mailIcon.toSvgIcon(
        size: 20,
        color: AppColors.grayText,
      ),
      errorText: getError('email'),
      onChanged: (value) {
        touchField('email');
        validateField('email', value, ValidationRules.emailRules);
      },
    );
  }

  Widget _buildPasswordField() {
    return CustomInputField(
      controller: _passwordController,
      hintText: AppStrings.passwordHint,
      type: InputFieldType.password,
      showPasswordToggle: true,
      prefixIcon: AppAssets.lockUnlockedIcon.toSvgIcon(
        size: 20,
        color: AppColors.grayText,
      ),
      errorText: getError('password'),
      onChanged: (value) {
        touchField('password');
        validateField('password', value, ValidationRules.passwordRules);
      },
    );
  }

  Widget _buildForgotPasswordLink() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // TODO: Implement forgot password
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          AppStrings.forgotPasswordLink,
          style: TextStyle(
            color: AppColors.whiteText,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );
        
        final hasContent = _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;
        final isEnabled = hasContent && isFormValid && !isLoading;
        
        return SafeClickWidget(
          onTap: isEnabled ? _login : null,
          child: Container(
            height: 52.h,
            decoration: BoxDecoration(
              color: isEnabled ? AppColors.primaryRed : AppColors.primaryRed.withOpacity(0.5),
              borderRadius: BorderRadius.circular(18.r),
            ),
            child: Center(
              child: isLoading
                  ? SizedBox(
                      height: 24.h,
                      width: 24.w,
                      child: const CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      AppStrings.loginButton,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialLoginButton(
          icon: AppAssets.googleIcon.toSvgIcon(
            size: 24,
            color: AppColors.whiteText,
          ),
          onPressed: () {
            // Google login
          },
        ),
        SizedBox(width: 8.w),
        SocialLoginButton(
          icon: AppAssets.appleIcon.toSvgIcon(
            size: 24,
            color: AppColors.whiteText,
          ),
          onPressed: () {
            // Apple login
          },
        ),
        SizedBox(width: 8.w),
        SocialLoginButton(
          icon: AppAssets.facebookIcon.toSvgIcon(
            size: 24,
            color: AppColors.whiteText,
          ),
          onPressed: () {
            // Facebook login
          },
        ),
      ],
    );
  }

  Widget _buildSignUpLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.dontHaveAccount,
          style: TextStyle(
            color: AppColors.grayText,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            height: 1.5,
            letterSpacing: 0,
          ),
        ),
        SizedBox(width: 8.w),
        TextButton(
          onPressed: () => context.go(AppRoutes.register),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            AppStrings.signUpLink,
            style: TextStyle(
              color: AppColors.whiteText,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              height: 1.5,
              letterSpacing: 0,
            ),
          ),
        ),
      ],
    );
  }
} 