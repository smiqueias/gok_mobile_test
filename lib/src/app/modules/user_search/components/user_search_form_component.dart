import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validatorless/validatorless.dart';

import '../../../app_colors.dart';

class UserSearchFormComponent extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController textEditingController;

  const UserSearchFormComponent(
      {Key? key, required this.formKey, required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 40.h,
        vertical: 32.w,
      ),
      child: Form(
        key: formKey,
        child: TextFormField(
          controller: textEditingController,
          keyboardType: TextInputType.name,
          cursorColor: AppColors.grey,
          validator: Validatorless.multiple([
            Validatorless.required("Preencha este campo"),
          ]),
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.borderColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0.r),
                borderSide: const BorderSide(
                  color: AppColors.borderColor,
                ),
              ),
              hintText: "@username",
              hintStyle: GoogleFonts.roboto(
                color: AppColors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
              prefixIcon: const Icon(
                Icons.account_circle,
                color: AppColors.iconColor,
              )),
        ),
      ),
    );
  }
}
