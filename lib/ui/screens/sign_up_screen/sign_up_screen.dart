import 'package:flutter/material.dart';
import 'package:todo/ui/screens/homescreen/homescreen.dart';
import 'package:todo/ui/screens/login_screen/login_screen.dart';
import 'package:todo/ui/widgets/custom_button.dart';
import 'package:todo/ui/widgets/custom_textfield.dart';
import 'package:todo/ui/widgets/page_widget.dart';
import 'package:todo/ui/widgets/text_row.dart';
import 'package:provider/provider.dart';
import 'package:todo/utils/providers/app_state.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  late AppState appState;

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
                child: CustomTextField(
                    controller: confirmPassword,
                    hintText: "Confirm password",
                    obscureText: true
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                    text: "Sign up",
                    onPressed: () {

                      context.read<AppState>().signUp(
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
