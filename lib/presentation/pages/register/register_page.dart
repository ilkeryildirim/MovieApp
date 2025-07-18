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

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _register() {
    if (_formKey.currentState?.validate() ?? false) {
      context.unfocus();
      context.read<AuthBloc>().add(
        AuthEvent.register(
          email: _emailController.text.trim(),
          password: _passwordController.text,
          name: _nameController.text.trim(),
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
                    _buildRegisterButton(),
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
          Icons.person_add,
          size: 80.sp,
          color: context.colorScheme.primary,
        ),
        SizedBox(height: 16.h),
        Text(
                      AppStrings.createAccount,
          style: context.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.h),
        Text(
                      AppStrings.signUpToGetStarted,
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
        _buildNameField(),
        SizedBox(height: 16.h),
        _buildEmailField(),
        SizedBox(height: 16.h),
        _buildPasswordField(),
        SizedBox(height: 16.h),
        _buildConfirmPasswordField(),
      ],
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      controller: _nameController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
                    labelText: AppStrings.name,
            hintText: AppStrings.enterYourName,
        prefixIcon: const Icon(Icons.person_outline),
      ),
      validator: (value) {
        if (value.isNullOrEmpty) {
          return AppStrings.pleaseEnterYourName;
        }
        if (value!.length < 2) {
          return AppStrings.nameMustBeAtLeast2Characters;
        }
        return null;
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
                    labelText: AppStrings.email,
            hintText: AppStrings.enterYourEmail,
        prefixIcon: const Icon(Icons.email_outlined),
      ),
      validator: (value) {
        if (value.isNullOrEmpty) {
          return AppStrings.pleaseEnterYourEmail;
        }
        if (!value.isEmail) {
          return AppStrings.pleaseEnterValidEmail;
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: !_isPasswordVisible,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
                    labelText: AppStrings.password,
            hintText: AppStrings.enterYourPassword,
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
          return AppStrings.pleaseEnterYourPassword;
        }
        if (value!.length < 6) {
          return AppStrings.passwordMustBeAtLeast6Characters;
        }
        return null;
      },
    );
  }

  Widget _buildConfirmPasswordField() {
    return TextFormField(
      controller: _confirmPasswordController,
      obscureText: !_isConfirmPasswordVisible,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (_) => _register(),
      decoration: InputDecoration(
                    labelText: AppStrings.confirmPassword,
            hintText: AppStrings.confirmYourPassword,
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          icon: Icon(
            _isConfirmPasswordVisible
                ? Icons.visibility_off
                : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
            });
          },
        ),
      ),
      validator: (value) {
        if (value.isNullOrEmpty) {
          return AppStrings.pleaseConfirmYourPassword;
        }
        if (value != _passwordController.text) {
          return AppStrings.passwordsDoNotMatch;
        }
        return null;
      },
    );
  }

  Widget _buildRegisterButton() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );
        return SafeButton.elevated(
          onPressed: isLoading ? null : _register,
          child: isLoading
              ? const LoadingLottie(size: 24)
              : Text(AppStrings.register),
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
              AppStrings.alreadyHaveAnAccount,
              style: context.textTheme.bodyMedium,
            ),
            TextButton(
              onPressed: () => context.go(AppRoutes.login),
              child: Text(AppStrings.login),
            ),
          ],
        ),
      ],
    );
  }
} 