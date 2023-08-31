import 'package:flutter/material.dart';
import 'package:kevlar/CustomUI/ButtonCard.dart';
import 'package:kevlar/Model/ChatModel.dart';
import 'package:kevlar/Screens/Home.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ChatModel sourceChat;
  List<ChatModel>  chatmodals = [
    ChatModel(
      name: "Saurabh Chauhan",
      icon: "person.svg",
      isGroup: false,
      time: "2:00",
      currentMessage: "Hi Saurabh Chauhan",
      id: 1,
    ),
    ChatModel(
      name: "Shubham Chauhan",
      icon: "person.svg",
      isGroup: false,
      time: "9:00",
      currentMessage: "Hi Shubham Chauhan",
      id: 2,
    ),
    ChatModel(
      name: "Pragyaan Rover",
      icon: "person.svg",
      isGroup: false,
      time: "9:00",
      currentMessage: "Hi Pragyaan Rover",
      id: 3,
    ),
    ChatModel(
      name: "Chandrayaan",
      icon: "person.svg",
      isGroup: false,
      time: "9:00",
      currentMessage: "Hi Chandrayaan",
      id: 4,
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chatmodals.length,
          itemBuilder: (context,index)=>InkWell(
            onDoubleTap: () {
              sourceChat= chatmodals.removeAt(index);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=> Homescreen(
                chatmodals: chatmodals,
                sourcechat: sourceChat,
              )));
            },
            child: ButtonCard(name: chatmodals[index].name,
      icon: Icons.person,
      ),
          )),
    );
  }
}
