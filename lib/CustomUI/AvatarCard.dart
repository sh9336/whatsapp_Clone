import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kevlar/Model/ContactModal.dart';
class AvatarCard extends StatelessWidget {
  const AvatarCard({Key? key,required this.contact}) : super(key: key);
  final ContactModel contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 23,
                child: SvgPicture.asset("assets/person.svg",
                  color: Colors.white,height: 30,width: 30,
                ),
                backgroundColor: Colors.blueGrey[200],
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 11,
                  child: Icon(
                    Icons.clear,
                    color: Colors.white,
                    size: 13,
                  ),
                ),
              ) ,

            ],
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            contact.name,
          style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
