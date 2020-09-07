import 'package:flutter/material.dart';

class DGLDashedLine extends StatelessWidget {
  final Axis axis;
  final double dashedWidth;
  final double dashedHeight;
  final int count;
  final Color color;

  DGLDashedLine({
    @required this.axis,
    this.dashedHeight = 1,
    this.dashedWidth = 1,
    this.count,
    this.color = const Color(0xffff0000),
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Flex(
            direction: this.axis,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(this.count, (int index) {
              return SizedBox(
                width: dashedWidth,
                height: dashedHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: color),
                ),
              );
            })
        );
      },
    );
  }
}
