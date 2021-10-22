import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gok_mobile_test/src/app/app_images.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app_colors.dart';

class TagListComponent extends StatelessWidget {
  final List<String> tags;
  final Size size;

  const TagListComponent({Key? key, required this.tags, required this.size})
      : super(key: key);

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
            return Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 7.98.h,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.buttonColor.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(100.0.r),
                    ),
                    height: 21.h,
                    width: 96.w,
                    child: Center(
                      child: Text(
                        tags[index],
                        style: GoogleFonts.mulish(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: index == (tags.length - 1),
                  child: Padding(
                    padding: EdgeInsets.only(right: 6.0.w),
                    child: InkWell(
                      onTap: () => showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: Container(
                              height: 418.h,
                              width: 343.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0.r)),
                              child: Column(
                                children: [
                                  Text(
                                    "Adicionar tags",
                                    style: GoogleFonts.mulish(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22,
                                      color: AppColors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      child: Image.asset(
                        AppImages.editTagListIcon,
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
