import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:kevlar/Screens/CameraView.dart';
import 'package:kevlar/Screens/VideoView.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
//List<CameraDescription> cameras;
List<CameraDescription> cameras = List<CameraDescription>.empty(growable: true);
class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}
class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  late Future<void> cameravalue;
  bool isRecording=false;
  bool flash=false;
  bool iscamerafront=true;
  double transform=0;
  //late String path;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //cameras = await availableCameras();
    //final firstCamera = cameras.first;
    _cameraController=CameraController(cameras[0], ResolutionPreset.high);
    cameravalue=_cameraController.initialize();
  }
  @override
  void dispose()
  {
    super.dispose();
    _cameraController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
              future: cameravalue,
              builder: (context,snapshot)
                  {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: CameraPreview(_cameraController),);
                    }
                    else
                    {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
              }
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              padding: EdgeInsets.only(
                top: 5,
                bottom: 5,
              ),
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(onPressed: () {
                        setState(() {
                          flash=!flash;
                        });
                        flash?_cameraController.setFlashMode(FlashMode.torch):_cameraController.setFlashMode(FlashMode.off);
                      }, icon: Icon(
                        flash?Icons.flash_on:Icons.flash_off,
                        color: Colors.white,
                        size: 28,
                      )),
                      GestureDetector(
                          onLongPress: () async{
                            //path=join((await getTemporaryDirectory()).path,"${DateTime.now()}.mp4");
                            await _cameraController.startVideoRecording();
                            //clip.saveTo(path);
                            // if (!_cameraController.value.isRecordingVideo) {
                            //   _cameraController.startVideoRecording();
                            // }
                            setState(() {
                              isRecording=true;
                              //videopath=path;
                            });
                          },
                          onLongPressUp: () async{
                            XFile videopath=await _cameraController.stopVideoRecording();
                            // if (_cameraController.value.isRecordingVideo) {
                            //   XFile videoFile = await _cameraController.stopVideoRecording();
                            //   videoFile.saveTo(path);
                            //   //and there is more in this XFile object
                            // }
                            setState(() {
                              isRecording=false;
                            });
                            Navigator.push(context, MaterialPageRoute(builder: (builder)=>VideoView(path: videopath.path)));
                          },
                          onTap: () {
                            if(!isRecording)
                        {takePhoto(context);}
                      }, child: isRecording? Icon(Icons.radio_button_on, color: Colors.red,size: 70)
                          :Icon(
                        Icons.panorama_fish_eye,
                        color: Colors.white,
                        size: 70,
                      )),
                      IconButton(onPressed: () async{
                        setState(() {
                          iscamerafront=!iscamerafront;
                          transform=transform+pi;
                        });
                        int cameraPos=iscamerafront?0:1;
                        _cameraController=CameraController(
                            cameras[cameraPos],
                            ResolutionPreset.high,
                        );
                        cameravalue=_cameraController.initialize();

                      }, icon: Transform.rotate(
                        angle: transform,
                        child: Icon(
                          Icons.flip_camera_ios,
                          color: Colors.white,
                          size: 28,
                        ),
                      )),
                    ],
                  ),
                  SizedBox(height: 4,),
                  Text("Hold for Video,tap for photo",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

        ],

      ),
    );
  }
  void takePhoto(BuildContext context) async{
   // final  path=join((await getTemporaryDirectory()).path,"${DateTime.now()}.png");
   XFile path = await  _cameraController.takePicture();
  // picture.saveTo(path);
   Navigator.push(context, MaterialPageRoute(builder: (builder)=>CameraView(path:path.path,)));

}
}
