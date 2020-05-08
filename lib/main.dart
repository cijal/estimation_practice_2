import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'question_brain.dart';

void main() => runApp(EstimationPractice());

class EstimationPractice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  QuestionBrain qb = new QuestionBrain();
  String currentQuestion = '';
  String lastAnswerExplanation ='';
  var focusNode = new FocusNode();
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  void evaluateAnswer(int ans) {
    setState(() {

      if (qb.validateAnswer(ans)) {
        //if the answer is correct
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        // if the answer is wrong
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      loadQuestion();
    });
  }

  String loadQuestion(){
    if (currentQuestion.isNotEmpty){
      focusNode.requestFocus();
      lastAnswerExplanation=qb.explainLastAnswer();
      print(lastAnswerExplanation);
    }
    currentQuestion = qb.getQuestion();
    return currentQuestion;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,

          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Center(
              child: Text(

                loadQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.0,
                  // color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: 100.0,
            child: TextField(
              style: TextStyle(
                  fontSize: 25.0,
                  height: 2.0,
                  color: Colors.black
              ),
              focusNode: focusNode,
              controller: myController,
              decoration: new InputDecoration(

                  border: const OutlineInputBorder(),
                  labelText: "You answer in Millions",
                  fillColor: Colors.white),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              onSubmitted: (term) {
                if(myController.text.isNotEmpty) {
                  evaluateAnswer(int.parse(myController.text));
                  myController.clear();
                }
              },
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly
              ],
              // Only numbers can be entered
            ),
          ),
        ),
//        Expanded(
//          flex: 2,
//          child: Padding(
//            padding: EdgeInsets.all(15.0),
//            child: FlatButton(
//              color: Colors.green,
//              child: Text(
//                'Submit',
//                style: TextStyle(
//                  fontSize: 20.0,
//                  color: Colors.white,
//                ),
//              ),
//              onPressed: () {
//                evaluateAnswer(int.parse( myController.text));
//                myController.clear();
//                //The user picked false.
//              },
//            ),
//          ),
//        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text(
              lastAnswerExplanation)),
        ),
        Wrap(children: scoreKeeper),
      ],
    );

  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
