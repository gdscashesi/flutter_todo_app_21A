import 'package:flutter/material.dart';
import 'package:todo/ui/screens/homescreen/homescreen.dart';
import 'package:todo/ui/widgets/background/background.dart';
import 'package:todo/ui/widgets/custom_button.dart';
import 'package:todo/ui/widgets/custom_textfield.dart';
import 'package:todo/ui/widgets/page_widget.dart';
import 'package:todo/ui/widgets/text_row.dart';
import 'package:todo/utils/constants.dart';


class LoginScreen extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();


  LoginScreen({
    Key? key
  }) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Background(
      backgroundColor: secondaryColor,
      // title: 'Sign up',
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Spacer(),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                  controller: email,
                  hintText: "Email",
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                    controller: password,
                    hintText: "Password",
                    obscureText: true
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                    text: "Log in",
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=> HomeScreen()
                          )
                      );
                    }
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextRow(
                  label: "Don't have an account?",
                  actionText: "Sign Up",
                  onPressed: (){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context)=> LoginScreen()
                        )
                    );
                  },
                ),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),

    );
  }
}
