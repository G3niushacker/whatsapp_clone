import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Models/PhoneAuth.dart';
import 'package:whatsapp_clone/Screens/AuthVerify.dart';
import 'HomeScreen.dart';

enum AuthFormType {PhRegister , Reset}

class Authentication extends StatefulWidget {


  @override
  AuthenticationState createState() => AuthenticationState();
}

class AuthenticationState extends State<Authentication> {
  String dropdownValue;
  String _phoneNum;
  String verficationId;
  String smsCode;
  String _country;
  String errorMessage = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> phoneVerification() async {
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      this.verficationId = verId;
    };
    signIn() async {
      try {
        final AuthCredential credential = PhoneAuthProvider.getCredential(
          verificationId: verficationId,
          smsCode: smsCode,
        );
        final AuthResult user = await FirebaseAuth.instance.signInWithCredential(credential);
        final FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    HomeScreen()));
      } catch (e) {
        print(e);
      }
    }
    Future<bool> smsOTPDialog(BuildContext context) {
      return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return new AlertDialog(
              title: Text('Enter SMS Code'),
              content: Container(
                height: 85,
                child: Column(children: [
                  TextField(
                    onChanged: (value) {
                      this.smsCode = value;
                    },
                  ),
                  (errorMessage != ''
                      ? Text(
                    errorMessage,
                    style: TextStyle(color: Colors.red),
                  )
                      : Container())
                ]),
              ),
              contentPadding: EdgeInsets.all(10),
              actions: <Widget>[
                FlatButton(
                  child: Text('Done'),
                  onPressed: () {

                    FirebaseAuth.instance.currentUser().then((user) {
                      if (user != null) {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    HomeScreen()));
                      } else {
                        signIn();
                      }
                    });
                  },
                )
              ],
            );
          });
    }
    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
      Navigator.pop(context);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  Authentication()));
      this.verficationId = verId;
      smsOTPDialog(context).then((value) {
      });
    };

    final PhoneVerificationCompleted verfiSuccess = (
        AuthCredential credential) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  HomeScreen()));
      print('verified');
    };
    final PhoneVerificationFailed verfiFailed = (AuthException exception) {
      print('${exception.message}');
    };
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber:    _phoneNum,
        timeout: const Duration (seconds: 5),
        verificationCompleted: verfiSuccess,
        verificationFailed: verfiFailed,
        codeSent: smsCodeSent,
        codeAutoRetrievalTimeout: autoRetrieve);
  }
  Widget _buildDropdownItem(Country country) => Container(
    height: 30,
    width: 140,
    child: Row(
      children: <Widget>[
        CountryPickerUtils.getDefaultFlagImage(country),
        SizedBox(
          width: 8.0,
        ),
        Text("+${country.phoneCode}(${country.isoCode})"),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
           Container(
             child: Image.asset("images/msg.png",height:100,width: 100,),
           ),
           SizedBox(
             height: 200,
           ),
           Container(
             color: Colors.white,
             child: Column(
               children: <Widget>[
                  SizedBox(
              height: 20,
            ),
                  Padding(
              padding: EdgeInsets.only(left: 10, bottom: 10,right: 30),
              child: Row(
                children: <Widget>[
                  CountryPickerDropdown(
                    initialValue: 'pk',
                    itemBuilder: _buildDropdownItem,
                    onValuePicked: (Country country) {
                       print("${country.name}");
                      print("${country.phoneCode}");
                    },
                  ),
                  Expanded(
                    child: Container(
                      width: width / 1.6,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Phone Number';
                          }
                          if (value.trim() == "")
                            return "Only Space is Not Valid!!!";
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          _phoneNum = value;
                        },
                        //controller: _nameController,
                        decoration: InputDecoration(
                          hintText: '+923366961132',
                            focusedBorder: new UnderlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Color(0xFF004E75),
                                    width: 2,
                                    style: BorderStyle.solid)),
                            labelText: "Phone Number",
                            fillColor: Colors.white,
                            labelStyle: TextStyle(
                              color: Color(0xFF004E75),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                color: Color(0xFF004E75),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: InkWell(
                  child: Text(
                    (' Verify'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    phoneVerification();
//                    if (isUpdate) {
//                      if (_globalKey.currentState.validate()) {
//                        _globalKey.currentState.save();
//                        editStudent();
//                      }
//                    } else {
//                      if (_globalKey.currentState.validate()) {
//                        _globalKey.currentState.save();
//                        addStudent();
//                        print(key);
//                      }
//                    }
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            )
               ],
             ),
           )
          ],
        ),
      ),
    );
  }

}