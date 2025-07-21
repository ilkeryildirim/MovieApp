import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection_container.dart';
import '../blocs/{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}_bloc.dart';

class {{feature_name.pascalCase()}}Page extends StatelessWidget {
  const {{feature_name.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<{{feature_name.pascalCase()}}Bloc>()
        ..add(const {{feature_name.pascalCase()}}Event.started()),
      child: const {{feature_name.pascalCase()}}View(),
    );
  }
}

class {{feature_name.pascalCase()}}View extends StatelessWidget {
  const {{feature_name.pascalCase()}}View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('{{feature_name.titleCase()}}'),
      ),
      body: BlocBuilder<{{feature_name.pascalCase()}}Bloc, {{feature_name.pascalCase()}}State>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('Initial')),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: () => const Center(child: Text('Loaded')),
            error: (message) => Center(child: Text('Error: $message')),
          );
        },
      ),
    );
  }
} 