import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../../../auth/domain/entities/user.dart';
import '../../../auth/domain/repositories/auth_repository.dart';
import '../../../movie/data/models/movie_model.dart';
import '../../../movie/presentation/blocs/favorite/favorite_bloc.dart';

@injectable
class ProfileViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;
  final FavoriteBloc _favoriteBloc;
  
  User? _currentUser;
  List<MovieModel> _favoriteMovies = [];
  bool _isLoading = false;
  String? _errorMessage;
  
  User? get currentUser => _currentUser;
  List<MovieModel> get favoriteMovies => _favoriteMovies;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  int get favoriteMoviesCount => _favoriteMovies.length;
  
  ProfileViewModel({
    required AuthRepository authRepository,
    required FavoriteBloc favoriteBloc,
  }) : _authRepository = authRepository,
       _favoriteBloc = favoriteBloc {
    _initialize();
  }
  
  void _initialize() {
    _loadCurrentUser();
    _listenToFavoriteBloc();
  }
  
  void _listenToFavoriteBloc() {
    _favoriteBloc.stream.listen((state) {
      state.maybeWhen(
        loaded: (movies, isSynced) {
          _favoriteMovies = movies;
          notifyListeners();
        },
        orElse: () {},
      );
    });
  }
  
  Future<void> _loadCurrentUser() async {
    _setLoading(true);
    final result = await _authRepository.getCurrentUser();
    
    result.fold(
      (failure) {
        _errorMessage = failure.message;
        _setLoading(false);
      },
      (user) {
        _currentUser = user;
        _setLoading(false);
      },
    );
  }
  
  Future<void> refresh() async {
    await _loadCurrentUser();
    _favoriteBloc.add(const FavoriteEvent.refreshFavorites());
  }
  
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
  
  @override
  void dispose() {
    super.dispose();
  }
} 