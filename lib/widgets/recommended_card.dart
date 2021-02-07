import 'package:flutter/material.dart';
import 'package:flutter_kos/models/recommended.dart';
import 'package:flutter_kos/screens/detail_screen.dart';

import '../theme.dart';

class RecommendedCard extends StatelessWidget {
  final Recommended recommended;

  const RecommendedCard(this.recommended);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailScreen(recommended)));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18.0),
            child: Container(
              width: 130,
              height: 110,
              child: Stack(children: [
                Image.network(
                  recommended.imageUrl,
                  width: 130,
                  height: 110,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 70.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: kColorPurple,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Icon_star_solid.png',
                          width: 22,
                          height: 22.0,
                        ),
                        Text(
                          '${recommended.rating}/5',
                          style: whiteText.copyWith(fontSize: 13.0),
                        )
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ),
          SizedBox(width: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                recommended.name,
                style: blackText.copyWith(fontSize: 18.0),
              ),
              Row(
                children: [
                  Text(
                    'Rp${recommended.price},-',
                    style: purpleText.copyWith(fontSize: 16.0),
                  ),
                  Text(
                    ' / bulan',
                    style: greyText.copyWith(fontSize: 16.0),
                  ),
                ],
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                recommended.location,
                style: greyText,
              )
            ],
          )
        ],
      ),
    );
  }
}
