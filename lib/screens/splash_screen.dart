import 'package:flutter/material.dart';
import 'package:flutter_kos/screens/home_screen.dart';
import 'package:flutter_kos/theme.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset('assets/images/bottom.png')),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/logo.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Text(
                      'Temukan Penginapan yang Nyaman di sini!',
                      style: blackText.copyWith(fontSize: 24.0),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Text(
                      'Buat ingatan yang menyenangkan dengan berlibur di tempat yang indah.',
                      style: greyText.copyWith(fontSize: 16.0),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Container(
                    height: 50,
                    width: 210,
                    child: RaisedButton(
                      color: kColorPurple,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17)),
                      child: Text(
                        'Jelajahi Sekarang',
                        style: whiteText.copyWith(
                          fontSize: 16.0,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
