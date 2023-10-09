import 'package:flutter/material.dart';
import 'package:kevlar/Model/ChatModel.dart';
import 'package:kevlar/Pages/CameraPage.dart';
import 'package:kevlar/Pages/ChatPage.dart';
import 'package:kevlar/Pages/StatusPage.dart';
import 'package:snippet_coder_utils/hex_color.dart';
class Homescreen extends StatefulWidget {
  const Homescreen({Key? key,required this.chatmodals,required this.sourcechat}) : super(key: key);
  final List<ChatModel> chatmodals;
  final ChatModel sourcechat;

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with SingleTickerProviderStateMixin{
  late TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=TabController(length: 4, vsync: this,initialIndex: 1);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 9, 110, 103),
        title: Text("Whatsapp Clone"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          //IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          PopupMenuButton <String>(
              onSelected: (value){
                print(value);
              },
              itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(child: Text("New Group"), value: "New Group",),
              PopupMenuItem(child: Text("New broadcast"), value: "New broadcast",),
              PopupMenuItem(child: Text("Whatsapp web"), value: "Whatsapp web",),
              PopupMenuItem(child: Text("Starred Message"), value: "Starred Message",),
              PopupMenuItem(child: Text("Setting"), value: "Setting",),
            ];
          })
        ],
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: "CHATS",
            ),
            Tab(
              text: "STATUS",
            ),
            Tab(
              text: "CALLS",
            ),
          ],
        ),
      ),
      body:  TabBarView(
          controller: _controller,
          children: [
      CameraPage(),
      ChatPage(
        chatmodals: widget.chatmodals,
        sourcechat: widget.sourcechat,
      ),
      StatusPage(),
      Text("CALLS"),
    ],
      ),
    );
  }
}
