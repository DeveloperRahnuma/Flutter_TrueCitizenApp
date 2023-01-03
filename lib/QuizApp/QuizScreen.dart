import 'package:flutter/material.dart';
import 'package:quiz_app/QuizApp/QuestionBank.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  int current_index = 0;
  List question_Bank_list = [
    QuestionBank.name(
        "The U.S. Declaration of Independence was adopted in 1776.", true),
    QuestionBank.name("The Supreme law of the land is the Constitution.", true),
    QuestionBank.name(
        "The two rights in the Declaration of Independence are:"
            "  \n Life  "
            "  \n Pursuit of happiness.",
        true),
    QuestionBank.name("The (U.S.) Constitution has 26 Amendments.", false),
    QuestionBank.name(
        "Freedom of religion means:\nYou can practice any religion, "
            "or not practice a religion.",
        true),
    QuestionBank.name("Journalist is one branch or part of the government.", false),
    QuestionBank.name("The Congress does not make federal laws.", false),
    QuestionBank.name("There are 100 U.S. Senators.", true),
    QuestionBank.name("We elect a U.S. Senator for 4 years.", false), //6
    QuestionBank.name("We elect a U.S. Representative for 2 years", true),
    QuestionBank.name(
        "A U.S. Senator represents all people of the United States", false),
    QuestionBank.name("We vote for President in January.", false),
    QuestionBank.name("Who vetoes bills is the President.", true),
    QuestionBank.name("The Constitution was written in 1787.", true),
    QuestionBank.name('George Bush is the \ " Father of Our Country " \.', false)
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(title: const Text("Quiz App"), centerTitle: true, backgroundColor: Colors.blueGrey.shade800,),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Container(
                width: size.width * 0.8,
                height: size.height * 0.2,
                alignment: Alignment.center,
                child: Center(
                  child: Image.asset("assest/images/flag.png"),
                ),
              ),

            Container(
              width: size.width * 0.8,
              height: size.height * 0.2,
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.white, width: 1)
              ),
              child: Text(question_Bank_list[current_index % question_Bank_list.length].question.toString())
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        current_index--;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey.shade800,
                    ),
                    child: const Text("Prev", style: TextStyle(color: Colors.white),),
                  ),


                  ElevatedButton(
                    onPressed: () => _checkAnswer(true, context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey.shade800,
                    ),
                    child: const Text("True", style: TextStyle(color: Colors.white),),
                  ),


                  ElevatedButton(
                    onPressed: () => _checkAnswer(false, context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey.shade800,
                    ),
                    child: const Text("False", style: TextStyle(color: Colors.white),),
                  ),


                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        current_index++;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey.shade800,
                    ),
                    child: Text("Next", style: TextStyle(color: Colors.white),),
                  )

          ],
        ),
            ),
    ]
      ),
    )
    );
  }


  _checkAnswer(bool userselected, BuildContext context){
    if(userselected == question_Bank_list[current_index % question_Bank_list.length].isTrue){
      var snackBar = SnackBar(content: Text('True'), backgroundColor: Colors.green,);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }else{
      var snackBar2 = SnackBar(content: Text('false'), backgroundColor: Colors.red,);
      ScaffoldMessenger.of(context).showSnackBar(snackBar2);
      // ScaffoldMessenger.of(context).showSnackBar(showSnackBar("false",Colors.red));
    }
  }

  showSnackBar(String message, Color color){
    SnackBar(content: Text(message), backgroundColor: color,);
  }

}
