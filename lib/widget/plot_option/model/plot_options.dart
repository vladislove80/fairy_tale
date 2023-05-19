import 'package:equatable/equatable.dart';

class PlotOptions extends Equatable {
  final String title;
  final List<PlotOption> options;
  final bool ownVariantTitle;

  const PlotOptions({
    required this.title,
    required this.options,
    this.ownVariantTitle = true,
  });

  @override
  List<Object?> get props => [title, options, ownVariantTitle];

  PlotOptions copyWith(String text) => PlotOptions(
      title: title,
      ownVariantTitle: ownVariantTitle,
      options: options
          .map(
            (option) => PlotOption(
              option.text,
              text == option.text,
              icon: option.icon,
            ),
          )
          .toList(growable: false));
}

class PlotOption extends Equatable {
  const PlotOption(
    this.text,
    this.isSelected, {
    this.icon,
  });

  final String text;
  final bool isSelected;
  final String? icon;

  @override
  List<Object?> get props => [text, isSelected];
}
