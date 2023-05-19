import 'package:fairy_tale/theme/icon_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OptionRadioButton extends StatelessWidget {
  const OptionRadioButton({
    this.isActive = false,
    super.key,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          if (isActive)
            SvgPicture.asset(IconAssets.chosenOption)
          else
            SvgPicture.asset(IconAssets.notChosenOption),
        ],
      );
}
