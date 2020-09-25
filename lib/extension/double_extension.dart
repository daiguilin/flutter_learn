import '../shared/size_fit.dart';

extension DoubleFit on double{
  double get px{
    return DGLSizeFit.setPx(this);
  }

  double get rpx {
    return DGLSizeFit.setRpx(this);
  }
}

