import 'package:flutter/material.dart';
import 'package:kevlar/CustomUI/AvatarCard.dart';
import 'package:kevlar/CustomUI/ContactCard.dart';
import 'package:kevlar/Model/ContactModal.dart';
import '../CustomUI/ButtonCard.dart';
class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);
  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
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
      name: "Kevin",
      status: "Kotlin app developer",),
  ];
  List<ContactModel> group=[];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("New Group",style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),),
            Text('Add Participants',style: TextStyle(
              fontSize: 13,
            ),),
          ],
        ),
        actions: [IconButton(onPressed: () {},
          icon: Icon(Icons.search,size: 26,),),
        ],
      ),
      body: Stack(
        children:[ ListView.builder(
            itemCount: contacts.length+1,
            itemBuilder: (context,index)
            {
              if(index==0){
                return Container(
                  height: group.length>0?90:10,
                );
              }
              return InkWell(
                onTap: (){
                  if(contacts[index-1].select==false)
                    {
                      setState(() {
                        contacts[index-1].select=true;
                        group.add(contacts[index-1]);
                      });
                    }
                  else
                    {
                      contacts[index-1].select=false;
                      group.remove(contacts[index-1]);
                    }
                },
                child: ContactCard(
                  contact: contacts[index-1],
                ),
              );
            }
        ),
          group.length > 0 ? Column(
            children: [
              Container(
                height: 75,
                color: Colors.white,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: contacts.length,
                  itemBuilder: (context,index)
                   {
                       if(contacts[index].select==true)
                        {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                contacts[index].select=false;
                                group.remove(contacts[index]);
                              });
                            },
                            child: AvatarCard(
                                contact: contacts[index],
                            ),
                          );
                        }
                       else
                       {
                         return Container();
                       }
                    }),
              ),
              Divider(
                thickness: 1,
              ),
            ],
          ):Container(),
      ]
      ),
    );
  }
}
