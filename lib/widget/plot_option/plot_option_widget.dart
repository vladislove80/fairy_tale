import 'package:fairy_tale/theme/app_them.dart';
import 'package:fairy_tale/widget/plot_option/option_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlotOptionWidget extends StatelessWidget {
  const PlotOptionWidget({
    required this.text,
    required this.onTap,
    this.isEnabled = false,
    this.iconPath,
    super.key,
  });

  final String text;
  final bool isEnabled;
  final String? iconPath;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    var textWidget = Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontFamily: AppTheme.fontFamilyTilda,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    );
    return Container(
      constraints: const BoxConstraints(minHeight: 62),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (iconPath != null)
                  Row(
                    children: [
                      SvgPicture.asset(iconPath!),
                      const SizedBox(width: 12),
                      textWidget,
                    ],
                  ),
                if (iconPath == null) Flexible(child: textWidget),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: OptionRadioButton(isActive: isEnabled),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
