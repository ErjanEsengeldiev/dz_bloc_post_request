import 'package:bloc_post_request/presentation/bloc/user_bloc.dart';
import 'package:bloc_post_request/presentation/pages/widgets/custom_elevated_button.dart';
import 'package:bloc_post_request/presentation/pages/widgets/custom_textfild.dart';
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
      appBar: AppBar(title: const Text('Create New User')),
      body: BlocProvider<UserBloc>(
        create: (context) => userBloc,
        child: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is UserInitialState) {
              return UserCreateWidget(
                  nameController: nameController, jobController: jobController);
            } else if (state is UserCreatedState) {
              return Column(
                children: [
                  Text('Name:${state.user.name}'),
                  Text('Name:${state.user.job}'),
                  Text('Name:${DateFormat('yyyy-MM-dd').parse(state.user.createdAt!)}'),
                ],
              );
            } else if (state is UserLoadingState) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
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
