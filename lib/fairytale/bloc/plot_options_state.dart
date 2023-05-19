import 'package:equatable/equatable.dart';
import 'package:fairy_tale/fairytale/model/fairy_tale_model.dart';

abstract class PlotOptionsState extends Equatable {
  const PlotOptionsState();

  @override
  List<Object?> get props => const [];
}

class PlotOptionsInitialState extends PlotOptionsState {
  const PlotOptionsInitialState();
}

class PlotOptionsLoadingState extends PlotOptionsState {
  const PlotOptionsLoadingState();
}

class PlotOptionsLoadedState extends PlotOptionsState {
  const PlotOptionsLoadedState({
    required this.fairyTale,
  });

  final FairyTale fairyTale;

  @override
  List<Object?> get props => [fairyTale];
}
