import 'package:flutter/material.dart';
import 'package:flutter_kos/theme.dart';

class FacilityIcon extends StatelessWidget {
  final String imageUrl;
  final int total;
  final String name;

  const FacilityIcon({Key key, this.imageUrl, this.total, this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imageUrl, width: 32, color: kColorPurple),
        SizedBox(
          height: 8,
        ),
        Text.rich(
          TextSpan(
            text: '$total',
            style: purpleText.copyWith(fontSize: 16),
            children: [
              TextSpan(text: ' $name', style: greyText),
            ],
          ),
        )
      ],
    );
  }
}
