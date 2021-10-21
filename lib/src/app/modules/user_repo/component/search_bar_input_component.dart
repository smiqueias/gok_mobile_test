import 'package:flutter/material.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/cubit/user_repo_cubit.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../app_colors.dart';

class SearchBarInputComponent extends StatelessWidget {
  final Size size;
  final TextEditingController searchBarInputController;
  final dynamic state;
  final UserRepoCubit userRepoCubit;

  const SearchBarInputComponent({
    Key? key,
    required this.size,
    required this.searchBarInputController,
    required this.userRepoCubit,
    required this.state,
    onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 16,
        top: 8,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: .08,
            spreadRadius: 0.0,
            offset: const Offset(
              0.0,
              0.08,
            ),
          )
        ],
      ),
      height: (40 / size.height) * size.height,
      width: (287 / size.width) * size.width,
      child: TextField(
        controller: searchBarInputController,
        onChanged: (value) => userRepoCubit.onSubmitted(value),
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            size: 24,
          ),
          border: InputBorder.none,
          hintText: "Buscar um repositório...",
          hintStyle: GoogleFonts.roboto(
            fontSize: 16,
            color: AppColors.grey,
          ),
        ),
      ),
    );
  }
}
