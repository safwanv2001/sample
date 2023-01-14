import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
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
  TimeOfDay? a;
  String? b, e, d;

  @override
  initState() {
    super.initState();
    clk();
  }

  clk() {
    a = TimeOfDay.fromDateTime(DateTime.now());
    d = '${a?.hour}:${a?.minute}';
    b = d!.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(400),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black38,
                    blurStyle: BlurStyle.normal,
                    blurRadius: 15,
                    spreadRadius: 2),
              ]),
          child: Center(
            child: StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  return Text(DateFormat('hh:mm:ss').format(DateTime.now()),
                      style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w100,
                        color: Colors.black,
                      ));
                }),
          ),
        ),
      ),
    );
  }
}
