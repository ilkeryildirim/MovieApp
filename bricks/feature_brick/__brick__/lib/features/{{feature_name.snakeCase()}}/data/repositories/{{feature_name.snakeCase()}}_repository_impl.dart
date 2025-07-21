import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/repositories/{{feature_name.snakeCase()}}_repository.dart';

@Injectable(as: {{feature_name.pascalCase()}}Repository)
class {{feature_name.pascalCase()}}RepositoryImpl implements {{feature_name.pascalCase()}}Repository {
  {{feature_name.pascalCase()}}RepositoryImpl();

  // TODO: Implement repository methods
} 