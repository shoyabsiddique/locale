import 'package:flutter/material.dart';

import '../widgets/textbox.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Color(0xff5aa7ff)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(children: [
              Container(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.6,
                    top: MediaQuery.of(context).size.height * 0.04),
                child: Image.asset("assets/logo.png", fit: BoxFit.cover),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, top: MediaQuery.of(context).size.height*0.13),
                child: Column(
                  children: [
                    Text(
                      "New User?",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width*0.08,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Lustria"
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      "Sign Up To Continue",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width*0.04,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Lustria"
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.26),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Color(0xff5aa7ff)),
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          children: [
                            MyTextBox(hint: "First Name", type: TextInputType.name,),
                            SizedBox(
                              height: 30,
                            ),
                            MyTextBox(hint: "Last Name", type: TextInputType.name),
                            SizedBox(
                              height: 30,
                            ),
                            MyTextBox(hint: "Phone Number", type: TextInputType.phone),
                            SizedBox(
                              height: 30,
                            ),
                            MyTextBox(hint: "Password", type: TextInputType.visiblePassword,),
                            SizedBox(
                              height: 30,
                            ),
                            MyTextBox(hint: "Confirm Password", type: TextInputType.visiblePassword,),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width*0.065,
                                      fontWeight: FontWeight.w700),
                                ),
                                CircleAvatar(
                                  radius: MediaQuery.of(context).size.width*0.065,
                                  backgroundColor: Color(0xff5aa7ff),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.9),
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
            ])));
  }
}
