import 'package:flutter/material.dart';
import 'package:kevlar/CustomUI/ContactCard.dart';
import 'package:kevlar/Model/ContactModal.dart';
import 'package:kevlar/Screens/CreateGroup.dart';
import 'package:kevlar/Screens/Home.dart';

import '../CustomUI/ButtonCard.dart';
class SelectContact extends StatefulWidget {
  const SelectContact({Key? key}) : super(key: key);

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    List<ContactModel> contacts = [
      ContactModel(
          name: "Saurabh",
          status: "Android app developer",),
      ContactModel(
        name: "Shubham",
        status: "Kotlin app developer",),
      ContactModel(
        name: "Karl",
        status: "IOs app developer",),
      ContactModel(
        name: "Saurabh",
        status: "Android app developer",),
      ContactModel(
        name: "Shubham",
        status: "Kotlin app developer",),

    ];
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Contact",style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),),
            Text('25 contacts',style: TextStyle(
              fontSize: 13,
            ),),
          ],
        ),
        actions: [IconButton(onPressed: () {},
          icon: Icon(Icons.search,size: 26,),),
          PopupMenuButton <String>(
              onSelected: (value){
                print(value);
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(child: Text("Invite a Friend"), value: "Invite a Friend",),
                  PopupMenuItem(child: Text("Contacts"), value: "Contacts",),
                  PopupMenuItem(child: Text("Refresh"), value: "Refresh",),
                  PopupMenuItem(child: Text("Help"), value:"Help",),
                  //PopupMenuItem(child: Text("Wallpaper"), value: "Wallpaper",),
                ];
              }),
        ],
      ),
      body: ListView.builder(
       itemCount: contacts.length+2,
       itemBuilder: (context,index)
          {
            if(index==0)
              {
                return InkWell(
                  onDoubleTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=>CreateGroup()));
                  },
                  child: ButtonCard
                    (
                    icon: Icons.group,
                    name: "New Group",
                  ),
                );
              }
            else if(index==1)
              {
                return ButtonCard
                  (
                  icon: Icons.person_add,
                  name: "New Contact",
                );
              }
            return ContactCard
              (
              contact: contacts[index-2],
            );
          }
      ),
    );
  }
}
