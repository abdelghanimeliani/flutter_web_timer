import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue.shade900,
              Colors.blueGrey.shade900,
            ],
          )),
          child: Center(
            child: Container(
              child: CountdownTimer(
                widgetBuilder: (ctx, timer) {
                  if (timer == null) {
                    return Text("the session will begin !!",
                        style: TextStyle(fontSize: 95, color: Colors.white70));
                  } else {
                    late String sec, min;
                    min = timer.min == null ? '0' : timer.min.toString();
                    sec = timer.sec.toString().length == 1
                        ? '0' + timer.sec.toString()
                        : timer.sec.toString();

                    return Text(min + ':' + sec,
                        style: TextStyle(fontSize: 200, color: Colors.white70));
                  }
                },
                endTime: endTime,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildItem(String title, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return page;
        }));
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        color: Colors.blue,
        width: double.infinity,
        alignment: Alignment.center,
        height: 100,
        child: Text(
          title,
          style: TextStyle(fontSize: 36),
        ),
      ),
    );
  }
}
