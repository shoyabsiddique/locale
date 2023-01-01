import 'package:flutter/material.dart';
import 'package:locale/widgets/signup_provider.dart';
import 'package:locale/widgets/signup_user.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Map<String, Widget> map = {
    "user": Text("User"),
    "provider": Text("Provider"),
  };
  List<bool> _isSelected = [true, false];
  dynamic Signupscreen = SignUpUser();
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Color(0xff5aa7ff)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(children: [
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.04),
                child: Row(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(
                        Icons.keyboard_arrow_left_sharp,
                      color: Colors.white,
                    )),
                    Image.asset("assets/logo.png", width: MediaQuery.of(context).size.width * 0.4,),
                  ],
                ),
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
                            ToggleButtons(
                              constraints: BoxConstraints.expand(width: MediaQuery.of(context).size.width*0.4),
                              textStyle: TextStyle(fontSize: MediaQuery.of(context).size.width*0.05),
                              children: map.entries.map((e) => e.value).toList(),
                              borderWidth: 3,
                              borderColor: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                              isSelected: _isSelected,
                              selectedColor: Colors.blueGrey,
                              selectedBorderColor: Color(0xff5aa7ff),
                              onPressed: (value) {
                                setState(() {
                                  _isSelected = List.filled(map.length, false);
                                  _isSelected[value] = true;
                                  if(_isSelected[0] == true)
                                    Signupscreen = SignUpUser();
                                  else
                                    Signupscreen = SignUpProvider();
                                });
                              },
                            ),
                            SizedBox(height: 10,),
                            Signupscreen
                          ],
                        )
                      ),
                    ),
                  )
              ),

            ])));
  }
}
