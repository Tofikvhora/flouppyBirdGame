
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MyBird extends HookWidget {
  const MyBird({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 80,height: 80,
        child: Image.asset("assest/flupperbird game bird.png",fit: BoxFit.cover,));
  }
}


