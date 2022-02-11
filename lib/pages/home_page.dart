import 'package:flutter/material.dart';
import 'avatar.dart';

class HomePage extends StatefulWidget {
  static const String id="home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){},
            icon: Icon(Icons.photo_camera_outlined,color: Colors.white,),),
          title: Text("Instagram",style: TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 0,
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.chat,color: Colors.white,))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            // Fixed
            backgroundColor: Colors.grey.shade900,
            selectedItemColor: Colors.cyanAccent,
            unselectedItemColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 25,),label: null),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search, size: 25),label: null),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_box_outlined, size: 25),label: null),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border, size: 25),label: null),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline, size: 25),label: null),
            ]),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: ListView(
            children: [
              Avatars(),
              for(int i = 1; i < 7; i++) userPost(i),
              //Scroll(),
            ],
          ),
        ),
      ),
    );
  }
  Widget userPost(int number) {
    return Column(
      children: [

        /// User Image
        Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                            height: 40,
                            width: 40,
                            child: Image.asset("asset/images/img_$number.png", fit: BoxFit.cover,
                            ))),
                    SizedBox(width: 8),
                    Text("Username$number",style: TextStyle(color: Colors.white),),
                    Spacer(),
                    IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_outlined,color: Colors.white,))
                  ],
                ),
              )
            ],
          ),

        ),

        /// Post Image
        Container(
          height: 250,
          width: double.infinity,
          child: Image.asset("asset/images/img_$number.png",fit: BoxFit.cover),
        ),

        /// Icons
        Container(
          child: Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_rounded,color: Colors.white,)),
              IconButton(onPressed: (){}, icon: Icon(Icons.chat_bubble_outline_rounded,color: Colors.white,)),
              IconButton(onPressed: (){}, icon: Icon(Icons.send_rounded,color: Colors.white,)),
              Spacer(),
              IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_border,color: Colors.white,)),
            ],
          ),
        ),

        /// Comments
        Container(
          padding: EdgeInsets.only(left: 8,right: 8,bottom: 5),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("89 Likes by Sarah, John, Brine ...",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
              Text("This is the Demo App Description etc.",style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
      ],
    );
  }
  Future<bool> onWillPop(){
    DateTime now = DateTime.now();
    if(currentBackPressTime == null || now.difference(currentBackPressTime!)>Duration(seconds: 2)){
      currentBackPressTime = now;
      return Future.value(false);
    }
    return Future.value(true);
  }
}
