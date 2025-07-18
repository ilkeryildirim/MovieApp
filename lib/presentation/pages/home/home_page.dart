import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/widgets/lottie_widget.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../../router/app_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          unauthenticated: () => context.go(AppRoutes.login),
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.translates.home),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Navigate to settings
              },
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                _showLogoutDialog(context);
              },
            ),
          ],
        ),
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return state.maybeWhen(
              authenticated: (user) => _buildContent(context, user.name),
              orElse: () => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, String userName) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildUserCard(context, userName),
          const SizedBox(height: 24),
          _buildQuickActionsTitle(context),
          const SizedBox(height: 16),
          _buildQuickActionsGrid(context),
        ],
      ),
    );
  }

  Widget _buildUserCard(BuildContext context, String userName) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            _buildUserAvatar(context, userName),
            const SizedBox(width: 16),
            _buildUserInfo(context, userName),
          ],
        ),
      ),
    );
  }

  Widget _buildUserAvatar(BuildContext context, String userName) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: context.colorScheme.primary,
      child: Text(
        userName.isNotEmpty ? userName[0].toUpperCase() : 'U',
        style: context.textTheme.headlineMedium?.copyWith(
          color: context.colorScheme.onPrimary,
        ),
      ),
    );
  }

  Widget _buildUserInfo(BuildContext context, String userName) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.translates.welcomeBackComma,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          Text(
            userName,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionsTitle(BuildContext context) {
    return Text(
      AppStrings.translates.quickActions,
      style: context.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildQuickActionsGrid(BuildContext context) {
    return Expanded(
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          int crossAxisCount;
          
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
            crossAxisCount = 4;
          } else if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
            crossAxisCount = 3;
          } else {
            crossAxisCount = 2;
          }
          
          return GridView.count(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              _buildActionCard(
                context,
                icon: Icons.person,
                title: AppStrings.translates.profile,
                onTap: () {
                  // Navigate to profile
                },
              ),
              _buildActionCard(
                context,
                icon: Icons.notifications,
                title: AppStrings.translates.notifications,
                onTap: () {
                  // Navigate to notifications
                },
              ),
              _buildActionCard(
                context,
                icon: Icons.security,
                title: AppStrings.translates.security,
                onTap: () {
                  // Navigate to security settings
                },
              ),
              _buildActionCard(
                context,
                icon: Icons.help,
                title: AppStrings.translates.help,
                onTap: () {
                  // Navigate to help
                },
              ),
              // Lottie Demo Cards
              _buildLottieCard(
                context,
                title: 'Success Demo',
                lottieWidget: const SuccessLottie(size: 60),
                onTap: () {
                  _showSuccessDialog(context);
                },
              ),
              _buildLottieCard(
                context,
                title: 'Error Demo',
                lottieWidget: const ErrorLottie(size: 60),
                onTap: () {
                  _showErrorDialog(context);
                },
              ),
              _buildLottieCard(
                context,
                title: 'Loading Demo',
                lottieWidget: const LoadingLottie(size: 60),
                onTap: () {
                  _showLoadingDialog(context);
                },
              ),
              _buildLottieCard(
                context,
                title: 'Empty Demo',
                lottieWidget: const EmptyStateLottie(size: 60),
                onTap: () {
                  _showEmptyDialog(context);
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildActionCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48,
                color: context.colorScheme.primary,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: context.textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLottieCard(
    BuildContext context, {
    required String title,
    required Widget lottieWidget,
    required VoidCallback onTap,
  }) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              lottieWidget,
              const SizedBox(height: 8),
              Text(
                title,
                style: context.textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SuccessLottie(size: 100),
              const SizedBox(height: 16),
              Text(
                'Success!',
                style: context.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Operation completed successfully.',
                style: context.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ErrorLottie(size: 100),
              const SizedBox(height: 16),
              Text(
                'Error!',
                style: context.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Something went wrong. Please try again.',
                style: context.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        // Auto close after 3 seconds
        Future.delayed(const Duration(seconds: 3), () {
          if (Navigator.canPop(dialogContext)) {
            Navigator.of(dialogContext).pop();
          }
        });

        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const LoadingLottie(size: 100),
              const SizedBox(height: 16),
              Text(
                'Loading...',
                style: context.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Please wait while we process your request.',
                style: context.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }

  void _showEmptyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const EmptyStateLottie(size: 100),
              const SizedBox(height: 16),
              Text(
                'No Data',
                style: context.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'No items found. Try refreshing or adding new content.',
                style: context.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(AppStrings.translates.logout),
          content: Text(AppStrings.translates.areYouSureYouWantToLogout),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(AppStrings.translates.cancel),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                context.read<AuthBloc>().add(const AuthEvent.logout());
              },
              child: Text(AppStrings.translates.logout),
            ),
          ],
        );
      },
    );
  }
} 