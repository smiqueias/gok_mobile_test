import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../app_colors.dart';

class UserInfoComponent extends StatelessWidget {
  final Size size;
  final dynamic state;

  const UserInfoComponent({Key? key, required this.size, required this.state})
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
                    Row(
                      children: [
                        Visibility(
                          visible: state.userModel.twitterUsername != null,
                          child: const Text("@"),
                        ),
                        Text(
                            state.userModel.twitterUsername ?? "Não informado"),
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
    );
  }
}
