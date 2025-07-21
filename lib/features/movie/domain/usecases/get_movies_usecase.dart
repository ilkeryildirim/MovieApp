import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../../core/error/failures.dart';
import '../../../../core/usecase.dart';
import '../../data/models/movie_model.dart';
import '../repositories/movie_repository.dart';

@injectable
class GetMoviesUseCase implements UseCase<MovieListResponse, GetMoviesParams> {
  final MovieRepository repository;

  const GetMoviesUseCase(this.repository);

  @override
  Future<Either<Failure, MovieListResponse>> call(GetMoviesParams params) async {
    try {
      final response = await repository.getMovies(
        page: params.page,
        limit: params.limit,
      );
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

class GetMoviesParams extends Equatable {
  final int page;
  final int limit;

  const GetMoviesParams({
    required this.page,
    this.limit = 20,
  });

  @override
  List<Object?> get props => [page, limit];
}

class MovieListResponse {
  final List<MovieModel> movies;
  final int currentPage;
  final int totalPages;

  const MovieListResponse({
    required this.movies,
    required this.currentPage,
    required this.totalPages,
  });

  bool get hasNextPage => currentPage < totalPages;
} 