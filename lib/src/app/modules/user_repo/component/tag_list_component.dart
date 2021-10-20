import 'package:flutter/material.dart';

import '../../../app_colors.dart';

class TagListComponent extends StatelessWidget {
  final List<String> tags;

  const TagListComponent({Key? key, required this.tags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: const EdgeInsets.only(top: 8.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: tags.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 7.98,
              ),
              child: Chip(
                visualDensity: VisualDensity.adaptivePlatformDensity,
                backgroundColor: AppColors.grey.withOpacity(0.1),
                label: Text(
                  tags[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
