import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_svg/svg.dart';

class QiblaCompassWidget extends StatelessWidget {
  const QiblaCompassWidget({super.key, required this.qiblah});
  final QiblahDirection qiblah;

  @override
  Widget build(BuildContext context) {
    final compassSvg = SvgPicture.asset('assets/compass.svg');
    final needleSvg = SvgPicture.asset(
      'assets/needle.svg',
      fit: BoxFit.contain,
      height: 300,
      alignment: Alignment.center,
    );
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Stack(
            clipBehavior: .none,
            alignment: Alignment.center,
            children: [
              compassSvg,
              Transform.rotate(
                angle: (qiblah.qiblah * (pi / 180) * -1),
                alignment: Alignment.center,
                child: needleSvg,
              ),
              Positioned(
                bottom: -28,
                child: Text("offset: ${qiblah.offset.toStringAsFixed(3)}°"),
              ),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              "Please rotate the phone in 8 shape\n and hold the phone on your hand straightly",
              textAlign: .center,
            ),
          ),
        ),
      ],
    );
  }
}
