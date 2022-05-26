import 'package:flutter/material.dart';
import 'package:quizapp1/question.dart';
import 'modal.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    ),
  );
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentindex = 0;
  List answer = [];
  int t = 0;
  bool animated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IndexedStack(
            alignment: Alignment.center,
            index: currentindex,
            children: questionbank.map((e) => displayquestion(e)).toList(),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: answer
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          e,
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    ));
  }

  Widget displayquestion(Questionbank q) {
    return (q.id <= 10)
        ? Column(
            children: [
              const SizedBox(height: 250),
              Text(
                "${q.question}",
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(height: 230),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (currentindex <= 9) {
                      currentindex++;
                      if (q.ans == true) {
                        answer.add("✅");
                        t++;
                      } else {
                        answer.add("❌");
                      }
                    }
                  });
                },
                child: const Text(
                  "True",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 150, vertical: 30),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (currentindex <= 9) {
                      currentindex++;
                      if (q.ans == false) {
                        answer.add("✅");
                        t++;
                      } else {
                        answer.add("❌");
                      }
                    }
                  });
                },
                child: const Text(
                  "False",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                  onPrimary: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 150, vertical: 30),
                ),
              ),
              const SizedBox(height: 10),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Quiz End",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              AnimatedDefaultTextStyle(
                child: Text("Your score is $t"),
                style: animated
                    ? TextStyle(
                        color: Colors.blue,
                        fontSize: 40,
                      )
                    : TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                duration: Duration(milliseconds: 10000),
                curve: Curves.elasticOut,
              ),
              SizedBox(height: 50),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      animated = !animated;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                      primary: Colors.white,
                      onPrimary: Colors.black),
                  child: Text(
                    "Show your result",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              SizedBox(height: 40),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      currentindex = 0;
                      answer.clear();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                      primary: Colors.white,
                      onPrimary: Colors.black),
                  child: Text(
                    "Restart",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ],
          );
  }
}
