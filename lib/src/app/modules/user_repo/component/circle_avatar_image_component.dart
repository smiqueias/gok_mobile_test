import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gok_mobile_test/src/app/utils/user_dto.dart';

class CirculeAvatarImageComponent extends StatelessWidget {
  final UserDTO userDTO;

  const CirculeAvatarImageComponent({Key? key, required this.userDTO})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16.0.h,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.r),
        child: Image.network(
          userDTO.avatarUrl.toString(),
          height: 32.h,
          width: 32.w,
        ),
      ),
    );
  }
}
