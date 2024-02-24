// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pokebook/core/constants/app_colors.dart';
import 'package:pokebook/core/constants/text_constants.dart';
import 'package:pokebook/features/pokemon/domain/usecases/get_pokemon_list_usecase.dart';
import 'package:pokebook/features/pokemon/presensation/blocs/theme_cubit/theme_cubit.dart';
import 'package:pokebook/features/pokemon/presensation/widgets/custom_rich_text.dart';
import 'package:pokebook/features/pokemon/presensation/widgets/pokemon_image.dart';
import 'package:pokebook/features/pokemon/presensation/widgets/pokemon_list_view.dart';
import 'package:pokebook/features/pokemon/presensation/widgets/theme_colors.dart';

class HomePage extends StatefulWidget {
  final GetPokemonListUseCase getPokemonListUseCase;

  const HomePage({
    Key? key,
    required this.getPokemonListUseCase,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isShowThemeSwitcherDialogPressed = false;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        backgroundColor: AppColors.lightGrey,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: PokemonImage(
              getPokemonListUseCase: widget.getPokemonListUseCase,
              scale: 1.5,
            ),
          ),
          title: const Row(
            children: [
              CustomRichText(
                scale: 1,
              ),
            ],
          ),
          actions: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey)),
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.only(right: 12),
              child: BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        isShowThemeSwitcherDialogPressed =
                            !isShowThemeSwitcherDialogPressed;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: state.themeColor,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(children: [
                  const Gap(24),
                  PokemonImage(
                    getPokemonListUseCase: widget.getPokemonListUseCase,
                    scale: 5,
                  ),
                  const CustomRichText(scale: 1.5),
                  const Gap(8),
                  const Text(TextConstants.homePageText,
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center),
                  const Gap(72),
                  SizedBox(
                      // height: 500,
                      child: PokemonListView(
                          getPokemonListUseCase: widget.getPokemonListUseCase)),
                  const Gap(500)
                ]),
              ),
            ),
          ],
        ),
      ),
      if (isShowThemeSwitcherDialogPressed)
        Positioned.fill(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(),
        )),
      if (isShowThemeSwitcherDialogPressed)
        Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xffe9e9e9),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 40),
            height: 200,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(
                        flex: 4,
                      ),
                      const Text(
                        'Choose Theme',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      ),
                      const Spacer(
                        flex: 3,
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              isShowThemeSwitcherDialogPressed = false;
                            });
                          },
                          icon: const Icon(Icons.close)),
                      const Spacer(),
                    ],
                  ),
                ),
                SizedBox(height: 100, width: 240, child: ThemeColors()),
              ],
            ),
          ),
        )
    ]);
  }
}
