import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class BackgroundFadeImage extends StatefulWidget {
  const BackgroundFadeImage({super.key, required this.child});
  final Widget child;

  @override
  State<BackgroundFadeImage> createState() => _BackgroundFadeImageState();
}

class _BackgroundFadeImageState extends State<BackgroundFadeImage> {

  final List<String> images = [];

  bool showFistImage = true;

   @override
  void initState() {
    super.initState();
    final imagesSource = [
      Assets.girl,
      Assets.girl2,
      Assets.girl3,
      Assets.girl4,
    ];

    images.add(imagesSource.removeAt(Random().nextInt(imagesSource.length)));
    images.add(imagesSource.removeAt(Random().nextInt(imagesSource.length)));

    _toggleImage();
  }

  void _toggleImage() {
    Timer.periodic(
      const Duration(seconds: 15),
      (timer) {
        setState(() {
          showFistImage = !showFistImage;
        });
      }
    );
  }

  Widget _fadeInImage(String path) => Image(
        image: AssetImage(path),
        fit: BoxFit.cover,
      );
  
  @override
  Widget build(BuildContext context) => Stack(
      children: [
        AnimatedCrossFade(
          layoutBuilder: (topChild, topChildKey, bottomChild, bottomChildKey) => 
              Stack(
                children: [
                  Positioned(
                    key: topChildKey,
                    child: SizedBox.expand(
                      child: topChild,
                    ),
                  ),
                  Positioned(
                    key: bottomChildKey,
                    child: SizedBox.expand(
                      child: bottomChild,
                    ),
                  ),
                ],
              ),
          firstCurve: Curves.bounceInOut,
          secondCurve: Curves.bounceInOut,
          crossFadeState: showFistImage
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 700),
          firstChild: _fadeInImage(images[0]),
          secondChild: _fadeInImage(images[1]),
        ),
        widget.child
      ],
    );
}