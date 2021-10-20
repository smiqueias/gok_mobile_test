import 'package:flutter/material.dart';
import '../../../app_colors.dart';

class StarIconComponent extends StatelessWidget {
  final Size size;
  final int index;
  final dynamic state;

  const StarIconComponent({
    Key? key,
    required this.size,
    required this.index,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: state.userRepoModel[index].stargazersCount > 0,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 24.0,
          right: 32.0,
        ),
        child: Container(
          height: (24 / size.height) * size.height,
          width: (24 / size.width) * size.width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.backgroundStarColor.withOpacity(0.16),
          ),
          child: const Icon(
            Icons.star,
            size: 16,
            color: AppColors.starColor,
          ),
        ),
      ),
    );
  }
}
