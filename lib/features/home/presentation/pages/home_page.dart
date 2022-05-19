import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../components/buttons/outlined_button.dart';
import '../../../../components/buttons/primary_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Align(
        child: Column(
          children: [
            Container(
              height: 200,
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              child: Lottie.asset(
                'assets/animations/splash.json',
                height: 200,
              ),
            ),
            PrimaryButton(
              onTap: () => log('rota'),
              text: 'Tirar Foto',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: Text(
                'ou',
                style: GoogleFonts.sourceSansPro(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            CustomOutlinedButton(
              onTap: () => Navigator.pushNamed(context, '/pick_image'),
              text: 'Escolher da Galeria',
            ),
          ],
        ),
      ),
    );
  }
}
