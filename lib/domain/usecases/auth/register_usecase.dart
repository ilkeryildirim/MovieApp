import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../core/error/failures.dart';
import '../../entities/user.dart';
import '../../repositories/auth_repository.dart';
import '../base/usecase.dart';

@injectable
class RegisterUseCase implements UseCase<User, RegisterParams> {
  final AuthRepository repository;
  
  const RegisterUseCase(this.repository);
  
  @override
  Future<Either<Failure, User>> call(RegisterParams params) async {
    return await repository.register(
      email: params.email,
      password: params.password,
      name: params.name,
    );
  }
}

class RegisterParams extends Equatable {
  final String email;
  final String password;
  final String name;
  
  const RegisterParams({
    required this.email,
    required this.password,
    required this.name,
  });
  
  @override
  List<Object?> get props => [email, password, name];
} 