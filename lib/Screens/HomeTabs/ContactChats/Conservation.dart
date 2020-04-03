import 'package:flutter/material.dart';
class Conservation extends StatefulWidget {
  @override
  _ConservationState createState() => _ConservationState();
}

class _ConservationState extends State<Conservation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xffECE5DD),
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).maybePop();
          },
          icon: Icon(Icons.arrow_back),
          ),
        title: ListTile(
          leading: CircleAvatar(),
          title: ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text("Johy Shon"),
            subtitle: Text("yesterday"),
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.videocam),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.call),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.more_vert),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white
                  ),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.insert_emoticon),
                      ),
                      SizedBox(width: 5.0,),
                      Container(
                        child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type a message"
                        ),
                      ),
                      ),
                      IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.attach_file),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.camera_alt),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(100),
                         color: Colors.redAccent
                       ),
                       child: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.mic),
                      ),
                     )
            ],
          )
        ],
      ),
    );
  }
}
