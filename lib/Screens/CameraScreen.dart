import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:kevlar/Screens/CameraView.dart';
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
                      return CameraPreview(_cameraController);
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
                      IconButton(onPressed: () {}, icon: Icon(
                        Icons.flash_off,
                        color: Colors.white,
                        size: 28,
                      )),
                      InkWell(onTap: () {
                        takePhoto(context);
                      }, child: Icon(
                        Icons.panorama_fish_eye,
                        color: Colors.white,
                        size: 70,
                      )),
                      IconButton(onPressed: () {}, icon: Icon(
                        Icons.flip_camera_ios,
                        color: Colors.white,
                        size: 28,
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
    final  path=join((await getTemporaryDirectory()).path,"${DateTime.now()}.png");
   XFile picture = await  _cameraController.takePicture();
   picture.toString();
   Navigator.push(context, MaterialPageRoute(builder: (builder)=>CameraView()));

}
}
