import 'package:digital_card/screens/etat_civil_info_supplementaire_paul.dart';
import 'package:flutter/material.dart';

import '../fonctions/barre_de_titre_paul.dart';

class EtatCivilInfoPassScreenPaul extends StatefulWidget {
  const EtatCivilInfoPassScreenPaul({super.key});

  @override
  State<EtatCivilInfoPassScreenPaul> createState() =>
      _EtatCivilInfoPassScreenPaulState();
}

class _EtatCivilInfoPassScreenPaulState extends State<EtatCivilInfoPassScreenPaul> {
  TextEditingController  textEditingControllerDate = TextEditingController();
  TextEditingController  textEditingControllerSexe = TextEditingController();
  bool gender = true;
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
            makeTitle("Etat Civil", context),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'Prénom(s)',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veillez entrer votre nom svp.';
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'Nom(s)',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: TextFormField(
                controller: textEditingControllerDate,
                decoration: const InputDecoration(
                  icon: Icon(Icons.date_range),
                  hintText: 'YYYY-MM-DD',
                ),
                readOnly: true,
                onTap: ()async{
                  DateTime? pickedDate = await showDatePicker(
                      context: context, initialDate: DateTime.now(),
                      firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101)
                  );
                  if(pickedDate != null ){
                    setState(() {
                      print(pickedDate);
                      textEditingControllerDate.text = pickedDate.toString().substring(0, 10);
                    });
                  }else{
                    print("Date is not selected");
                  }

                  },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.place),
                  labelText: 'Lieu de naissance',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: TextFormField(
                controller: textEditingControllerSexe,
                decoration: InputDecoration(
                  icon: const Icon(Icons.person_rounded),
                  suffixIcon: gender?const Icon(Icons.male):const Icon(Icons.female),
                  labelText: 'Sexe',
                ),
                readOnly: true,
                onTap: (){
                  setState(() {
                    gender = !gender;
                    if(gender){
                      textEditingControllerSexe.text = "Masculin";
                    }else{
                      textEditingControllerSexe.text = "Feminin";
                    }
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.flag),
                  hintText: 'Nationalité',
                  labelText: 'Nationalité',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.landscape_outlined),
                  hintText: 'Dapartement',
                  labelText: 'Departement',
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const EtatCivilInfoSupplementairePaul()));
                  },
                  child: const Text("Continuer")),
            )
          ],
        ),
      ),
    );
  }

}
