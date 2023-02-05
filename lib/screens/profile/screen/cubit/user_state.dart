part of 'user_cubit.dart';

enum UserStatus {
  initial,
  loading,
  success,
  error,
}

class UserState {
  final UserStatus status;
  final String? errorMessage;
  final String email;
  final String name;
  final String photo;

  UserState({
    this.errorMessage,
    this.status = UserStatus.initial,
    this.email = '',
    this.name = '',
    this.photo = '',
  });

  UserState copyWith({
    UserStatus? status,
    String? errorMessage,
    String? email,
    String? name,
    String? photo,
  }) {
    return UserState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      email: email ?? this.email,
      name: name ?? this.name,
      photo: photo ?? this.photo,
    );
  }

  @override
  String toString() {
    return 'UserState {  status: $status, errorMessage: $errorMessage, email: $email, name: $name, photo: $photo,';
  }

  List<Object?> get props => [
        status,
        errorMessage,
        email,
        name,
        photo,
      ];
}
