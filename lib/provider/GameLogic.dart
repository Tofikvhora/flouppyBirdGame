
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlappyBirdLogic extends ChangeNotifier{
  bool gameHasStarted = false;
   double birdYAxis = 0;
   double time = 0;
   double height = 0;
   double initialHeight = 0;
  static double barrierXOne = 0;
   double barrierXTwo = barrierXOne + 1 ;
   var currentScore = 0;
   String bestTime = "00";

   void startGame(){
     gameHasStarted = true;
     initialHeight = birdYAxis;
     Timer.periodic(const Duration(milliseconds: 55), (timer) {
       time += 0.05;
       height = -3.5 * time * time + 2 * time;
       birdYAxis = initialHeight - height;
       if(barrierXOne < -1.1){
         barrierXOne += 2.7;
       }else{
         barrierXOne -= 0.04;
       }
       if(barrierXTwo < -1.1){
         barrierXTwo += 2.7;
       }else{
         barrierXTwo -= 0.04;
       }
       gameOver(timer);
       scoreUpdate();
       notifyListeners();
     });
     notifyListeners();
   }
   void gameOver(Timer timer){
     // this Condition is stop when bird down > 1
     if(birdYAxis >= height + 1){
       timer.cancel();
       gameHasStarted = true;
       bestTime = currentScore.toString();
       notifyListeners();
     }
     // this Condition is stop when bird up > 1
     if(birdYAxis <= height - 0.7){
       timer.cancel();
       gameHasStarted = true;
       bestTime = currentScore.toString();
       notifyListeners();
     }
     notifyListeners();
   }
   void jump(){
     time = 0;
     initialHeight = birdYAxis;
     notifyListeners();
   }
   void scoreUpdate(){
     if(gameHasStarted = true){
       currentScore++;
       print(currentScore);
     }else{
       currentScore == 00;
     }
     notifyListeners();
     return;
   }
    // void gameOverDialog(){
   //   // BuildContext context = NavigationService.navigatorKey.currentContext!;
   //    showDialog(
   //      context: NavigationService.navigatorKey.currentContext!,
   //      builder: (context) {
   //       return Container(
   //          color: Colors.black,
   //          width: 200,
   //          height: 350,
   //          child: AlertDialog(
   //            title: Text("G A M E  O V E R",style: TextStyle(
   //                fontSize: 20.sp,
   //                color: Colors.white
   //            ),),
   //            elevation: 8.w,
   //            backgroundColor: Colors.black,
   //            alignment: Alignment.center,
   //            // child: Column(
   //            //   children: [
   //            //     Text("G A M E  O V E R",style: TextStyle(
   //            //         fontSize: 20.sp,
   //            //         color: Colors.white
   //            //     ),),
   //            //     InkWell(
   //            //       splashColor: Colors.transparent,
   //            //       onTap: (){
   //            //         time = 0;
   //            //         startGame();
   //            //         jump();
   //            //       },
   //            //       child: Container(
   //            //         decoration: BoxDecoration(
   //            //           border: Border.all(color: Colors.black),
   //            //           borderRadius: BorderRadius.circular(20),
   //            //           color: Colors.white,
   //            //         ),
   //            //         child: Text("Re-Start Game",style: TextStyle(
   //            //           fontSize: 18.sp,
   //            //           color: Colors.black,
   //            //         ),),
   //            //       ),
   //            //     )
   //            //   ],
   //            // ),
   //          ),
   //        );
   //      },
   //
   //    );
   // }
}