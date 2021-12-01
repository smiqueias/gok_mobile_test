import 'package:flutter/material.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/components/search_bar_input_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/cubit/user_repo_cubit.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/data/models/user_repo_model.dart';
import 'package:gok_mobile_test/src/app/utils/user_dto.dart';
import 'package:google_fonts/google_fonts.dart';

class RepoEmptyLabelComponent extends StatelessWidget {
  final UserDTO userDTO;
  final Size size;
  final List<UserRepoModel> state;
  final TextEditingController searchController;
  final String label;
  final UserRepoCubit userRepoCubit;
  const RepoEmptyLabelComponent({
    Key? key,
    required this.userDTO,
    required this.size,
    required this.searchController,
    required this.userRepoCubit,
    required this.state,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SearchBarInputComponent(
            searchBarInputController: searchController,
            size: size,
            userRepoCubit: userRepoCubit,
            state: state,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Text(
            label,
            style: GoogleFonts.mulish(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
