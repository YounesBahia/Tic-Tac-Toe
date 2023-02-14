import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tictactoe/code/Color.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List _gird = ['', '', '', '', '', '', '', '', ''];
  late List<Color> _colorwins = [Colorbox, Colorbox, Colorbox, Colorbox, Colorbox, Colorbox, Colorbox, Colorbox, Colorbox];

  late String _turn = '';
  int playerwins1 = 0;
  int playerwins2 = 0;
  bool click = false;
  int _second = 30;

  late Timer _timer;

  _startTimer() {
    _second = 30;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_second > 0) {
        setState(() {
          _second--;
        });
        print(_second);
        if (_second == 0 || click == false) {
          setState(() {
            click = false;
            _timer.cancel();
          });
        }
      }
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primarycolor,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      child: Text(
                        'Player X ',
                        style: TextStyle(
                          fontFamily: "IrishGrover",
                          fontSize: 35,
                          color: ColorText,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        '$playerwins1',
                        style: TextStyle(
                          fontFamily: "IrishGrover",
                          fontSize: 35,
                          color: ColorText,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      child: Text(
                        'Player O ',
                        style: TextStyle(
                          fontFamily: "IrishGrover",
                          fontSize: 35,
                          color: ColorText,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        '$playerwins2',
                        style: TextStyle(
                          fontFamily: "IrishGrover",
                          fontSize: 35,
                          color: ColorText,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // this Contaner in the game

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      box(0,Colorbox),
                      box(1,Colorbox),
                      box(2,Colorbox),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      box(3,Colorbox),
                      box(4,Colorbox),
                      box(5,Colorbox),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      box(6,Colorbox),
                      box(7,Colorbox),
                      box(8,Colorbox),
                    ],
                  ),
                  ClickStart(),
                  //Timegame(),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  

  Widget ClickStart() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _gird = ['', '', '', '', '', '', '', '', ''];
          _colorwins = [Colorbox, Colorbox, Colorbox, Colorbox, Colorbox, Colorbox, Colorbox, Colorbox, Colorbox];
          click =true;
          _startTimer();
        });
      },
      child: Container(
        margin: EdgeInsets.only(top: 40),
        child:click ?Timegame()  : Text(
          'Start',
          style: TextStyle(
            fontSize: 35,
            fontFamily: 'IrishGrover',
            color: Colors.white,
          ),
        )
      ),
    );
  }
  Widget box(int NumberBox,Color Colorbox) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // condtion in text the box
          check(NumberBox);
        });
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: _colorwins[NumberBox],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            _gird[NumberBox],
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: "IrishGrover",
            ),
          ),
        ),
      ),
    );
  }
  check(int NumberBox){
    if(click == true){
            if (_turn == "") {
            _turn = 'X';
            _gird[NumberBox] = _turn;
            } else {
            if(_gird[NumberBox] == ''){
              if (_turn == "X") {
              _turn = 'O';
              _gird[NumberBox] = _turn;
            } else {
              _turn = 'X';
              _gird[NumberBox] = _turn;
            }
            }
          }

          //condtion in the wins

          if ((_gird[0] == "X" && _gird[1] == "X" && _gird[2] == "X") ||
              (_gird[0] == "O" && _gird[1] == "O" && _gird[2] == "O")) {
              // color in Th box Wins
              _colorwins[0]=colorWins;
              _colorwins[1]=colorWins;
              _colorwins[2]=colorWins;
            if (_gird[0] == "X" && _gird[1] == "X" && _gird[2] == "X") {
              

              playerwins1++;
              
              click =false;
            } else {
              playerwins2++;
              click =false;
            }
          } else if ((_gird[3] == "X" && _gird[4] == "X" && _gird[5] == "X") ||
              (_gird[3] == "O" && _gird[4] == "O" && _gird[5] == "O")) {
                // color in Th box Wins
              _colorwins[3]=colorWins;
              _colorwins[4]=colorWins;
              _colorwins[5]=colorWins;
            if (_gird[3] == "X" && _gird[4] == "X" && _gird[5] == "X") {
              playerwins1++;
              click =false;
            } else {
              playerwins2++;
              click =false;
            }
          } else if ((_gird[6] == "X" && _gird[7] == "X" && _gird[8] == "X") ||
              (_gird[6] == "O" && _gird[7] == "O" && _gird[8] == "O")) {
                // color in Th box Wins
              _colorwins[6]=colorWins;
              _colorwins[7]=colorWins;
              _colorwins[8]=colorWins;
            if (_gird[6] == "X" && _gird[7] == "X" && _gird[8] == "X") {
              playerwins1++;
              click =false;

            } else {
              playerwins2++;
              click =false;
            }
          } else if ((_gird[0] == "X" && _gird[3] == "X" && _gird[6] == "X") ||
              (_gird[0] == "O" && _gird[3] == "O" && _gird[6] == "O")) {
                // color in Th box Wins
              _colorwins[0]=colorWins;
              _colorwins[3]=colorWins;
              _colorwins[6]=colorWins;
            if (_gird[0] == "X" && _gird[3] == "X" && _gird[6] == "X") {
              playerwins1++;
              click =false;
            } else {
              playerwins2++;
              click =false;
            }
          } else if ((_gird[1] == "X" && _gird[4] == "X" && _gird[7] == "X") ||
              (_gird[1] == "O" && _gird[4] == "O" && _gird[7] == "O")) {
                // color in Th box Wins
              _colorwins[1]=colorWins;
              _colorwins[4]=colorWins;
              _colorwins[7]=colorWins;
            if (_gird[1] == "X" && _gird[4] == "X" && _gird[7] == "X") {
              playerwins1++;
              click =false;
            } else {
              playerwins2++;
              click =false;
            }
          } else if ((_gird[2] == "X" && _gird[5] == "X" && _gird[8] == "X") ||
              (_gird[2] == "O" && _gird[5] == "O" && _gird[8] == "O")) {
                // color in Th box Wins
              _colorwins[2]=colorWins;
              _colorwins[5]=colorWins;
              _colorwins[8]=colorWins;
            if (_gird[2] == "X" && _gird[5] == "X" && _gird[8] == "X") {
              playerwins1++;
              click =false;
            } else {
              playerwins2++;
              click =false;
            }
          } else if ((_gird[0] == "X" && _gird[4] == "X" && _gird[8] == "X") ||
              (_gird[0] == "O" && _gird[4] == "O" && _gird[8] == "O")) {
                // color in Th box Wins
              _colorwins[0]=colorWins;
              _colorwins[4]=colorWins;
              _colorwins[8]=colorWins;
            if (_gird[0] == "X" && _gird[4] == "X" && _gird[8] == "X") {
              playerwins1++;
              click =false;
            } else {
              playerwins2++;
              click =false;
            }
          
          }else if ((_gird[2] == "X" && _gird[4] == "X" && _gird[6] == "X") ||
              (_gird[2] == "O" && _gird[4] == "O" && _gird[6] == "O")) {
                // color in Th box Wins
              _colorwins[2]=colorWins;
              _colorwins[4]=colorWins;
              _colorwins[6]=colorWins;
            if (_gird[2] == "X" && _gird[4] == "X" && _gird[6] == "X") {
              playerwins1++;
              click =false;
            } else {
              playerwins2++;
              click =false;
            }
          
          }
          else{
            if(_gird[0] !="" && _gird[1] !="" &&_gird[2] !="" && _gird[3] !="" && _gird[4] !="" && _gird[5] !="" &&_gird[6] !="" && _gird[7] !="" && _gird[8] !=""){
              click = false;
            }
          }
        }
  }
  Widget Timegame(){
    return Container(
      child:CircularPercentIndicator(
                  radius: 35.0,
                  lineWidth:10.0,
                  percent: (_second*30)/1000,
                  progressColor: Colors.red,
                  center: new Text("$_second sec",style: TextStyle(color: Colors.white),),
                  backgroundColor: Colorbox,
                )
              );
  }
}
