
import 'package:fluppebirdgame/provider/GameLogic.dart';
import 'package:fluppebirdgame/view/screens/barrier.dart';
import 'package:fluppebirdgame/view/screens/bird.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final notifier = Provider.of<FlappyBirdLogic>(context,listen: true);
    useEffect(() {
      notifier.bestTime;
      return (){
        notifier.bestTime;
      };
    },[]);
    return GestureDetector(
      onTap:(){
        if(notifier.gameHasStarted){
          notifier.jump();
        }else{
          notifier.startGame();
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 0),
                    alignment: Alignment(0,notifier.birdYAxis),
                    color: Colors.blue[300],
                    child: MyBird(),
                  ),
                  Container(
                    alignment: Alignment(0,-0.3),
                    child: notifier.gameHasStarted ? const Text(""): Text(" T A P  T O  P L A Y ",style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.white
                    ),),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(FlappyBirdLogic.barrierXOne,1.1),
                    duration: const Duration(milliseconds: 0),
                    child: MyBarrier(
                      size: 200.h,
                    ),
                  ),
                  AnimatedContainer(
                    alignment:  Alignment(FlappyBirdLogic.barrierXOne,-1.1),
                    duration: const Duration(milliseconds: 0),
                    child: MyBarrier(
                      size: 150.h,
                    ),
                  ),
                  AnimatedContainer(
                    alignment:  Alignment(notifier.barrierXTwo,1.1),
                    duration: const Duration(milliseconds: 0),
                    child: MyBarrier(
                      size: 150.h,
                    ),
                  ),
                  AnimatedContainer(
                    alignment:  Alignment(notifier.barrierXTwo,-1.1),
                    duration: const Duration(milliseconds: 0),
                    child: MyBarrier(
                      size: 200.h,
                    ),
                  ),
                ],
              )
            ),
            Container(
              height: 15.h,
              color: Colors.green[600],
            ),
            Expanded(
              child: Container(
                color: Colors.brown[800],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("SCORE",style: TextStyle(
                          fontSize: 25.sp,
                          color: Colors.white,
                        ),
                        ),
                        Text(notifier.currentScore.toString(),style: TextStyle(
                          fontSize: 25.sp,
                          color: Colors.white,
                        ),),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("BEST",style: TextStyle(
                          fontSize: 25.sp,
                          color: Colors.white,
                        ),
                        ),
                        Text(notifier.bestTime.toString(),style: TextStyle(
                          fontSize: 25.sp,
                          color: Colors.white,
                        ),),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
