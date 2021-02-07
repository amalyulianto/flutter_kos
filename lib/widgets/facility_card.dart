import 'package:flutter/material.dart';

class FacilityCard extends StatelessWidget {
  final String imageUrl;
  const FacilityCard({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          imageUrl,
          width: 110,
          height: 88,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
