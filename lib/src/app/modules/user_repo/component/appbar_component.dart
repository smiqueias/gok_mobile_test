import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gok_mobile_test/src/app/utils/user_dto.dart';

import '../../../app_colors.dart';
import 'circle_avatar_image_component.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  final UserDTO userDTO;
  final Size size;

  const AppBarComponent({Key? key, required this.userDTO, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: AppColors.white,
      toolbarHeight: 72.h,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.arrow_back,
          size: 32,
        ),
      ),
      actions: [
        Row(
          children: [
            CirculeAvatarImageComponent(
              userDTO: userDTO,
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
