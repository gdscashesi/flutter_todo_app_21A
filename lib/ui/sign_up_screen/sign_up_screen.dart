import 'package:flutter/material.dart';
import 'package:todo/ui/screens/homescreen/homescreen.dart';
import 'package:todo/ui/screens/login_screen/login_screen.dart';
import 'package:todo/ui/widgets/custom_button.dart';
import 'package:todo/ui/widgets/custom_textfield.dart';
import 'package:todo/ui/widgets/page_widget.dart';
import 'package:todo/ui/widgets/text_row.dart';


class SignUpScreen extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();


  SignUpScreen({
    Key? key
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return PageWidget(
      title: 'Sign up',
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
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
                child: CustomTextField(
                    controller: password,
                    hintText: "Password",
                    obscureText: true
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                    text: "Sign up",
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
                  label: "Already have an account?",
                  actionText: "Sign In",
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
