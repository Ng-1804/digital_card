import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../services/constantes.dart';
import 'etat_civil_photo_screen_photo.dart';
class CameraScreenTakePhoto extends StatefulWidget {
  bool cameraRectoOrVerso;

  CameraScreenTakePhoto({super.key, required  this.cameraRectoOrVerso});


  @override
  State<CameraScreenTakePhoto> createState() => _CameraScreenTakePhotoState();
}

class _CameraScreenTakePhotoState extends State<CameraScreenTakePhoto> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  late CameraDescription cameraDescription;
  late var _cameras;
  bool changeCame = true;

  @override
  void initState() {

    super.initState();
    initCamera();


  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> initCamera() async {
    _cameras = cameras;
    setState(() {
      cameraDescription = _cameras.first;
      _controller = CameraController(
        cameraDescription,
        ResolutionPreset.high,
      );
      _initializeControllerFuture = _controller.initialize();

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Digi Card"),
      ),
      body: Center(
        child: FutureBuilder(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CameraPreview(
                _controller,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final image = await _controller.takePicture();
                        if (!mounted) return;
                        setState(() {
                          if(widget.cameraRectoOrVerso){
                            rectoImagePath = image.path;
                          }else{
                            versoImagePath = image.path;
                          }
                          print("===================\n\n${image.path}\n\n======================");
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const EtatCivilPhotoScreenPaul()));
                        });

                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )
                      ),
                      child: const Text("Take photo"),
                    ),

                  ],
                ),
              );
            } else {
              // Otherwise, display a loading indicator.
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),

      floatingActionButton: FloatingActionButton.small(
        tooltip: 'Swap screen',
          child: const Icon(Icons.cameraswitch),
          onPressed: (){
            setState(() {
              changeCame = !changeCame;
              !changeCame?_controller.setDescription(_cameras.last):_controller.setDescription(_cameras.first);
              print("*****************$_cameras********\n $cameraDescription *********");
            });
          },
      ),
    );
  }
}

