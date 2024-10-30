import 'homeScreen.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(MyApp());
}


class MyApp  extends StatelessWidget {

  const MyApp({ super.key });

   @override
   Widget build(BuildContext context) {
       return MaterialApp(
         title: 'Flutter App',
         home: HomeScreen(),
  
       );//material
  }
}