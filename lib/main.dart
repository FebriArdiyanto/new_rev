import 'package:flutter/material.dart';
import 'package:Revisi/screens/homepage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BRI.STORE',
      home: HomePage(),
    );
  } //menampilkan memanggil clas home page
}
