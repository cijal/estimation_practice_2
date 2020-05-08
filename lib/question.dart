import 'dart:math';

class Question {
  int _qPercent,_qBaseNum, _diffPercent,_correctAnswer , _userAnswer;
  String _questionInWords, _resultExplanation;
  bool _userPassed;

   Question(){
    _qPercent = new Random().nextInt(80)+10;
    _qBaseNum = (new Random().nextInt(99)+1)*10;
    _questionInWords = '$_qPercent% of $_qBaseNum Million?';
    _correctAnswer  =  (_qBaseNum*_qPercent)~/100;
    print('question is $_questionInWords');

  }
  String getQuestion(){
    return _questionInWords;
  }
  bool validateAnswer(int ans){
    _userAnswer =ans;
    int diff = ((ans-_correctAnswer).abs());
    _diffPercent = ((diff/_correctAnswer)*100).toInt();
    if (_diffPercent <=10){
      _userPassed = true;
    } else
      _userPassed = false;
    _resultExplanation = '$_questionInWords = $_correctAnswer |  Ans: $_userAnswer was off by $_diffPercent%.';
    return _userPassed;
  }
  String explainAnswer(){
    if(_resultExplanation != null)
      return _resultExplanation;
    else
      return '';
  }

}