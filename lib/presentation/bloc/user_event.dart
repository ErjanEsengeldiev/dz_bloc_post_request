part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class UserCreateEvent extends UserEvent {
  final String name;
  final String job;

  UserCreateEvent({required this.name, required this.job});
}

class UserDelateEvent extends UserEvent {}

class UserGetBackEvent extends UserEvent {}

class UserEditEvent extends UserEvent {
  final String name;
  final String job;

  UserEditEvent({required this.name, required this.job});
}
