import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gok_mobile_test/src/app/utils/user_dto.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../app_colors.dart';

class UserInfoComponent extends StatelessWidget {
  final Size size;
  final dynamic state;
  final String username;

  const UserInfoComponent(
      {Key? key,
      required this.size,
      required this.state,
      required this.username})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: AppColors.white,
      ),
      margin: const EdgeInsets.only(top: 200),
      width: (343 / size.width) * size.width,
      height: (150 / size.height) * size.height,
      child: InkWell(
        onTap: () => Modular.to.pushNamed(
          '/repo/',
          arguments: UserDTO(state.userModel.avatarUrl, username),
        ),
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
                        state.userModel.avatarUrl,
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
                          Text(
                            state.userModel.login,
                          ),
                          const Icon(
                            Icons.keyboard_arrow_right_rounded,
                            color: AppColors.black,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Visibility(
                            visible: state.userModel.twitterUsername != null,
                            child: const Text("@"),
                          ),
                          Text(state.userModel.twitterUsername ??
                              "Não informado"),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 23,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.business,
                    size: 16,
                    color: AppColors.borderColor,
                  ),
                  Text(
                    state.userModel.company ?? "Não informado",
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
                    state.userModel.location ?? "Não informado",
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
                    state.userModel.followers.toString(),
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
      ),
    );
  }
}
