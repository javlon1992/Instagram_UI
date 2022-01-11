import 'package:flutter/material.dart';

class Avatars extends StatefulWidget {
  static const String id="avatars";

  @override
  _AvatarsState createState() => _AvatarsState();
}

class _AvatarsState extends State<Avatars> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 112,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
         GestureDetector(
           onTap: (){},
           child: Padding(
            padding: const EdgeInsets.all(6.0),
             child: Column(
             children: [
             Stack(
               children: [
                 ClipRRect(
                     borderRadius: BorderRadius.circular(100),
                     child: Container(
                         height: 75,
                         width: 75,
                         child: Image.asset("asset/images/img_4.png", fit: BoxFit.cover,
                         ))),

                 Positioned(
                   bottom: 0,
                     right: 0,
                     child: CircleAvatar(
                     radius: 12,
                     child: Icon(Icons.add_circle_outline_rounded),
                 ))
               ],
             ),
               SizedBox(height: 8),
              Text("Your Story",style: TextStyle(color: Colors.white),),
             ],
             ),
             ),
         ),
          for(var i = 1; i < 7; i++) avatar(i)
        ],
      ),
    );
  }

  Padding avatar(int number){
  return Padding(
    padding: const EdgeInsets.all(6.0),
    child: Column(
      children: [
        Container(
          height: 79,
          width: 79,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2,color: Colors.deepPurple),
          ),
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
                //borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("asset/images/img_$number.png"))),
          ),
        ),
        const SizedBox(height: 5),
        Text("Username$number", style: const TextStyle(color: Colors.white),),
      ],
    ),
  );
}
}