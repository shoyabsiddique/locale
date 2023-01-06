import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'login.dart';

class OTP extends StatefulWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String code = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xff5aa7ff)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.6,
                      top: MediaQuery.of(context).size.height * 0.04),
                  child: Image.asset("assets/logo.png", fit: BoxFit.cover),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.2),
                    child: Column(
                      children: [
                        Icon(
                          Icons.key,
                          size: MediaQuery.of(context).size.width*0.5,
                          color: Colors.white,
                        ),
                        Text(
                          "OTP Verification",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width*0.08,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Lustria"),
                        ),
                        Text(
                          "Enter verification code sent on ${Login.phone}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width*0.045,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Lustria",
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 30,),
                        Container(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.02, right: MediaQuery.of(context).size.width*0.02),
                          child: Pinput(
                            length: 6,
                            onChanged: (data){
                              this.code = data;
                            },
                          ),
                        ),
                    SizedBox(height: 30,),
                    Container(
                        child: CupertinoButton(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          onPressed: () async{
                            try {
                              PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: Login.verify, smsCode: this.code);
                              await auth.signInWithCredential(credential);
                              print(this.code);
                              Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
                            } on Exception catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Row(
                                    children: [
                                      Icon(
                                        Icons.error,
                                        color: Colors.red,
                                      ),
                                      Text('Incorrect OTP'),
                                    ],
                                  ),
                                  duration: Duration(seconds: 3),
                                  action: SnackBarAction(
                                    label: 'Dismiss',
                                    onPressed: () {
                                      // Dismiss the snackbar
                                    },
                                  ),
                                ),
                              );

                              print(e);
                            }
                          },
                          child: Text(
                            "Verify",
                            style: TextStyle(
                                color: Colors.black
                            ),
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                        )
                    ),
                    SizedBox(height: 10,),
                    Center(
                      child: Container(
                        child: TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Change Phone Number",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.width*0.045,
                                decoration: TextDecoration.underline
                            ),
                          ),
                        ),
                      ),
                    )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
