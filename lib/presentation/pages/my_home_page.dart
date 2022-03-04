import 'package:bloc_post_request/presentation/bloc/user_bloc.dart';
import 'package:bloc_post_request/presentation/pages/widgets/user_create_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final UserBloc userBloc = UserBloc();

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              if (nameController.text.isNotEmpty &&
                  jobController.text.isNotEmpty) {
                userBloc.add(
                  UserEditEvent(
                      name: nameController.text, job: nameController.text),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Заполните поля'),
                  duration: Duration(seconds: 1),
                ));
              }
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
          ),
          IconButton(
            onPressed: () {
              if (nameController.text.isNotEmpty &&
                  jobController.text.isNotEmpty) {
                userBloc.add(
                  UserCreateEvent(
                      name: nameController.text, job: jobController.text),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Заполните поля')));
              }
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: BlocProvider<UserBloc>(
        create: (context) => userBloc,
        child: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is UserInitialState) {
              return UserCreateWidget(
                  nameController: nameController, jobController: jobController);
            } else if (state is UserCreatedState) {
              return UserLoadedWidget(
                state: state,
              );
            } else if (state is UserLoadingState) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is UserEditedState) {
              return UserLoadedWidget(
                state: state,
              );
            } else {
              return const Text('Incorect State');
            }
          },
        ),
      ),
    );
  }
}

class UserLoadedWidget extends StatelessWidget {
  final state;
  const UserLoadedWidget({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: ListTile(
                leading: const Text('Name'),
                title: Text('${state.user.name}'),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Text(
                  'Job',
                  style: TextStyle(),
                ),
                title: Text('Job:${state.user.job}'),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Text('Update date:'),
                title: Text(
                    '${DateFormat('yyyy-MM-dd').parse(state.user.createdAt!)}'),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<UserBloc>().add(UserGetBackEvent());
                },
                child: const Text('Назад'))
          ],
        ),
      ),
    );
  }
}
