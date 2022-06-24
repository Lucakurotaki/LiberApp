import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

Widget carouselGallery = SizedBox(
  height: 200.0,
  child: CarouselSlider(
    options: CarouselOptions(height: 200.0, autoPlay: true),
    items: [
      'image/Icon-192.png'
    ].map((i) {
      return Builder(
        builder: (BuildContext context) {
          return InkWell(
            onTap: () {},
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Image(image: AssetImage(i)),
            ),
          );
        },
      );
    }).toList(),
  ),
);
