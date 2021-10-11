import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const CustomButton({Key? key,
    required this.text,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ElevatedButton(
        style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
                const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 18
                )
            ),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(232)
            )),
            // backgroundColor: MaterialStateProperty.all(Colors.white),
            padding: MaterialStateProperty.all(const EdgeInsets.all(16))
        ),
        child: SizedBox(
            width: size.width * 0.7,
            child:  Center(child: Text(text))),
        onPressed: onPressed,
      );
  }
}
