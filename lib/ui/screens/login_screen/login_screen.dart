import 'package:flutter/material.dart';
import 'package:todo/ui/screens/homescreen/homescreen.dart';
import 'package:todo/ui/screens/sign_up_screen/sign_up_screen.dart';
import 'package:todo/ui/widgets/background/background.dart';
import 'package:todo/ui/widgets/custom_button.dart';
import 'package:todo/ui/widgets/custom_textfield.dart';
import 'package:todo/ui/widgets/page_widget.dart';
import 'package:todo/ui/widgets/text_row.dart';
import 'package:todo/utils/constants.dart';
import 'package:todo/utils/providers/app_state.dart';
import 'package:provider/provider.dart';


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
      child: PageWidget(
        title: 'Log In',
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Spacer(),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomTextField(
                controller: email,
                hintText: "Email",
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(12.0),
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

                    context.read<AppState>().signIn(
                        context: context,
                        email: email.text,
                        password: password.text).then((value) {
                      if (value){
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context)=> const HomeScreen()
                            )
                        );
                      }
                    });
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
                      MaterialPageRoute(builder: (context)=> SignUpScreen()
                      )
                  );
                },
              ),
            ),

            const Spacer(),
          ],
        )
      ),

    );
  }
}
