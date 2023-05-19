import 'package:flutter/material.dart';

class ProgressLine extends StatelessWidget {
  const ProgressLine({this.progress = 0, super.key});

  final double progress;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
            height: 5,
            width: width,
            color: const Color(0xffE5EBED)
          ),
        Container(
          height: 5,
          width: progress * width,
          color: const Color(0xffFF8966),
        ),
      ],
    );
  }
}
