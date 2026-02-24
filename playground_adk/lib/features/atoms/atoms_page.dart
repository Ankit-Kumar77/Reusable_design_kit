import 'package:flutter/material.dart';
import 'previews/buttons_preview.dart';
import 'previews/textfield_preview.dart';

class AtomsPage extends StatelessWidget {
  const AtomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(40),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ButtonsPreview(),

            SizedBox(height: 60),

            TextFieldPreview(),

          ],
        ),
      ),
    );
  }
}