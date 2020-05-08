import 'question.dart';

class QuestionBrain {
  List<Question> questions = [];

  String getQuestion(){
    questions.add(new Question());
    return questions.last.getQuestion();
  }
  bool validateAnswer(int ans){
    return questions.last.validateAnswer(ans);
  }
  String explainLastAnswer(){
    if(questions.length>1) {
      print(questions[questions.length - 2].explainAnswer());
      return questions[questions.length - 2].explainAnswer();
    }
    else
      return '';
  }
}