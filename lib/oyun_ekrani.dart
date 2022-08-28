import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sayi_tahmin_oyunu/main.dart';

class OyunEkrani extends StatefulWidget {
  @override
  State<OyunEkrani> createState() => _OyunEkraniState();
}

class _OyunEkraniState extends State<OyunEkrani> {
  var sayiController = TextEditingController();
  var randSayi = Random().nextInt(100);
  var tahminEt = "Tahmin Et";
  var durum = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "            Oyun Ekranı",
            style: TextStyle(fontSize: 25),
          ),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(durum),
            TextField(
              maxLength: 3,
              controller: sayiController,
              decoration:
                  InputDecoration(hintText: "0-100 arası bir sayi giriniz"),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              ],
            ),
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
                    setState(() {
                      int girilenSayi = int.parse(sayiController.text);

                      if (girilenSayi == randSayi) {
                        durum = "doğru tahmin";
                        tahminEt = "Tekrar Oyna";
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()));
                      } else if (girilenSayi < randSayi) {
                        durum = "Yukarı";
                      } else {
                        durum = "Aşağı";
                      }
                    });
                  },
                  child: Text(
                    tahminEt,
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  )),
            ),
          ]),
        ));
  }
}
