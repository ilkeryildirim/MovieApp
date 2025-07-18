import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/extensions/string_extensions.dart';
import '../../../core/widgets/lottie_widget.dart';
import '../../../core/widgets/safe_click_widget.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../../router/app_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      context.unfocus();
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
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            authenticated: (_) => context.go(AppRoutes.home),
            error: (message) => context.showErrorSnackBar(message),
            orElse: () {},
          );
        },
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24.w),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildHeader(context),
                    SizedBox(height: 48.h),
                    _buildFormFields(),
                    SizedBox(height: 24.h),
                    _buildLoginButton(),
                    SizedBox(height: 16.h),
                    _buildBottomLinks(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.flutter_dash,
          size: 80.sp,
          color: context.colorScheme.primary,
        ),
        SizedBox(height: 16.h),
        Text(
          AppStrings.translates.welcomeBack,
          style: context.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.h),
        Text(
          AppStrings.translates.signInToContinue,
          style: context.textTheme.bodyLarge?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
            fontSize: 16.sp,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildFormFields() {
    return Column(
      children: [
        _buildEmailField(),
        SizedBox(height: 16.h),
        _buildPasswordField(),
      ],
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: AppStrings.translates.email,
        hintText: AppStrings.translates.enterYourEmail,
        prefixIcon: const Icon(Icons.email_outlined),
      ),
      validator: (value) {
        if (value.isNullOrEmpty) {
          return AppStrings.translates.pleaseEnterYourEmail;
        }
        if (!value.isEmail) {
          return AppStrings.translates.pleaseEnterValidEmail;
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: !_isPasswordVisible,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (_) => _login(),
              decoration: InputDecoration(
          labelText: AppStrings.translates.password,
          hintText: AppStrings.translates.enterYourPassword,
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible
                ? Icons.visibility_off
                : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
      ),
      validator: (value) {
        if (value.isNullOrEmpty) {
          return AppStrings.translates.pleaseEnterYourPassword;
        }
        if (value!.length < 6) {
          return AppStrings.translates.passwordMustBeAtLeast6Characters;
        }
        return null;
      },
    );
  }

  Widget _buildLoginButton() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );
        return SafeButton.elevated(
          onPressed: isLoading ? null : _login,
          child: isLoading
              ? const LoadingLottie(size: 24)
              : Text(AppStrings.translates.login),
        );
      },
    );
  }

  Widget _buildBottomLinks(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.translates.dontHaveAnAccount,
              style: context.textTheme.bodyMedium,
            ),
            TextButton(
              onPressed: () {
                // Navigate to register page
              },
              child: Text(AppStrings.translates.signUp),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            // Navigate to forgot password
          },
          child: Text(AppStrings.translates.forgotPassword),
        ),
      ],
    );
  }
} 