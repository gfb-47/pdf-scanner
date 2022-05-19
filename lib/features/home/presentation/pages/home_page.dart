import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import '../../../../components/buttons/outlined_button.dart';
import '../../../../components/buttons/primary_button.dart';
import '../../../../theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? image;

  Future pickImageFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      this.image = imageTemporary;
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future takePhoto() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemporary = File(image.path);
      this.image = imageTemporary;
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

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
              onTap: () => takePhoto(),
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
              onTap: () => pickImageFromGallery(),
              text: 'Escolher da Galeria',
            ),
            // ignore: prefer_if_elements_to_conditional_expressions
            image != null
                ? Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: AppColors.black,
                      width: 2,
                    )),
                    child: Image.file(
                      image!,
                      height: 200,
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: AppColors.black,
                      width: 2,
                    )),
                    child: Image.asset(
                      'assets/images/no-image.jpg',
                      height: 200,
                      width: 170,
                      fit: BoxFit.cover,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
