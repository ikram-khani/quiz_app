import 'package:flutter/material.dart';
import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final int questionIndex;
  final List<Map<String, Object>> questions;
  final Function answerQuestions;
  const Quiz({
    required this.questions,
    required this.answerQuestions,
    required this.questionIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          (questions[questionIndex]['questionText'] as String),
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => answerQuestions(answer['score']), answer['text'] as String);
        }).toList()

        /// we first convert each answer in the list to the Answer widget through map() method (which is an Iterable list of widgets)
        /// Note: map doesn't modify the original list it actually create a new list
        /// then convert that widgets to list
        /// and with spread operator(...) we conevert the nested list in column to an individual value to the List(children) of column
      ],
    );
  }
}
