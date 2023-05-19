import 'package:fairy_tale/theme/icon_assets.dart';
import 'package:fairy_tale/widget/app_button.dart';
import 'package:fairy_tale/widget/plot_option/model/plot_options.dart';
import 'package:fairy_tale/widget/plot_option/plot_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlotOptionsWidget extends StatelessWidget {
  const PlotOptionsWidget({
    required this.arguments,
    required this.onOptionSelected,
    super.key,
  });

  final PlotOptions arguments;
  final void Function(String) onOptionSelected;

  @override
  Widget build(BuildContext context) {
    final optionWidgets = arguments.options.map(
      (option) {
        return PlotOptionWidget(
          text: option.text,
          isEnabled: option.isSelected,
          onTap: () {
            onOptionSelected.call(option.text);
          },
          iconPath: option.icon,
        );
      },
    ).toList(growable: false);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: ClipPath(
        clipper: ShapeBorderClipper(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.topLeft,
              colors: [
                Color(0xffF05D24),
                Colors.orangeAccent,
                Color(0xffFFC36B),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
              right: 12.0,
              top: 16,
              bottom: 16,
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(IconAssets.plotOptions),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        arguments.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                ...optionWidgets,
                const SizedBox(height: 4),
                AppButton(
                  text: 'Continue',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
