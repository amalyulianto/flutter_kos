import 'package:flutter/material.dart';
import 'package:flutter_kos/models/recommended.dart';
import 'package:flutter_kos/screens/error_screen.dart';
import 'package:flutter_kos/theme.dart';
import 'package:flutter_kos/widgets/facility_card.dart';
import 'package:flutter_kos/widgets/facility_icon.dart';
import 'package:flutter_kos/widgets/rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  final Recommended recommended;

  DetailScreen(this.recommended);
  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ErrorScreen(),
          ),
        );
      }
    }

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              recommended.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(
                  height: 328.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      color: Colors.white),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    recommended.name,
                                    style: blackText.copyWith(fontSize: 22.0),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                        text: 'Rp${recommended.price},-',
                                        style:
                                            purpleText.copyWith(fontSize: 16.0),
                                        children: [
                                          TextSpan(
                                              text: ' / bulan',
                                              style: greyText.copyWith(
                                                  fontSize: 16.0))
                                        ]),
                                  ),
                                ],
                              ),
                              Row(
                                children: [1, 2, 3, 4, 5].map((index) {
                                  return Container(
                                    margin: EdgeInsets.only(left: 2),
                                    child: RatingBar(
                                        index: index,
                                        rating: recommended.rating),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        // NOTE : FACILITIES
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Text(
                            'Fasilitas',
                            style: regularText.copyWith(fontSize: 16.0),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FacilityIcon(
                                imageUrl: 'assets/images/001-bar-counter.png',
                                total: recommended.numberOfKitchens,
                                name: 'Kitchen',
                              ),
                              FacilityIcon(
                                imageUrl: 'assets/images/003-cupboard.png',
                                total: recommended.numberOfBedrooms,
                                name: 'Cupboard',
                              ),
                              FacilityIcon(
                                imageUrl: 'assets/images/001-bar-counter.png',
                                total: recommended.numberOfCupboards,
                                name: 'Cupboard',
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        // NOTE : FACILITIES
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Text(
                            'Foto',
                            style: regularText.copyWith(fontSize: 16.0),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          height: 88,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: recommended.photos.map(
                              (e) {
                                return FacilityCard(imageUrl: e);
                              },
                            ).toList(),
                          ),
                        ),
                      ]),
                ),
                SizedBox(height: 30.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'Lokasi',
                    style: regularText.copyWith(fontSize: 16.0),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${recommended.address}\n${recommended.location}',
                        style: greyText,
                      ),
                      InkWell(
                        onTap: () {
                          launchUrl(recommended.mapUrl);
                        },
                        child: Image.asset(
                          'assets/images/btn_map.png',
                          width: 40,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                InkWell(
                  onTap: () {
                    launchUrl('tel:${recommended.phone}');
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 24.0),
                    width: MediaQuery.of(context).size.width - 48,
                    height: 50,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        'Pesan',
                        style: whiteText.copyWith(fontSize: 18),
                      ),
                      color: kColorPurple,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/images/btn_back.png',
                      width: 40,
                    ),
                  ),
                  Image.asset(
                    'assets/images/btn_wishlist.png',
                    width: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
