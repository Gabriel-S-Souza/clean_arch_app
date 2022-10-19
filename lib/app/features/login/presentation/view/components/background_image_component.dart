import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../../core/core.dart';

class BackgroundImageComponent extends StatefulWidget {
  const BackgroundImageComponent({super.key, required this.child});
  final Widget child;

  @override
  State<BackgroundImageComponent> createState() =>
      _BackgroundImageComponentState();
}

class _BackgroundImageComponentState extends State<BackgroundImageComponent> {
  late final Timer timer;

  List<String> images = [];
  List<String> images2 = [];

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
    images2.add(imagesSource.removeAt(Random().nextInt(imagesSource.length)));
    images2.add(imagesSource.removeAt(0));

    timer = _toggleImage();
  }

  Timer _toggleImage() => Timer.periodic(
        const Duration(seconds: 20),
        (timer) {
          if (showFistImage) {
            images2 = images2.reversed.toList();
          } else {
            images = images.reversed.toList();
          }
          setState(() => showFistImage = !showFistImage);
        },
      );

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  Widget _fadeInImage(String path) => Image(
        image: AssetImage(path),
        fit: BoxFit.cover,
      );

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          AnimatedCrossFade(
            layoutBuilder:
                (topChild, topChildKey, bottomChild, bottomChildKey) => Stack(
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
            secondChild: _fadeInImage(images2[0]),
          ),
          widget.child
        ],
      );
}
