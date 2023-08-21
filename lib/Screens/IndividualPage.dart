import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:kevlar/Model/ChatModel.dart';
import 'package:flutter_svg/flutter_svg.dart';
class IndividualPage extends StatefulWidget {
  const IndividualPage({Key? key,required this.chatModel}) : super(key: key);
  final ChatModel chatModel;
  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show=false;
  final TextEditingController _controller=TextEditingController();
  FocusNode focusNode=FocusNode();
  @override
 void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
     if(focusNode.hasFocus)
       {
         setState(() {
           show=false;
         });
       }
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 70,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back,
              size: 24,
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blueGrey,
                child:
                  SvgPicture.asset(widget.chatModel.isGroup? "assets/groups.svg":"assets/person.svg",
                  color: Colors.white,
                  height: 38,
                  width: 38,
                ),
              )
            ],
          ),
        ),
        title: InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.chatModel.name,
                style: TextStyle(
                  fontSize: 18.5,
                  fontWeight: FontWeight.bold,
                ),
                ),
                Text("last seen today at 12:05",
                style: TextStyle(
                  fontSize: 13,
                )
                  ,),

              ],
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
          PopupMenuButton <String>(
              onSelected: (value){
                print(value);
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(value: "View Contact",child: Text("View Contact"),),
                  PopupMenuItem(value: "Media,Links,and doc",child: Text("Media,Links,and docs"),),
                  PopupMenuItem(value: "Search",child: Text("Search"),),
                  PopupMenuItem(value: "Mute Notification",child: Text("Mute Notification"),),
                  PopupMenuItem(value: "Wallpaper",child: Text("Wallpaper"),),
                ];
              }),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
          child:
          Stack(
            children: [

              ListView(

              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                            width:MediaQuery.of(context).size.width - 60,
                            child: Card(
                              margin: EdgeInsets.only(left: 2,right: 2,bottom: 8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              child: TextFormField(
                                controller: _controller,
                                focusNode: focusNode,
                                textAlignVertical: TextAlignVertical.center,
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                minLines: 1,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Type a message",
                                  contentPadding: EdgeInsets.all(5),
                                  prefixIcon:
                                  IconButton(onPressed: () {
                                    focusNode.unfocus();
                                    focusNode.canRequestFocus=false;
                                    setState(() {
                                      show=!show;
                                    });
                                  },
                                      icon: Icon(Icons.emoji_emotions),),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(onPressed: () {
                                        showModalBottomSheet(

                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (builder)=>bottomsheet()
                                        );
                                      },
                                          icon: Icon(Icons.attach_file),),
                                      IconButton(onPressed: () {},
                                        icon: Icon(Icons.camera_alt),),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0,right: 5,left: 2),
                          child: CircleAvatar(
                            backgroundColor: Color(0xFF128C7E),
                            radius: 25,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.mic,color: Colors.white,),
                            ),

                          ),
                        ),
                      ],
                    ),
                    show?emojiSelect():Container(),
                  ],
                ),
              ),
            ],
          ),
          //Used to back press to back pointer from text field to chat page
          onWillPop: ()  {
            if(show) {
              setState(() {
                show = false;
              });
            }
            else
              {
                Navigator.pop(context);

              }
            return Future.value(false);
          },
        ),
      ),
    );
  }
  Widget bottomsheet()
  {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(Icons.insert_drive_file,Colors.indigo,"Document"),
                  SizedBox(width: 40,),
                  iconcreation(Icons.camera_alt,Colors.pink,"Camera"),
                  SizedBox(width: 40,),
                  iconcreation(Icons.insert_photo,Colors.purple,"Gallary"),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(Icons.headset,Colors.orange,"Audio"),
                  SizedBox(width: 40,),
                  iconcreation(Icons.location_pin,Colors.teal,"Location"),
                  SizedBox(width: 40,),
                  iconcreation(Icons.person,Colors.blue,"Contact"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget iconcreation(IconData icon,Color color,String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icon,
              size: 29,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5,),
          Text(text,style: TextStyle(
            fontSize: 12,
          ),),
        ],
      ),
    );
  }
  Widget emojiSelect()
  {
    return SizedBox(
      height:325,
      child: EmojiPicker(
        //textEditingController: _textController,
        config: const Config
          (
          columns: 7,
          ),
        onEmojiSelected: (category,emoji)
        {
          print(emoji);
          setState(() {
            _controller.text = _controller.text + emoji.emoji ;
          });
        }
      ),
    );
  }
}
