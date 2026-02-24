import 'dart:math';
import 'package:calculator/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


void main() {
  runApp(HomeScreen(toggleTheme: () {},));
}

class HomeScreen extends StatefulWidget {
  VoidCallback toggleTheme;
  HomeScreen({super.key, required this.toggleTheme});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('Calculator', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_medium),
            onPressed: widget.toggleTheme, // switch dark/light
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        userInput.toString(),
                        style: TextStyle(fontSize: 30, color: Theme.of(context).textTheme.bodyLarge?.color),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      answer.toString(),
                      style: TextStyle(fontSize: 30, color: Theme.of(context).textTheme.bodyLarge?.color),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 90,),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(
                          title: 'AC',
                          onPress: () {
                            userInput = '';
                            answer = '';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '+/-',
                          onPress: () {
                            setState(() {
                              if (userInput.startsWith('-')){
                                userInput = userInput.substring(1);
                              }else{
                                userInput = "-$userInput";
                              }
                            });
                          },
                        ),
                        MyButton(
                          title: '%',
                          onPress: () {
                            userInput += '%';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '/',
                          color: Theme.of(context).primaryColor,
                          onPress: () {
                            userInput += '/';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: 'x²',
                          color: Theme.of(context).primaryColor,
                          onPress: () {

                            setState(() {
                              double number = double.tryParse(userInput) ?? 0;
                              double squared = number * number;
                              userInput = squared.toString();

                              userInput = squared % 1 == 0 ? squared.toInt().toString() : squared.toString();
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '7',
                          onPress: () {
                            userInput += '7';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '8',
                          onPress: () {
                            userInput += '8';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '9',
                          onPress: () {
                            userInput += '9';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '*',
                            color: Theme.of(context).primaryColor,
                          onPress: () {
                            userInput += '*';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '√',
                          color: Theme.of(context).primaryColor,
                          onPress: () {

                            setState(() {
                              double number = double.tryParse(userInput) ?? 0;

                              if(number < 0){
                                userInput = 'Error';
                              }
                              else{
                                double root = sqrt(number);

                                userInput = root % 1 == 0 ? root.toInt().toString() : root.toString();
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '4',
                          onPress: () {
                            userInput += '4';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '5',
                          onPress: () {
                            userInput += '5';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '6',
                          onPress: () {
                            userInput += '6';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '-',
                          color: Theme.of(context).primaryColor,
                          onPress: () {
                            userInput += '-';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: 'x³',
                          color: Theme.of(context).primaryColor,
                          onPress: () {
                            setState(() {
                              double number = double.tryParse(userInput) ?? 0;
                              double cube  = number * number * number;

                              userInput  = cube.toString();

                              userInput = cube % 1 == 0 ? cube.toInt().toString() : cube.toString();
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '1',
                          onPress: () {
                            userInput += '1';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '2',
                          onPress: () {
                            userInput += '2';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '3',
                          onPress: () {
                            userInput += '3';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '+',
                          color: Theme.of(context).primaryColor,
                          onPress: () {
                            userInput += '+';
                            setState(() {});
                          },
                        ),MyButton(
                          title: '(',
                          color: Theme.of(context).primaryColor,
                          onPress: () {
                            userInput += '(';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '0',
                          onPress: () {
                            userInput += '0';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '.',
                          onPress: () {
                            userInput += '.';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: 'DEL',
                          onPress: () {
                            userInput = userInput.substring(0,userInput.length-1);
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '=',
                          color: Theme.of(context).primaryColor,
                          onPress: () {
                            equalPress ();
                            setState(() {

                            });
                          },
                        ),
                        MyButton(
                          title: ')',
                          color: Theme.of(context).primaryColor,
                          onPress: () {
                            userInput += ')';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalPress (){
    Parser p = Parser();
    Expression expression = p.parse(userInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
