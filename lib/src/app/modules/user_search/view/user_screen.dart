import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gok_mobile_test/src/app/app_colors.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/components/custom_appbar_component.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app_images.dart';

class UserScreen extends StatelessWidget {
  final String name;

  const UserScreen({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SafeArea(
          child: Column(
            children: [
              const CustomAppBarComponent(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: AppColors.white,
                ),
                margin: const EdgeInsets.only(top: 200),
                width: 343,
                height: 150,
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 24,
                    top: 24,
                    right: 16,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: CircleAvatar(
                              child: Image.network(
                                'https://avatars.githubusercontent.com/u/66504737?v=4',
                                height: 64,
                                width: 64,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'Saulo Miqueias',
                                  ),
                                  IconButton(
                                    onPressed: () => {},
                                    icon: const Icon(
                                      Icons.keyboard_arrow_right_rounded,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 39,
                                  ),
                                  Container(
                                    height: 24,
                                    width: 24,
                                    decoration: const BoxDecoration(
                                      color: AppColors.greyBackground,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.delete,
                                      size: 18,
                                    ),
                                  )
                                ],
                              ),
                              Text("@johndoesantos"),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 23,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.business,
                            size: 16,
                            color: AppColors.borderColor,
                          ),
                          Text(
                            "GO.K Digital",
                            style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.grey,
                            ),
                          ),
                          const Icon(
                            Icons.place,
                            size: 16,
                            color: AppColors.borderColor,
                          ),
                          Text(
                            "São Paulo, Brazil",
                            style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.grey,
                            ),
                          ),
                          const Icon(
                            Icons.star,
                            size: 16,
                            color: AppColors.borderColor,
                          ),
                          Text(
                            "2",
                            style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.grey,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
