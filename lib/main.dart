import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_xxx/QuizApp/quizapp.dart';
import 'package:flutter_xxx/PlannerApp/expenseapp.dart';

//void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "MyApp",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: size.height * .50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.orangeAccent,
                      Colors.white60,
                    ]),
              ),
            ),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    alignment: Alignment.center,
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                        color: Colors.orangeAccent, shape: BoxShape.circle),
                    child: SvgPicture.asset(
                      "assets/icons/menu.svg",
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
                Text(
                  'Hello,\nHai Ngu ',
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .copyWith(fontWeight: FontWeight.w900),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    child: SvgPicture.asset("assets/icons/2.svg",
                        width: 150, height: 150),
                  ),
                ),
                Expanded(
                    child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    AppCard(
                      svgSrc: "assets/icons/quiz.svg",
                      linkApp: QuizApp(),
                      title: "Quiz App",
                    ),
                    AppCard(
                      svgSrc: "assets/icons/calendar.svg",
                      linkApp: PlannerApp(),
                      title: "Expense Planner",
                    ),
                    AppCard(
                      svgSrc: "assets/icons/quiz.svg",
                      linkApp: QuizApp(),
                      title: "",
                    ),
                    AppCard(
                      svgSrc: "assets/icons/quiz.svg",
                      linkApp: QuizApp(),
                      title: "",
                    ),
                  ],
                ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class AppCard extends StatelessWidget {
  final String svgSrc;
  final Widget linkApp;
  final String title;

  const AppCard({Key key, this.svgSrc, this.linkApp,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow:[
          BoxShadow(
            color: Colors.black12,
           // spreadRadius: 5,
            blurRadius: 1,
            //offset: Offset(0,3)
          )
        ],
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.white,
                Colors.white,
              ]),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          SvgPicture.asset(svgSrc, width: 100, height: 100),
          TextButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => linkApp)),
              child: Text(
               title,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ))
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 90);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
