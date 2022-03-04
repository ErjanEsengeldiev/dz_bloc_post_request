import 'package:bloc/bloc.dart';
import 'package:bloc_post_request/data/entity/user/user.dart';
import 'package:bloc_post_request/domain/user_api_request/user_api_requset.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitialState()) {
    on<UserCreateEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        emit(UserCreatedState(await UserApiProvider()
            .postUser(name: event.name, job: event.job)));
      } catch (eror) {
        throw Exception('Eror post User');
      }
    });
    on<UserEditEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        emit(UserEditedState(
            await UserApiProvider().putUser(name: event.name, job: event.job)));
      } catch (eror) {
        throw Exception('Eror put User');
      }
    });
    on<UserDelateEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        emit(UserDelateState());
      } catch (eror) {
        throw Exception('Eror convert User');
      }
    });
    on<UserGetBackEvent>((event, emit) {
      emit(UserInitialState());
    });
  }
}
