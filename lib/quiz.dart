import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Map<String, dynamic>> questions = [
    {
      "question":
          "Quel language de programmation est utlisé pour developper des applications flutter ?",
      "options": ["Kotlin", "Dart", "Swift"],
      "answer": "Dart"
    },
    {
      "question": "Qui a créé flutter ?",
      "options": ["Facebook", "Google", "Microsoft"],
      "answer": "Google"
    },
    {
      "question": "Comment appelle-t-on un element visuel dans flutter ?",
      "options": ["Widget", "Component", "layout"],
      "answer": "Widget"
    },
  ];

  int currentIndex = 0;
  int score = 0;

  void checkAnswer(String selectedOption) {
    if (selectedOption == questions[currentIndex]["answer"]) {
      score++;
      print(score);
    }
    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      showScoreDialog();
    }
  }

  void showScoreDialog() {
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: Text("Quiz terminé !"),
            content: Text("Votre score : $score"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    restartQuiz();
                  },
                  child: Text("Recommencer")),
            ],
          );
        }));
  }

  void restartQuiz() {
    setState(() {
      currentIndex = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://storage.googleapis.com/cms-storage-bucket/a9d6ce81aee44ae017ee.png",
              scale: 4,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Question ${currentIndex + 1}/3",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              questions[currentIndex]["question"],
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                checkAnswer(questions[currentIndex]["options"][0]);
              },
              child: Text(questions[currentIndex]["options"][0]),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                checkAnswer(questions[currentIndex]["options"][1]);
              },
              child: Text(questions[currentIndex]["options"][1]),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                checkAnswer(questions[currentIndex]["options"][2]);
              },
              child: Text(questions[currentIndex]["options"][2]),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
            )
          ],
        ),
      ),
    );
  }
}
