part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoaded extends UserState {
  User user;

  UserLoaded(this.user);

  @override
  List<Object> get props => [user];
}

final class UserLoadingFailed extends UserState {
  String message;

  UserLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}