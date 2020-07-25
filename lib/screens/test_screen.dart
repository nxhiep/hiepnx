import 'package:flutter/material.dart';
import 'package:hiepnx/components/bounce_button.dart';
import 'package:hiepnx/provider/test_model.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  List<String> items = [];
  TestModel _testModel;

  @override
  void initState() {
    super.initState();
    _testModel = Provider.of<TestModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _testModel.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Consumer<TestModel>(
          builder: (context, TestModel testModel, child) {
            if(!testModel.loaded || testModel.currentQuestion == null || testModel.currentQuestion.isEmpty){
              return Center(child: CircularProgressIndicator());
            }
            if(testModel.finish){
              return Center(child: Text("Finish!"));
            }
            String prevQuestion = testModel.prevQuestion;
            String currentQuestion = testModel.currentQuestion;
            testModel.setPrevQuestion(currentQuestion);
            print("prevQuestion $prevQuestion");
            print("currentQuestion $currentQuestion");
            return Column(
              children: <Widget>[
                Expanded(
                  child: QuestionPanel(
                    index: testModel.currentIndex,
                    currentQuestion: currentQuestion,
                    onSelected: testModel.onChoiceSelected,
                    prevQuestion: prevQuestion
                  ),
                ),
                RaisedButton(
                  child: Text("Continue"),
                  onPressed: testModel.onContinue,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class QuestionPanel extends StatefulWidget {

  final int index;
  final String currentQuestion;
  final Function onSelected;
  final String prevQuestion;
  QuestionPanel({ this.index = 0, this.currentQuestion = "", this.onSelected, this.prevQuestion = "" });

  @override
  _QuestionPanelState createState() => _QuestionPanelState();
}

class _QuestionPanelState extends State<QuestionPanel> with TickerProviderStateMixin {

  AnimationController _controller;
  Animation<Offset> _animation;
  Animation<Offset> _animation2;

  @override
  void initState() {
    super.initState();
    print("QuestionPanel initState");
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero).animate(_controller);
    _animation2 = Tween<Offset>(begin: Offset.zero, end: Offset(-1.0, 0.0)).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void startAnimation() {
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    print("QuestionPanel build");
    if(widget.prevQuestion != widget.currentQuestion) {
      startAnimation();
    }
    return Stack(
      children: <Widget>[
        widget.prevQuestion != null ? SlideTransition(
          position: _animation2,
          child: Card(
            margin: EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListTile(
                    leading: Text((widget.index).toString()),
                    title: Text(widget.prevQuestion),
                  ),
                ),
                RaisedButton(
                  child: Text("Selected"),
                  onPressed: widget.onSelected,
                ),
              ],
            ),
          ),
        ) : Container(),
        SlideTransition(
          position: _animation,
          child: Card(
            margin: EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListTile(
                    leading: Text((widget.index + 1).toString()),
                    title: Text(widget.currentQuestion),
                  ),
                ),
                BounceButton(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    padding: EdgeInsets.all(20),
                    child: Text("Selected")
                  ),
                  onTap: widget.onSelected,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}