import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final int index;
  final int rating;

  const RatingBar({this.rating, this.index});
  @override
  Widget build(BuildContext context) {
    return index <= rating
        ? Image.asset('assets/images/Icon_star_solid.png', width: 20)
        : Image.asset('assets/images/Icon_star_solid.png',
            width: 20, color: Colors.grey);
  }
}
