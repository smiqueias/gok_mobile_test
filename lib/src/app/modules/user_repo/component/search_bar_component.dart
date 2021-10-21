import 'package:flutter/material.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/component/search_bar_input_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/cubit/user_repo_cubit.dart';

import 'filter_list_icon_component.dart';

class SearchBarComponent extends StatelessWidget {
  final Size size;
  final TextEditingController searchBarInputController;
  final dynamic state;
  final UserRepoCubit userRepoCubit;

  const SearchBarComponent({
    Key? key,
    required this.size,
    required this.searchBarInputController,
    required this.state,
    required this.userRepoCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SearchBarInputComponent(
          size: size,
          searchBarInputController: searchBarInputController,
          userRepoCubit: userRepoCubit,
          state: state,
        ),
        FilterListIconComponent(size: size),
      ],
    );
  }
}
