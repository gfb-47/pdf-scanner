import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../components/buttons/primary_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: Align(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrimaryButton(
                  onTap: () => Navigator.of(context).pushNamed('/pick_image'),
                  text: 'Pegar imagem da galeria'),
              PrimaryButton(onTap: () => log('rota'), text: 'Tirar foto')
            ],
          ),
        ));
  }
}
