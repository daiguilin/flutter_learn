import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final double rating;
  final double maxRating;
  final double size;
  final Color unselectedColor;
  final Color selectedColor;
  final Widget unselectedImage;
  final Widget selectedImage;
  final int count;

  StarRating({
    @required this.rating,
    this.maxRating = 10,
    this.size = 30,
    this.unselectedColor = const Color(0xffbbbbbb),
    this.selectedColor = const Color(0xffe0aa46),
    Widget unselectedImage,
    Widget selectedImage,
    this.count = 5,
  })  : unselectedImage = unselectedImage ??
            Icon(Icons.star, size: size, color: unselectedColor),
        selectedImage = selectedImage ??
            Icon(
              Icons.star,
              size: size,
              color: selectedColor,
            );

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Row(
            children: getUnSelectImage(),
            mainAxisSize: MainAxisSize.min,
          ),
          Row(
            children: getSelectImage(),
            mainAxisSize: MainAxisSize.min,
          )
        ],
      ),
    );
  }

  List<Widget> getUnSelectImage() {
    return List.generate(widget.count, (index) => widget.unselectedImage);
  }

  List<Widget> getSelectImage() {
    //1.计算star个数和剩余比例等
    double oneValue = widget.maxRating / widget.count;
    int entireCount = (widget.rating / oneValue).floor();
    double leftValue = widget.rating - oneValue * entireCount;
    double leftRatio = leftValue / oneValue;

    //2.获取star
    List<Widget> selectedImage = [];
    for (int i = 0; i < entireCount; i++) {
      selectedImage.add(widget.selectedImage);
    }

    //3.计算
    Widget leftStar = ClipRect(
      clipper: MyRectClipper(width: leftRatio * widget.size),
      child: widget.selectedImage,
    );

    selectedImage.add(leftStar);

    return selectedImage;
  }
}

class MyRectClipper extends CustomClipper<Rect> {
  final double width;

  MyRectClipper({this.width});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(MyRectClipper oldClipper) {
    return width != oldClipper.width;
  }
}
