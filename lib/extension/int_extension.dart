import '../shared/size_fit.dart';

extension IntFit on int {
  double get px {
    return DGLSizeFit.setPx(this.toDouble());
  }

  double get rpx {
    return DGLSizeFit.setRpx(this.toDouble());
  }
}

