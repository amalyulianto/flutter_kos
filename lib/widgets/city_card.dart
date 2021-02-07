import 'package:flutter/material.dart';
import 'package:flutter_kos/models/city.dart';
import 'package:flutter_kos/theme.dart';

class CityCard extends StatelessWidget {
  final City city;

  const CityCard({
    Key key,
    @required this.city,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18.0),
      child: Container(
        height: 150.0,
        width: 120.0,
        color: kColorTab,
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  city.imageUrl,
                  height: 102.0,
                  width: 120.0,
                  fit: BoxFit.cover,
                ),
                city.isPopular
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 50.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            color: kColorPurple,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(36),
                            ),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/images/Icon_star_solid.png',
                              width: 22,
                              height: 22.0,
                            ),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              city.name,
              style: blackText.copyWith(fontSize: 16.0),
            )
          ],
        ),
      ),
    );
  }
}
