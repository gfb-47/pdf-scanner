import 'package:flutter/material.dart';

import '../../../../components/buttons/outlined_button.dart';

class PickImagePage extends StatelessWidget {
  const PickImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: Align(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomOutlinedButton(onTap: () => null, text: 'Pick image'),
            ],
          ),
        ));
  }
}
