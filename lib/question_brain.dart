import 'dart:math';

class QuestionBrain {
  int _currentPercent;
  int _currentBaseNum;

  String getQuestion(){
    _currentPercent = new Random().nextInt(90)+10;
    _currentBaseNum = (new Random().nextInt(99))*10;


    return '$_currentPercent% of $_currentBaseNum Million?';
  }
  bool validateAnswer(int ans){
    print('Answer: $ans');
    int perfectAns =  (_currentBaseNum*_currentPercent)~/100;
    print ('Perfect answer = $perfectAns');
    int diff = ((ans-perfectAns).abs());
    print('difference is : $diff');

    int diffPercent = ((diff/perfectAns)*100).toInt();
    print ('diffPercent = $diffPercent%');

    if (diffPercent <=10){
      return true;
    } else
      return false;
  }
  QuestionBrain(){
    _currentPercent = 0;
    _currentBaseNum =0;
  }
}