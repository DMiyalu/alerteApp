import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'package:image_picker/image_picker.dart';

class SignalScreen extends StatefulWidget {
  const SignalScreen({super.key});

  @override
  State<SignalScreen> createState() => _SignalScreenState();
}

class _SignalScreenState extends State<SignalScreen> {
  @override
  Widget build(BuildContext context) {
    Gradient? gradient = LinearGradient(
      colors: [
        Theme.of(context).primaryColor,
        const Color(0xff8a1e2d),
        const Color(0xffa1262e),
        Theme.of(context).hintColor
      ],
      stops: const [0.2, 0.5, 0.6, 0.95],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: appBar(context),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height * 100,
          width: MediaQuery.of(context).size.width * 100,
          decoration: BoxDecoration(
            gradient: gradient,
          ),
          child: Stack(
            children: [
              Center(
                child: actionButton(context),
              ),
              helpNote(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget helpNote(context) {
  return Positioned(
    bottom: 30,
    child: Ink(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: const Text(
        "Apres avoir clické sur le boutton SOS, et envoyer l'image de l'urgence, nous contactons directement les services des urgences publics !",
        style: TextStyle(
            color: Colors.white60, fontWeight: FontWeight.w300, fontSize: 18),
        textAlign: TextAlign.center,
        softWrap: true,
      ),
    ),
  );
}

Widget actionButton(context) {
  return ZoomTapAnimation(
    begin: 1.0,
    end: 0.93,
    beginDuration: const Duration(milliseconds: 20),
    endDuration: const Duration(milliseconds: 120),
    beginCurve: Curves.decelerate,
    endCurve: Curves.fastOutSlowIn,
    onTap: () {},
    onLongTap: () {},
    child: Container(
      padding: const EdgeInsets.all(8.5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.14),
        shape: BoxShape.circle,
      ),
      child: Container(
        padding: const EdgeInsets.all(8.5),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.25),
          shape: BoxShape.circle,
        ),
        child: Container(
          padding: const EdgeInsets.all(8.5),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.4),
            shape: BoxShape.circle,
          ),
          child: Container(
            padding: const EdgeInsets.all(60),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Text(
              'SOS',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).hintColor,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

AppBar appBar(context) {
  return AppBar(
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: IconButton(
        onPressed: () {},
        tooltip: "Paramètres",
        icon: const Icon(Icons.settings, color: Colors.white70, size: 22)),
    title: const Text(
      "ALERTE",
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
    ),
  );
}
