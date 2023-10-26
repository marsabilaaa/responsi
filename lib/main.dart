import 'package:flutter/material.dart';
import 'package:responsi/ui/assignments_page.dart';

 void main() {
 runApp(const MyApp());
 }
class MyApp extends StatelessWidget {
  const MyApp({Key? key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Kita',
      debugShowCheckedModeBanner: false,
      home: AssignmentsPage(),
    );
  }
}
