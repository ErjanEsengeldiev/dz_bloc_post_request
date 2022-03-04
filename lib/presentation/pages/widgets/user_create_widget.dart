import 'package:bloc_post_request/presentation/pages/widgets/custom_textfild.dart';
import 'package:flutter/material.dart';


class UserCreateWidget extends StatelessWidget {
  const UserCreateWidget({
    Key? key,
    required this.nameController,
    required this.jobController,
  }) : super(key: key);

  final TextEditingController nameController;
  final TextEditingController jobController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            hintText: 'Name',
            controller: nameController,
          ),
          const SizedBox(height: 40),
          CustomTextField(
            controller: jobController,
            hintText: 'Job',
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
