import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:locale/widgets/textbox.dart';

class SignUpProvider extends StatelessWidget {
  SignUpProvider({Key? key}) : super(key: key);
  static MyTextBox phone = MyTextBox(hint: "Phone", type: TextInputType.phone);
  static MyTextBox fname = MyTextBox(hint: "First Name", type: TextInputType.name);
  static MyTextBox lname = MyTextBox(hint: "Last Name", type: TextInputType.name);
  static MyTextBox address1 = MyTextBox(hint: "Address Line 1", type: TextInputType.streetAddress);
  static MyTextBox address2 = MyTextBox(hint: "Address Line 2", type: TextInputType.streetAddress);
  static MyTextBox pin = MyTextBox(hint: "Pin Code", type: TextInputType.number);
  static MyTextBox service = MyTextBox(hint: "Service Provided", type: TextInputType.text,);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        fname,
        SizedBox(height: 10,),
        lname,
        SizedBox(height: 10,),
        phone,
        SizedBox(height: 10,),
        address1,
        SizedBox(height: 10,),
        address2,
        SizedBox(height: 10,),
        pin,
        SizedBox(height: 10,),
        service,
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Add Your Pan Card"),
            ElevatedButton(
              onPressed: () async{
                var pickedFile = await FilePicker.platform.pickFiles();
                if(pickedFile != null){
                  print(pickedFile.files.first.name);
                }
              },
              child: Text("Choose File"),
            ),
          ],
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
    );;
  }
}
