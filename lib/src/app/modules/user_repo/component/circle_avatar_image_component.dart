import 'package:flutter/material.dart';
import 'package:gok_mobile_test/src/app/utils/user_dto.dart';

class CirculeAvatarImageComponent extends StatelessWidget {
  final UserDTO userDTO;

  const CirculeAvatarImageComponent({Key? key, required this.userDTO})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.network(
          userDTO.avatarUrl.toString(),
          height: 32,
          width: 32,
        ),
      ),
    );
  }
}
