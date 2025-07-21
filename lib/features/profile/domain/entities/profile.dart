import 'package:equatable/equatable.dart';
import '../../../auth/domain/entities/user.dart';
import '../../../movie/data/models/movie_model.dart';

class Profile extends Equatable {
  final User user;
  final List<MovieModel> favoriteMovies;
  final bool isLoading;
  final String? error;

  const Profile({
    required this.user,
    required this.favoriteMovies,
    this.isLoading = false,
    this.error,
  });

  @override
  List<Object?> get props => [user, favoriteMovies, isLoading, error];

  Profile copyWith({
    User? user,
    List<MovieModel>? favoriteMovies,
    bool? isLoading,
    String? error,
  }) {
    return Profile(
      user: user ?? this.user,
      favoriteMovies: favoriteMovies ?? this.favoriteMovies,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
} 