import 'package:fairy_tale/theme/icon_assets.dart';
import 'package:fairy_tale/fairytale/bloc/plot_options_state.dart';
import 'package:fairy_tale/fairytale/model/fairy_tale_model.dart';
import 'package:fairy_tale/widget/plot_option/model/plot_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlotOptionsCubit extends Cubit<PlotOptionsState> {
  static PlotOptionsCubit of(BuildContext context) =>
      BlocProvider.of<PlotOptionsCubit>(context);

  PlotOptionsCubit() : super(const PlotOptionsInitialState()) {
    emit(
      const PlotOptionsLoadedState(
        fairyTale: FairyTale(
          chapterNumber: 'Глава 2',
          title: 'Приключение принца Антара',
          chapterText: chapterText,
          plotOptions: plotOptions,
        ),
      ),
    );
  }

  void switchPlotOption(String optionText) {
    if (state is PlotOptionsLoadedState) {
      emit(
        PlotOptionsLoadedState(
          fairyTale:
              (state as PlotOptionsLoadedState).fairyTale.copyWith(optionText),
        ),
      );
    }
  }
}

const plotOptions = PlotOptions(
  title: 'Как дальше же поступит наш  принц?',
  options: [
    PlotOption('Принц пойдет налево в башню Саурона', false),
    PlotOption('Принц пойдет направо в царство Кощея Бессмертного', false),
    PlotOption('Принц останется дома и будет пить пиво', false),
    PlotOption(
      'Напишу свой вариант',
      false,
      icon: IconAssets.ownOption,
    ),
  ],
);

const chapterText =
    'Lorem ipsum dolor sit amet, vince adipiscing elit, sed do eiusmod tempor '
    'incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis '
    'nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo '
    'consequat. '
    '\n\n'
    'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla '
    'pariatur.Lorem ipsum dolor sit amet, vince adipiscing elit, sed do eiusmod tempor incididunt ut labore et '
    'dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea '
    'commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla '
    'pariatur. Lorem ipsum dolor sit amet, vince adipiscing elit. Lorem ipsum dolor sit amet, vince adipiscing elit, '
    'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud '
    'exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '
    '\n\n'
    'Duis aute irure dolor in reprehenderit in'
    ' voluptate velit esse cillum dolore eu fugiat nulla pariatur.Lorem ipsum dolor sit amet, vince adipiscing elit,'
    ' sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud '
    'exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in '
    'voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet, vince adipiscing elit, '
    'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ';
