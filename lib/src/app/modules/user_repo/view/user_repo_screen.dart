import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/component/appbar_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/component/repo_empty_label_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/component/search_bar_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/data/cubit/user_repo_cubit.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/decks/user_repo_deck.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:gok_mobile_test/src/app/utils/user_dto.dart';

class UserRepoScreen extends StatefulWidget {
  final UserDTO userDTO;
  const UserRepoScreen({Key? key, required this.userDTO}) : super(key: key);

  @override
  State<UserRepoScreen> createState() => _UserRepoScreenState();
}

class _UserRepoScreenState extends State<UserRepoScreen> {
  Future<void> _launcLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: false, forceSafariVC: false);
    } else {
      final snackBar =
          SnackBar(content: Text("Não foi possível acessar o repopositório"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextEditingController _searchController = TextEditingController();

    List<String> tags = [
      "#TagTeste01",
      "#TagTeste02",
      "#TagTeste03",
      "#TagTeste04",
      "#TagTeste05",
    ];

    @override
    // ignore: unused_element
    void dispose() {
      _searchController.dispose();
      super.dispose();
    }

    return BlocProvider(
      create: (context) => UserRepoCubit(
        Modular.get(),
        Modular.get(),
        widget.userDTO.username,
      ),
      child: Scaffold(
        appBar: AppBarComponent(
          size: size,
          userDTO: widget.userDTO,
        ),
        body: SafeArea(
          child: BlocBuilder<UserRepoCubit, UserRepoState>(
            builder: (context, state) {
              if (state is UserRepoLoading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (state is UserRepoLoaded) {
                return state.userRepoModel.isEmpty
                    ? RepoEmptyLabelComponent(userDTO: widget.userDTO)
                    : Column(
                        children: [
                          SearchBarComponent(
                              size: size,
                              searchBarInputController: _searchController),
                          SizedBox(
                            height: (8 / size.height) * size.height,
                          ),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.userRepoModel.length,
                              itemBuilder: (context, index) {
                                return UserRepoDeck(
                                  index: index,
                                  launchLink: () => _launcLink(
                                    state.userRepoModel[index].htmlUrl,
                                  ),
                                  size: size,
                                  state: state,
                                  tags: tags,
                                  userRepoCubit: context.read<UserRepoCubit>(),
                                );
                              },
                            ),
                          ),
                        ],
                      );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
