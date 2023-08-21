import 'package:flutter/material.dart';
import 'package:kevlar/CustomUI/CustomCard.dart';
import 'package:kevlar/Model/ChatModel.dart';
import 'package:kevlar/Screens/SelectContact.dart';
class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel>  chats = [
    ChatModel(
        name: "Saurabh Chauhan",
        icon: "person.svg",
        isGroup: false,
        time: "2:00",
        currentMessage: "Hi Saurabh Chauhan",
    ),
    ChatModel(
      name: "FreindZone",
      icon: "groups.svg",
      isGroup: true,
      time: "12:00",
      currentMessage: "Hi Everyone",
    ),
    ChatModel(
      name: "Shubham Chauhan",
      icon: "person.svg",
      isGroup: false,
      time: "9:00",
      currentMessage: "Hi Shubham Chauhan",
    ),
    ChatModel(
      name: "FreindList",
      icon: "groups.svg",
      isGroup: true,
      time: "11:00",
      currentMessage: "Hi Everyone",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       floatingActionButton: FloatingActionButton(onPressed: () {
         Navigator.push(context, MaterialPageRoute(builder: (builder)=>SelectContact()));
       },
       child: Icon(Icons.chat),    
       ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context,index)=>CustomCard(
            chatModel: chats[index],
        ),

      ),
    );
  }
}
