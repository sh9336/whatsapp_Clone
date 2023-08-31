import 'package:flutter/material.dart';
import 'package:kevlar/CustomUI/CustomCard.dart';
import 'package:kevlar/Model/ChatModel.dart';
import 'package:kevlar/Screens/SelectContact.dart';
class ChatPage extends StatefulWidget {
  const ChatPage({Key? key,required this.chatmodals,required this.sourcechat}) : super(key: key);
  final List<ChatModel> chatmodals;
  final ChatModel sourcechat;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       floatingActionButton: FloatingActionButton(onPressed: () {
         Navigator.push(context, MaterialPageRoute(builder: (builder)=>SelectContact()));
       },
       child: Icon(Icons.chat),    
       ),
      body: ListView.builder(
        itemCount: widget.chatmodals.length,
        itemBuilder: (context,index)=>CustomCard(
            chatModel: widget.chatmodals[index],
          sourcechat: widget.sourcechat,
        ),
      ),
    );
  }
}
