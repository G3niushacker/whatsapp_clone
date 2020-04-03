import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Screens/HomeTabs/ContactsChat.dart';
import 'package:whatsapp_clone/Screens/HomeTabs/GroupsChats.dart';
import 'package:whatsapp_clone/Screens/HomeTabs/NewsFeed.dart';
import 'package:whatsapp_clone/Screens/HomeTabs/Profile.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
       appBar: AppBar(
       backgroundColor: Colors.redAccent,
       elevation: 0.0,
       title: Text("Comunicate.App"),
       bottom: TabBar(
         indicatorColor: Colors.white,
         tabs: <Widget>[

           Tab(
             icon:Icon(Icons.art_track),
           ),

           Tab(
             icon:Icon(Icons.person)
           ),

           Tab(
             icon:Icon(Icons.chat)
           ),

           Tab(
             icon:Icon(Icons.group)
           )
         ],
       ),
       actions: <Widget>[

         IconButton(
           onPressed: (){},
           icon: Icon(Icons.search),
         ),

         IconButton(
           onPressed: (){},
           icon: Icon(Icons.more_vert),
         )         
       ],
     ),
     body: TabBarView(
       children: <Widget>[
         NewsFeed(),
         Profile(),
         ContactsChat(),
         GroupsChats()
       ],
     ),
    )
    );
  }
}