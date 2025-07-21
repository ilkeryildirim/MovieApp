import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../domain/usecases/base/usecase.dart';
import '../../../../../../core/error/failures.dart';

// TODO: Rename this use case and implement your business logic
@injectable
class Example{{feature_name.pascalCase()}}UseCase implements UseCase<String, Example{{feature_name.pascalCase()}}Params> {
  Example{{feature_name.pascalCase()}}UseCase();

  @override
  Future<Either<Failure, String>> call(Example{{feature_name.pascalCase()}}Params params) async {
    try {
      // TODO: Implement your use case logic here
      return const Right('Success');
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

class Example{{feature_name.pascalCase()}}Params extends Equatable {
  // TODO: Add your parameters here
  const Example{{feature_name.pascalCase()}}Params();

  @override
  List<Object?> get props => [];
} 