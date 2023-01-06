import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:locale/widgets/textbox.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);
  static String phone = "";
  static String verify = "";
  static MyTextBox phoneM = MyTextBox(hint: "Phone Number",type: TextInputType.phone,);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final images = [
    "assets/1.png",
    "assets/2.png",
    "assets/3.png"
  ];
  int activeIndex = 0;
  showAlertDialog(BuildContext context){
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xff5aa7ff)),
          ),
          SizedBox(width: 8,),
          Text("Please Wait")
        ],
      ),
    );
    showDialog(context: context, builder: (BuildContext context){
      return alert;
    });
  }
  Widget buildImage(String image, int index) => Container(
    margin: EdgeInsets.symmetric(horizontal: 5),
    child: Image.asset(image, fit: BoxFit.fitWidth),
  );
  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: images.length,
    effect: ExpandingDotsEffect(
      dotWidth: 15,
      activeDotColor: Colors.white,
      dotColor: Colors.black
    )
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff5aa7ff)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.6, top: MediaQuery.of(context).size.height*0.04),
              child: Image.asset("assets/logo.png", fit: BoxFit.cover),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: MediaQuery.of(context).size.height*0.12),
              child: Text(
                "Welcome Back!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width*0.08,
                  fontFamily: "Lustria"
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.2),
              child: Column(
                children: [
                  CarouselSlider(
                    items: images.map((item) => Container(
                      child: Center(
                          child:
                          Image.asset(item, fit: BoxFit.contain, width: MediaQuery.of(context).size.width*0.7)),
                    )).toList(),
                    options: CarouselOptions(
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      onPageChanged: (index, reason){
                        setState(() {
                          activeIndex = index;
                        });
                      }
                    )
                  ),
                  SizedBox(height: 12,),
                  buildIndicator()
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.56),
              child: SingleChildScrollView(
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Color(0xff5aa7ff)
                    ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  color: Colors.white,
                  child: Container(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Login.phoneM,
                        SizedBox(height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Sign in",
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width*0.065,
                                fontWeight: FontWeight.w700
                              ),
                            ),
                            CircleAvatar(
                              radius: MediaQuery.of(context).size.width*0.065,
                              backgroundColor: Color(0xff5aa7ff),
                              child: IconButton(
                                onPressed: () async{
                                  showAlertDialog(context);
                                  await FirebaseAuth.instance.verifyPhoneNumber(
                                    phoneNumber: "+91 "+Login.phoneM.value,
                                    verificationCompleted: (PhoneAuthCredential credential) {},
                                    verificationFailed: (FirebaseAuthException e) {
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Row(
                                            children: [
                                              Icon(
                                                Icons.error,
                                                color: Colors.red,
                                              ),
                                              Text('Phone Number Verification Failed'),
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

                                    },
                                    codeSent: (String verificationId, int? resendToken) {
                                      Login.verify = verificationId;
                                      Navigator.pushNamed(context, '/otp');
                                    },
                                    codeAutoRetrievalTimeout: (String verificationId) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Row(
                                            children: [
                                              Icon(
                                                Icons.error,
                                                color: Colors.red,
                                              ),
                                              Text('Sms not sent'),
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
                                    },
                                  );
                                },
                                icon: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: (){
                                Navigator.pushNamed(context, '/signup');
                              },
                              child: Text("Sign Up", style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: MediaQuery.of(context).size.width*0.045,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff5aa7ff)
                              ),)
                            ),
                            TextButton(
                                onPressed: (){
                                  Navigator.pushNamed(context, '/forgotpass');
                                },
                                child: Text("Forgot Password", style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: MediaQuery.of(context).size.width*0.045,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff5aa7ff)
                                ),)
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
