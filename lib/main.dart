import 'package:flutter/material.dart';
import 'displaypage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // scaffoldBackgroundColor: Colors.lime,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final nameTxtCnt =TextEditingController();
  final ageTxtCnt =TextEditingController();

  void navigateNextPage(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return DisplayPage(name:nameTxtCnt.text,age:ageTxtCnt.text);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              child: TextField(controller: nameTxtCnt,
                decoration: InputDecoration(labelText: 'Name'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: TextField(controller: ageTxtCnt,
                decoration: InputDecoration(labelText: 'Age'),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  navigateNextPage(context);
                },
                child: const Text(
                  'Next Page >>',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}