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
import '../../widgets/terms_bottom_sheet.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with FormValidationMixin {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isTermsAccepted = false;

  late final Map<String, ValidationConfig> _validationConfigs;

  @override
  void initState() {
    super.initState();
    _setupValidation();
  }

  void _setupValidation() {
    _validationConfigs = {
      'name': ValidationConfig(
        controller: _nameController,
        rules: ValidationRules.nameRules,
      ),
      'email': ValidationConfig(
        controller: _emailController,
        rules: ValidationRules.emailRules,
      ),
      'password': ValidationConfig(
        controller: _passwordController,
        rules: ValidationRules.passwordRules,
      ),
      'confirmPassword': ValidationConfig(
        controller: _confirmPasswordController,
        rules: [], // Will be validated dynamically
      ),
    };

    // Listen to field changes
    _nameController.addListener(() {
      if (isFieldTouched('name')) {
        validateField('name', _nameController.text, ValidationRules.nameRules);
      }
    });

    _emailController.addListener(() {
      if (isFieldTouched('email')) {
        validateField('email', _emailController.text, ValidationRules.emailRules);
      }
    });

    _passwordController.addListener(() {
      if (isFieldTouched('password')) {
        validateField('password', _passwordController.text, ValidationRules.passwordRules);
      }
      // Also validate confirm password when password changes
      if (isFieldTouched('confirmPassword')) {
        validateField('confirmPassword', _confirmPasswordController.text, 
            ValidationRules.confirmPasswordRules(_passwordController.text));
      }
    });

    _confirmPasswordController.addListener(() {
      if (isFieldTouched('confirmPassword')) {
        validateField('confirmPassword', _confirmPasswordController.text, 
            ValidationRules.confirmPasswordRules(_passwordController.text));
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _register() {
    // Manually validate all fields
    touchField('name');
    touchField('email');
    touchField('password');
    touchField('confirmPassword');
    
    validateField('name', _nameController.text, ValidationRules.nameRules);
    validateField('email', _emailController.text, ValidationRules.emailRules);
    validateField('password', _passwordController.text, ValidationRules.passwordRules);
    validateField('confirmPassword', _confirmPasswordController.text, 
        ValidationRules.confirmPasswordRules(_passwordController.text));
    
    if (isFormValid && _isTermsAccepted) {
      context.read<AuthBloc>().add(
            AuthEvent.register(
              name: _nameController.text.trim(),
              email: _emailController.text.trim(),
              password: _passwordController.text,
            ),
          );
    }
  }

  void _showTermsBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => TermsBottomSheet(
        onAccepted: () {
          setState(() {
            _isTermsAccepted = true;
          });
        },
        cooldownDuration: const Duration(milliseconds: 500),
      ),
    );
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
                            _buildNameField(),
                            SizedBox(height: 14.h),
                            _buildEmailField(),
                            SizedBox(height: 14.h),
                            _buildPasswordField(),
                            SizedBox(height: 14.h),
                            _buildConfirmPasswordField(),
                            SizedBox(height: 16.h),
                            _buildTermsAndConditions(),
                            SizedBox(height: 24.h),
                            _buildRegisterButton(),
                          ],
                        ),
                      ),
                      SizedBox(height: 36.h),
                      _buildSocialButtons(),
                      SizedBox(height: 32.h),
                      _buildSignInLink(),
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
            AppStrings.welcomeRegister,
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
            AppStrings.registerSubtitle,
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

  Widget _buildNameField() {
    return CustomInputField(
      controller: _nameController,
      hintText: AppStrings.nameHint,
      type: InputFieldType.name,
      prefixIcon: AppAssets.addUserIcon.toSvgIcon(
        size: 20,
        color: AppColors.grayText,
      ),
      errorText: getError('name'),
      onChanged: (value) {
        touchField('name');
        validateField('name', value, ValidationRules.nameRules);
      },
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

  Widget _buildConfirmPasswordField() {
    return CustomInputField(
      controller: _confirmPasswordController,
      hintText: AppStrings.passwordConfirmHint,
      type: InputFieldType.password,
      showPasswordToggle: true,
      prefixIcon: AppAssets.lockUnlockedIcon.toSvgIcon(
        size: 20,
        color: AppColors.grayText,
      ),
      errorText: getError('confirmPassword'),
      onChanged: (value) {
        touchField('confirmPassword');
        validateField('confirmPassword', value, ValidationRules.confirmPasswordRules(_passwordController.text));
      },
    );
  }

  Widget _buildTermsAndConditions() {
    return Column(
      children: [
        Text(
          AppStrings.termsAndConditions,
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            height: 1.5,
            letterSpacing: 0,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 12.h),
        SafeClickWidget(
          onTap: _showTermsBottomSheet,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: _isTermsAccepted ? AppColors.primaryRed : Colors.white.withOpacity(0.2),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _isTermsAccepted ? Icons.check_circle : Icons.radio_button_unchecked,
                  color: _isTermsAccepted ? AppColors.primaryRed : Colors.white.withOpacity(0.5),
                  size: 16.sp,
                ),
                SizedBox(width: 8.w),
                Text(
                  AppStrings.iHaveReadAndAccept,
                  style: TextStyle(
                    color: _isTermsAccepted ? AppColors.primaryRed : Colors.white.withOpacity(0.8),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    letterSpacing: 0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterButton() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );
        
        final hasContent = _nameController.text.isNotEmpty &&
                          _emailController.text.isNotEmpty &&
                          _passwordController.text.isNotEmpty &&
                          _confirmPasswordController.text.isNotEmpty;
        final isEnabled = hasContent && isFormValid && _isTermsAccepted && !isLoading;
        
        return SafeClickWidget(
          onTap: isEnabled ? _register : null,
          cooldownDuration: const Duration(milliseconds: 500),
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
                      AppStrings.registerButton,
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

  Widget _buildSignInLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.alreadyHaveAccount,
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
          onPressed: () => context.go(AppRoutes.login),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            AppStrings.signInLink,
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