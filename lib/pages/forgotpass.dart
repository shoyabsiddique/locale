import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:locale/widgets/textbox.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff5aa7ff),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.6,
                  top: MediaQuery.of(context).size.height * 0.04),
              child: Image.asset("assets/logo.png", fit: BoxFit.cover),
            ),
            Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.2),
                child: Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.lock,
                        size: MediaQuery.of(context).size.width*0.5,
                        color: Colors.white,
                      ),
                      Text(
                        "Forgot Your Password?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width*0.08,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Lustria"),
                      ),
                      Text(
                        "Enter your account phone number to reset password",
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
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.06, right: MediaQuery.of(context).size.width*0.06),
                          child: MyTextBox(hint: "Phone Number",type: TextInputType.phone,)),
                      SizedBox(height: 30,),
                      Container(
                        child: CupertinoButton(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          onPressed: (){},
                          child: Text(
                            "Send OTP",
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
                              "Go Back To Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.width*0.045,
                                  decoration: TextDecoration.underline
                              ),
                            ),
                          ),
                        ),
                      )
                  ]),
                ))
          ],
        ),
      ),
    );
  }
}
