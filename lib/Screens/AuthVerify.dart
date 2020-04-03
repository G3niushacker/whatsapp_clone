import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Screens/HomeScreen.dart';
class AuthVerify extends StatefulWidget {
  @override
  _AuthVerifyState createState() => _AuthVerifyState();
}

class _AuthVerifyState extends State<AuthVerify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
        title: Text("Verify OTP"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
           Container(
            ),
          
          Container(
            height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white
              ),
             
               child: Stack(
                  children: <Widget>[
                  Align(
                    alignment: Alignment(0.1, 0.4),
                    child: Image.asset("images/phoneAuth.png",width: 100,height: 100,),
                  ),
                  firstText(),
                  verifyTextFeild(),
                  vrifyValid(),
                  verifyButton(context),
                  didNotGetCode(),
          
                  ],
                ),
              
            )
        ],
      ),
    );
  }
}
Widget firstText(){
  return Padding(
    padding: const EdgeInsets.only(top:80.0,bottom: 60.0),
    child: Text("Enter 4 digit code you recieved now in\n your phone to continue"),
  );
}
Widget verifyTextFeild(){
  return  Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(),
  );
}
Widget vrifyValid(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text("Code expire in 30"),
  );
}
Widget verifyButton(BuildContext context){
  return Padding(
      padding: const EdgeInsets.only(top:20.0,right: 15.0,left: 15.0),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        color: Colors.redAccent,
        shape: StadiumBorder(),
        onPressed: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomeScreen()
          ));
        },
        child: Text("Verify"),
      ),
    );
}
Widget didNotGetCode(){
  return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Didn't get the code?"),
        FlatButton(
          onPressed: (){},
          child: Text("resend"),
        )
      ],
   );
}