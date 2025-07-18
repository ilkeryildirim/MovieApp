import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/usecases/auth/login_usecase.dart';
import '../../../domain/usecases/auth/register_usecase.dart';
import '../../../domain/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final AuthRepository authRepository;
  
  AuthBloc({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.authRepository,
  }) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.when(
        checkAuthStatus: () => _onCheckAuthStatus(emit),
        login: (email, password) => _onLogin(emit, email, password),
        register: (email, password, name) => _onRegister(emit, email, password, name),
        logout: () => _onLogout(emit),
        updateUser: (user) => _onUpdateUser(emit, user),
      );
    });
  }
  
  Future<void> _onCheckAuthStatus(Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    
    final result = await authRepository.isAuthenticated();
    
    await result.fold(
      (failure) async => emit(const AuthState.unauthenticated()),
      (isAuthenticated) async {
        if (isAuthenticated) {
          final userResult = await authRepository.getCurrentUser();
          userResult.fold(
            (failure) => emit(const AuthState.unauthenticated()),
            (user) => emit(AuthState.authenticated(user)),
          );
        } else {
          emit(const AuthState.unauthenticated());
        }
      },
    );
  }
  
  Future<void> _onLogin(
    Emitter<AuthState> emit,
    String email,
    String password,
  ) async {
    emit(const AuthState.loading());
    
    final result = await loginUseCase(
      LoginParams(email: email, password: password),
    );
    
    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (user) => emit(AuthState.authenticated(user)),
    );
  }
  
  Future<void> _onRegister(
    Emitter<AuthState> emit,
    String email,
    String password,
    String name,
  ) async {
    emit(const AuthState.loading());
    
    final result = await registerUseCase(
      RegisterParams(email: email, password: password, name: name),
    );
    
    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (user) => emit(AuthState.authenticated(user)),
    );
  }
  
  Future<void> _onLogout(Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    
    final result = await authRepository.logout();
    
    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (_) => emit(const AuthState.unauthenticated()),
    );
  }
  
  Future<void> _onUpdateUser(
    Emitter<AuthState> emit,
    User user,
  ) async {
    if (state is _Authenticated) {
      emit(AuthState.authenticated(user));
    }
  }
} 