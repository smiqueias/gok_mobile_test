import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app_colors.dart';

class SearchBarInputComponent extends StatelessWidget {
  final Size size;
  final TextEditingController searchBarInputController;

  const SearchBarInputComponent(
      {Key? key, required this.size, required this.searchBarInputController})
      : super(key: key);

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
      child: Form(
        child: TextFormField(
          controller: searchBarInputController,
          onChanged: (value) {
            print(value);
          },
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
      ),
    );
  }
}
