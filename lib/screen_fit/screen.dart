import 'package:flutter/material.dart';

class DGLSizeFit {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double rpx;
  static double px;

  static void initialize(BuildContext context, {double standardWidth = 750}) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    rpx = screenWidth / standardWidth;
    px = screenWidth / standardWidth * 2;
  }

  //按照像素来设置
  static setPx(double size) {
    return DGLSizeFit.rpx * size * 2;
  }

  //按照rpx来设置
  static double setRpx(double size) {
    return DGLSizeFit.rpx * size;
  }
}
