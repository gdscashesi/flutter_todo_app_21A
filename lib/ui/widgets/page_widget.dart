import 'package:flutter/material.dart';
import 'package:todo/ui/widgets/background/background.dart';
import 'package:todo/utils/constants.dart';


class PageWidget extends StatelessWidget {
  final Widget child;
  final String title;
  final FloatingActionButton? floatingActionButton;

  const PageWidget({
    required this.child,
    required this.title,
    this.floatingActionButton,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return Background(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),


      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: size.height * 0.05),
          child: floatingActionButton),

      backgroundColor: secondaryColor,
      child: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [

              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(title, style: Theme.of(context).textTheme.headline4,),
              ),

              Container(
                width: size.width,
                height: size.height * 0.85,
                padding: const EdgeInsets.only(top:16),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    )
                ),
                child: child,
              )

            ],
          ),
        ),
      ),
    );
  }
}
