import 'dart:io';

import 'package:digital_card/services/constantes.dart';
import 'package:flutter/material.dart';
import '../fonctions/barre_de_titre_paul.dart';
import 'camera_screen_take_photo_paul.dart';
class EtatCivilPhotoScreenPaul extends StatefulWidget {
  const EtatCivilPhotoScreenPaul({super.key});
  @override
  State<EtatCivilPhotoScreenPaul> createState() => _EtatCivilPhotoScreenPaulState();
}

class _EtatCivilPhotoScreenPaulState extends State<EtatCivilPhotoScreenPaul> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Digi Card"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            makeTitle("Prendre la CNI en photo", context),
            const Padding(padding: EdgeInsets.all(10)),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CameraScreenTakePhoto(cameraRectoOrVerso: true,)));
                  },
                  child: const Text("Prende le Recto")),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.20,
              width: MediaQuery.of(context).size.width*0.9,
              color: Colors.grey,
              child: rectoImagePath.isNotEmpty?Transform.rotate(angle: 50 * (3.14159265359 / 180), child: DisplayPictureScreen(imagePath: rectoImagePath),):const Center(child: Text("Photo Recto here"),),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CameraScreenTakePhoto(cameraRectoOrVerso: false,)));
                  },
                  child: const Text("Prende le Verso")),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.20,
              width: MediaQuery.of(context).size.width*0.9,
              color: Colors.grey,
              alignment: Alignment.center,
              child: versoImagePath.isNotEmpty?Transform.rotate(angle: 90, child: DisplayPictureScreen(imagePath: versoImagePath),):const Center(child: Text("Photo Verso here"),),
            ),
            const Padding(padding: EdgeInsets.all(20)),
            Center(
              child: ElevatedButton(
                  onPressed: () {

                  },
                  child: const Text("Suivant")),
            )
          ],
        ),
      ),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    //return Image.asset(imagePath);
    return  Image.file(File(imagePath), );
  }
}
