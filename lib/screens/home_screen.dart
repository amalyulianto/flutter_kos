import 'package:flutter/material.dart';
import 'package:flutter_kos/models/city.dart';
import 'package:flutter_kos/models/recommended.dart';
import 'package:flutter_kos/providers/recommended_provider.dart';
import 'package:flutter_kos/theme.dart';
import 'package:flutter_kos/widgets/bottom_navbar.dart';
import 'package:flutter_kos/widgets/city_card.dart';
import 'package:flutter_kos/widgets/guide_card.dart';
import 'package:flutter_kos/widgets/recommended_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var recommendedProvider = Provider.of<RecommendedProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                'Jelajahi Sekarang',
                style: blackText.copyWith(fontSize: 24.0),
              ),
            ),
            SizedBox(
              height: 2.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                'Ayo cari hunian sesuai preferensimu!',
                style: greyText.copyWith(fontSize: 16.0),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                'Kota Populer',
                style: regularText.copyWith(fontSize: 16.0),
              ),
            ),
            Container(
              height: 150.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 24.0,
                  ),
                  CityCard(
                    city: City(
                      id: 1,
                      name: 'Jakarta',
                      imageUrl: 'assets/images/city1.png',
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  CityCard(
                    city: City(
                      id: 2,
                      name: 'Bandung',
                      imageUrl: 'assets/images/city2.png',
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  CityCard(
                    city: City(
                      id: 3,
                      name: 'Jogja',
                      imageUrl: 'assets/images/city3.png',
                      isPopular: true,
                    ),
                  ),
                  SizedBox(
                    width: 24.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            // Tempat Rekomendasi
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                'Rekomendasi Untuk Kamu',
                style: regularText.copyWith(fontSize: 16.0),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: FutureBuilder(
                  future: recommendedProvider.getRecommended(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Recommended> data = snapshot.data;
                      int index = 0;

                      return Column(
                          children: data.map((e) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(
                            top: index == 1 ? 0 : 30,
                          ),
                          child: RecommendedCard(e),
                        );
                      }).toList());
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                )),
            SizedBox(
              height: 30.0,
            ),
            // Petunjuk
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                'Petunjuk Berguna Untuk Kamu',
                style: regularText.copyWith(fontSize: 16.0),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  GuideCard(),
                  SizedBox(
                    height: 20.0,
                  ),
                  GuideCard(),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 74,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65.0,
        width: MediaQuery.of(context).size.width - (2 * 24),
        margin: EdgeInsets.symmetric(horizontal: 24.0),
        decoration: BoxDecoration(
            color: kColorTab, borderRadius: BorderRadius.circular(23.0)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          BottomNavbarItem(
            imageUrl: 'assets/images/Icon_home_solid.png',
            isActive: false,
          ),
          BottomNavbarItem(
            imageUrl: 'assets/images/Icon_card_solid.png',
            isActive: false,
          ),
          BottomNavbarItem(
            imageUrl: 'assets/images/Icon_mail_solid.png',
            isActive: false,
          ),
          BottomNavbarItem(
            imageUrl: 'assets/images/Icon_love_solid.png',
            isActive: true,
          )
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
