import 'package:flutter/material.dart';
import 'package:gok_mobile_test/src/app/utils/user_dto.dart';
import 'package:google_fonts/google_fonts.dart';

class RepoEmptyLabelComponent extends StatelessWidget {
  final UserDTO userDTO;

  const RepoEmptyLabelComponent({Key? key, required this.userDTO})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "${userDTO.username} não possui repositorios criados ou públicos.",
        style: GoogleFonts.mulish(
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
    );
  }
}
