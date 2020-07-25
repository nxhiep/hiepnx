import 'package:flutter/material.dart';

class TestModel extends ChangeNotifier {

  List<String> questions = [];
  bool loaded = false;
  int currentIndex = 0;
  String currentQuestion;
  String prevQuestion;
  bool finish = false;

  TestModel();

  void init() {
    print("init");
    questions = [];
    loaded = false;
    for(int i = 0; i < 50; i++){
      questions.add("Item ${i + 1}");
    }
    loaded = true;
    finish = false;
    currentIndex = 0;
    onContinue(true);
  }

  void onContinue([ bool start ]) async {
    print("onContinue");
    if(start == true){
      currentIndex = 0;
    } else {
      currentIndex++;
    }
    if(currentIndex >= questions.length){
      finish = true;
      notifyListeners();
      return;
    }
    currentQuestion = questions[currentIndex];
    notifyListeners();
  }

  void onChoiceSelected() {
    print("onChoiceSelected");
    notifyListeners();
  }

  void setPrevQuestion(String currentQuestion) {
    prevQuestion = currentQuestion;
  }
} 