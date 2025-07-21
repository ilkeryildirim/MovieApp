import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/usecases/base/usecase.dart';
import '../../../../core/error/failures.dart';
import '../entities/profile.dart';
import '../repositories/profile_repository.dart';

@injectable
class RefreshProfileUseCase implements UseCase<Profile, NoParams> {
  final ProfileRepository repository;

  RefreshProfileUseCase(this.repository);

  @override
  Future<Either<Failure, Profile>> call(NoParams params) async {
    return await repository.refreshProfile();
  }
} 