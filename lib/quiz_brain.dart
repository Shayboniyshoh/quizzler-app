import 'package:quizzler/question.dart';

class QuizBrain {
  int _quesNum = 0;
  // bool quizEnd = false;
  final List<Question> _questionsList = [
    Question(
      quesText: 'Some cats are actually allergic to humans.',
      quesAns: true,
    ),
    Question(
      quesText: 'You can lead a cow down stairs but not up stairs.',
      quesAns: false,
    ),
    Question(
      quesText: 'Approximately one quarter of human bones are in the feet.',
      quesAns: true,
    ),
    Question(
      quesText: 'A slug\'s blood is green.',
      quesAns: true,
    ),
    Question(
      quesText: 'Buzz Aldrin\'s mother\'s maiden name was "Moon".',
      quesAns: true,
    ),
    Question(
      quesText: 'It is illegal to pee in the Ocean in Portugal.',
      quesAns: true,
    ),
    Question(
      quesText:
          'No piece of square dry paper can be folded in half more than 7 times.',
      quesAns: false,
    ),
    Question(
      quesText:
          'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
      quesAns: true,
    ),
    Question(
      quesText:
          'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
      quesAns: false,
    ),
    Question(
      quesText:
          'The total surface area of two human lungs is approximately 70 square metres.',
      quesAns: true,
    ),
    Question(
      quesText: 'Google was originally called "bankrupt".',
      quesAns: true,
    ),
    Question(
      quesText:
          'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
      quesAns: true,
    ),
    Question(
      quesText:
          'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
      quesAns: true,
    ),
  ];
  void getNextQues() {
    if (_quesNum < _questionsList.length - 1) {
      _quesNum++;
    }
  }

  bool isFinished() {
    if (_quesNum >= _questionsList.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _quesNum = 0;
    // quizEnd = false;
  }

  String getQuesText() {
    return _questionsList[_quesNum].quesText;
  }

  bool getQuesAns() {
    return _questionsList[_quesNum].quesAns;
  }
}
