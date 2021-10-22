import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app_colors.dart';

class UserSearchComponent extends StatelessWidget {
  const UserSearchComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 41.w,
      ),
      child: Text(
        "Buscar usuário",
        style: GoogleFonts.mulish(
          fontWeight: FontWeight.w700,
          fontSize: 22,
          color: AppColors.black,
        ),
      ),
    );
  }
}
