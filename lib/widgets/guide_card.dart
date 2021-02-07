import 'package:flutter/material.dart';

import '../theme.dart';

class GuideCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/icon.png',
          width: 80.0,
        ),
        SizedBox(
          width: 16.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'recommended.name',
              style: blackText.copyWith(fontSize: 18.0),
            ),
            Text(
              'Latest Update: 20 Apr',
              style: greyText,
            )
          ],
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.chevron_right,
            color: kColorGrey,
          ),
        )
      ],
    );
  }
}
