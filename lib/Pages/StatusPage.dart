import 'package:flutter/material.dart';
import 'package:kevlar/CustomUI/StatusPage/HeadOwnStatus.dart';

import '../CustomUI/StatusPage/OthersStatus.dart';
class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);
  @override
  State<StatusPage> createState() => _StatusPageState();
}
class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 48,
            child: FloatingActionButton(
              backgroundColor: Colors.blueGrey[100],
              elevation: 8,
              onPressed: () {},
            child: Icon(Icons.edit,
            color: Colors.blueGrey[900],

            ),
            ),
          ),
          SizedBox(height: 13,),
          FloatingActionButton(onPressed: () {},
            backgroundColor: Colors.greenAccent[700],
            elevation: 5,
          child: Icon(Icons.camera_alt),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //SizedBox(height: 10,),
            HeadOwnStatus(),
            label("Recent Updates"),
            OthersStatus(
              name: "Saurabh Chauhan",
              imageName: "assets/1.jpg",
              time: "01:45",
            ),
            OthersStatus(
              name: "Pragran Rover",
              imageName: "assets/a1.jpg",
              time: "06:05",
            ),
            OthersStatus(
              name: "Vikram Lander",
              imageName: "assets/saurabh.jpg",
              time: "08:35",
            ),
            SizedBox(height: 10,),
            label("Viewed Updates"),
            OthersStatus(
              name: "Pragran Rover",
              imageName: "assets/a1.jpg",
              time: "06:05",
            ),
            OthersStatus(
              name: "Vikram Lander",
              imageName: "assets/saurabh.jpg",
              time: "08:35",
            ),
          ],
        ),
      ),
    );

  }
  Widget label(String labelname)
  {
    return Container(
      height: 33,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 7),
        child: Text(labelname,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
