part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class UserCreateEvent extends UserEvent {
  final String name;
  final String job;

  UserCreateEvent({required this.name, required this.job});
}
