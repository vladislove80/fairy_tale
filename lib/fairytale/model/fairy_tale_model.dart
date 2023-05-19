import 'package:fairy_tale/widget/plot_option/model/plot_options.dart';

class FairyTale {
  const FairyTale({
    required this.chapterNumber,
    required this.title,
    required this.chapterText,
    this.plotOptions,
  });

  final String chapterNumber;
  final String title;
  final String chapterText;
  final PlotOptions? plotOptions;

  FairyTale copyWith(String text) => FairyTale(
        chapterNumber: chapterNumber,
        title: title,
        chapterText: chapterText,
        plotOptions: plotOptions?.copyWith(text),
      );
}
