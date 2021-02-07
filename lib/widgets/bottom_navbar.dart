import 'package:flutter/material.dart';
import 'package:flutter_kos/theme.dart';

class BottomNavbarItem extends StatelessWidget {
  final bool isActive;
  final String imageUrl;

  const BottomNavbarItem({Key key, this.isActive, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          imageUrl,
          color: isActive ? kColorPurple : kColorGrey,
          width: 26.0,
        ),
        Spacer(),
        isActive
            ? Container(
                width: 30.0,
                height: 2.0,
                decoration: BoxDecoration(
                    color: kColorPurple,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(1000))),
              )
            : Container()
      ],
    );
  }
}
