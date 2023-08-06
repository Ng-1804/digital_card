import 'package:flutter/material.dart';

import '../fonctions/barre_de_titre_paul.dart';
import 'etat_civil_photo_screen_photo.dart';

class EtatCivilInfoSupplementairePaul extends StatefulWidget {
  const EtatCivilInfoSupplementairePaul({super.key});

  @override
  State<EtatCivilInfoSupplementairePaul> createState() =>
      _EtatCivilInfoSupplementairePaulState();
}

class _EtatCivilInfoSupplementairePaulState
    extends State<EtatCivilInfoSupplementairePaul> {
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
            makeTitle("Informations supplementaires", context),
            const Padding(padding: EdgeInsets.all(10)),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.location_city),
                  labelText: 'Votre adresse',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.streetview),
                  labelText: 'Quartier',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.post_add),
                  labelText: 'Votre code postal',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone_android),
                  labelText: 'Votre numéro de téléphone',
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const EtatCivilPhotoScreenPaul()));
                  },
                  child: const Text("Continuer")),
            )
          ],
        ),
      ),
    );
  }
}
