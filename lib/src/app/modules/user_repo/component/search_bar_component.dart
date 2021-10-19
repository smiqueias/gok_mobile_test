import 'package:flutter/material.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/component/search_bar_input_component.dart';

import 'filter_list_icon_component.dart';

class SearchBarComponent extends StatelessWidget {
  final Size size;
  final TextEditingController searchBarInputController;

  const SearchBarComponent(
      {Key? key, required this.size, required this.searchBarInputController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SearchBarInputComponent(
          size: size,
          searchBarInputController: searchBarInputController,
        ),
        FilterListIconComponent(size: size),
      ],
    );
  }
}
