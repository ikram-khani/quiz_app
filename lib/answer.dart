import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;
  Answer(this.selectHandler, this.answerText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white)),
        onPressed: selectHandler,
        child: Text(answerText),
      ),
    );
  }
}

///Colors.white
///the Colors class has static variables(properties) such as white,red,blue etc which can be accessed without instantiation (creating instance of the class (Colors().white )) 
///enum is a value where you choose from multiple possible choices. you
///choose by selecting a human-readable label, behind the scenes the labels are mapped to integers(0,1,2.....) TextAlign.center (center is enum)