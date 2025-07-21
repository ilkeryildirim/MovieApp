import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '{{feature_name.snakeCase()}}_event.dart';
import '{{feature_name.snakeCase()}}_state.dart';

export '{{feature_name.snakeCase()}}_event.dart';
export '{{feature_name.snakeCase()}}_state.dart';

@injectable
class {{feature_name.pascalCase()}}Bloc extends Bloc<{{feature_name.pascalCase()}}Event, {{feature_name.pascalCase()}}State> {
  {{feature_name.pascalCase()}}Bloc() : super(const {{feature_name.pascalCase()}}State.initial()) {
    on<{{feature_name.pascalCase()}}Event>((event, emit) async {
      // TODO: Implement event handlers
    });
  }
} 