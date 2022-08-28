import 'package:flutter/material.dart';
import 'oyun_ekrani.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "                      Anasayfa",
            style: TextStyle(fontSize: 25),
          ),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Tahmin Oyunu",
              style: TextStyle(
                fontSize: 45,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 30),
            Container(height: 270, child: Image.asset("lib/assets/resim.png")),
            SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 20,
                      primary: Colors.brown.shade300,
                      shadowColor: Colors.brown,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(100)))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OyunEkrani()));
                  },
                  child: Text(
                    "Oyuna Başla",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  )),
            ),
          ]),
        ));
  }
}
