import 'package:flutter/material.dart';

import '../../../app_colors.dart';

class FilterListIconComponent extends StatelessWidget {
  final Size size;

  const FilterListIconComponent({Key? key, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 8.0,
        top: 8.0,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(4.0),
      ),
      height: (40 / size.height) * size.height,
      width: (40 / size.width) * size.width,
      child: const Center(
        child: Icon(
          Icons.filter_list,
          size: 24,
        ),
      ),
    );
  }
}
