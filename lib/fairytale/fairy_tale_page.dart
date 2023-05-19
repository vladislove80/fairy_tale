import 'package:fairy_tale/fairytale/animated_sliver_app_bar.dart';
import 'package:fairy_tale/theme/app_them.dart';
import 'package:fairy_tale/fairytale/bloc/plot_options_cubit.dart';
import 'package:fairy_tale/fairytale/bloc/plot_options_state.dart';
import 'package:fairy_tale/widget/plot_option/plot_options_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FairyTalePage extends StatefulWidget {
  const FairyTalePage({super.key, required this.title});

  final String title;

  @override
  State<FairyTalePage> createState() => _FairyTalePageState();
}

class _FairyTalePageState extends State<FairyTalePage> {
  late final ScrollController scrollController;
  static const expandedBarHeight = 350.0;
  static const collapsedBarHeight = 140.0;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<PlotOptionsCubit>(
        create: (_) => PlotOptionsCubit(),
        child: BlocBuilder<PlotOptionsCubit, PlotOptionsState>(
            builder: (context, state) {
          if (state is! PlotOptionsLoadedState) {
            return const CircularProgressIndicator();
          } else {
            return CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: AnimatedSliverAppBar(
                    title: state.fairyTale.chapterNumber,
                    expandedBarHeight: expandedBarHeight,
                    collapsedBarHeight: collapsedBarHeight,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                state.fairyTale.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 30,
                                  height: 1.25,
                                ),
                              ),
                            ),
                            const Text(
                              chapterText,
                              style: TextStyle(
                                  fontFamily: AppTheme.fontFamilyTilda,
                                  height: 1.65,
                                  color: Color(0xff6D7885)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      if (state.fairyTale.plotOptions != null)
                        PlotOptionsWidget(
                          arguments: state.fairyTale.plotOptions!,
                          onOptionSelected: (optionText) {
                            PlotOptionsCubit.of(context)
                                .switchPlotOption(optionText);
                          },
                        ),
                    ],
                  ),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
