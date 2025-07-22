import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../../core/error/failures.dart';
import '../../../../domain/usecases/base/usecase.dart';
import '../../data/models/movie_model.dart';
import '../repositories/movie_repository.dart';

@injectable
class ToggleFavoriteUseCase implements UseCase<MovieModel, ToggleFavoriteParams> {
  final MovieRepository repository;

  const ToggleFavoriteUseCase(this.repository);

  @override
  Future<Either<Failure, MovieModel>> call(ToggleFavoriteParams params) async {
    try {
      final response = await repository.toggleFavorite(params.movieId);
      final isFavorite = response.action == 'favorited';
      return Right(response.movie.copyWith(isFavorite: isFavorite));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

class ToggleFavoriteParams extends Equatable {
  final String movieId;

  const ToggleFavoriteParams({required this.movieId});

  @override
  List<Object?> get props => [movieId];
} 