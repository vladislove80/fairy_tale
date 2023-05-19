import 'package:fairy_tale/theme/app_them.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.text,
    this.onTap,
    super.key,
  });

  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff18152D),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 15.0,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: AppTheme.fontFamilyTilda,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
        ),
      );
}
