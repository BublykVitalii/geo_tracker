part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  loading,
  success,
  error,
}

class HomeState {
  final HomeStatus status;
  final String? errorMessage;
  final String email;
  final String name;
  final String photo;

  HomeState({
    this.errorMessage,
    this.status = HomeStatus.initial,
    this.email = '',
    this.name = '',
    this.photo = '',
  });

  HomeState copyWith({
    HomeStatus? status,
    String? errorMessage,
    String? email,
    String? name,
    String? photo,
  }) {
    return HomeState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      email: email ?? this.email,
      name: name ?? this.name,
      photo: photo ?? this.photo,
    );
  }

  @override
  String toString() {
    return 'HomeState {  status: $status, errorMessage: $errorMessage, email: $email, name: $name, photo: $photo,';
  }

  List<Object?> get props => [
        status,
        errorMessage,
        email,
        name,
        photo,
      ];
}
