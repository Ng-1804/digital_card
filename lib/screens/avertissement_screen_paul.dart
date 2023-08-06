import 'package:flutter/material.dart';

import 'eta_civil_info_pass_screen_paul.dart';
class AvertissementScreenPaul extends StatefulWidget {
  const AvertissementScreenPaul({super.key});

  @override
  State<AvertissementScreenPaul> createState() => _AvertissementScreenPaulState();
}

class _AvertissementScreenPaulState extends State<AvertissementScreenPaul> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Digi Card"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          makeAverstissement("Avertissement", 18, FontWeight.bold, FontStyle.normal, 15),
          Divider(height: MediaQuery.of(context).size.height*0.05,),
          makeAverstissement("Vue..............................................", 15, FontWeight.normal, FontStyle.italic, 8),
          makeAverstissement("Vue..............................................", 15, FontWeight.normal, FontStyle.italic, 8),
          makeAverstissement("Vue..............................................", 15, FontWeight.normal, FontStyle.italic, 8),
          makeAverstissement("Vue..............................................", 15, FontWeight.normal, FontStyle.italic, 8),
          Divider(height: MediaQuery.of(context).size.height*0.05,),
          
          Center(
            child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EtatCivilInfoPassScreenPaul()),
                  );
                }, 
                child: const Text("Continuer")
            ),
          )
        ],
      ),
    );
  }

  Padding makeAverstissement(String text, double fontSize, FontWeight fontWeight, FontStyle fontStyle, double padding){
    return Padding(
      padding:  EdgeInsets.all(padding),
      child: Text(text),
    );
  }
}
