import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Commons {
  static flushBarError(BuildContext context, String? message) {
    Flushbar(
      title: "Error",
      message: message,
      flushbarPosition: FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.GROUNDED,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.easeInOut,
      backgroundColor: Colors.red,
      isDismissible: false,
      duration: const Duration(seconds: 5),
      icon: const Icon(Icons.close, color: Colors.black),
    ).show(context);
  }

  static Widget loading(String message, bool includeStamp) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.all(18),
            child: AnimatedTextKit(
              animatedTexts: [
                FadeAnimatedText(
                  message,
                  textStyle: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                FadeAnimatedText(
                  'Thanks for your patience.',
                  textStyle: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                FadeAnimatedText(
                  'Please wait...',
                  textStyle: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            )),
        myLoader(),
      ],
    );
  }

  static Widget myLoader() {
    return const Center(
        child: SpinKitWave(
      color: Colors.white,
    ));
  }
}
