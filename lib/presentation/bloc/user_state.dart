part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserCreatedState extends UserState {
  final User user;

  UserCreatedState(this.user);
}

class UserDelateState extends UserState{}

class UserEditedState extends UserState {
  final UserEdit user;

  UserEditedState(this.user);
}