import 'package:flutter/material.dart';
import '../../star_rating.dart';
class Subject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: StarRating(
        rating:8.7,
        size:50,
        unselectedColor:Colors.green,
        selectedColor:Colors.red
      ),
    );
  }
}
