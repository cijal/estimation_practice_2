import 'dart:math';

class QuestionBrain {
  int _currentPercent;
  int _currentBaseNum;
  String _currentQuestion;
  int _currentAnswer , _currentUserAnswer;
  int _diffPercent;


  String getQuestion(){
    _currentPercent = new Random().nextInt(90)+10;
    _currentBaseNum = (new Random().nextInt(99))*10;
    _currentQuestion = '$_currentPercent% of $_currentBaseNum Million?';
    _currentAnswer  =  (_currentBaseNum*_currentPercent)~/100;
    print('question is $_currentQuestion');
    return _currentQuestion;
  }
  bool validateAnswer(int ans){
    print('Answer: $ans');
    _currentUserAnswer =ans;
    print ('Perfect answer = $_currentAnswer');
    int diff = ((ans-_currentAnswer).abs());
    print('difference is : $diff');

    _diffPercent = ((diff/_currentAnswer)*100).toInt();
    print ('diffPercent = $_diffPercent%');

    if (_diffPercent <=10){
      return true;
    } else
      return false;
  }
  String explainAnswer(){
    if(_currentUserAnswer != null)
      return '$_currentQuestion = $_currentAnswer |  $_currentUserAnswer off by $_diffPercent%.';
    else
      return '';
  }
  QuestionBrain(){
    _currentPercent = 0;
    _currentBaseNum =0;
  }
}