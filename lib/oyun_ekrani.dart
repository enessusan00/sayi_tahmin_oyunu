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
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "            Oyun Ekranı",
            style: TextStyle(fontSize: 25),
          ),
        ),
        body: Center(
          child: Form(
            key: _form,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(durum),
              TextFormField(
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    durum = "Lütfen Geçerli bir sayı giriniz";
                    return durum;
                  }
                  return null;
                },
                maxLength: 3,
                controller: sayiController,
                decoration: const InputDecoration(
                    hintText: "0-100 arası bir sayi giriniz"),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                ],
              ),
              SizedBox(
                height: 60,
                width: 250,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 20,
                        primary: Colors.brown.shade300,
                        shadowColor: Colors.brown,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)))),
                    onPressed: () {
                      if (_form.currentState!.validate()) {
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
                      }
                    },
                    child: Text(
                      tahminEt,
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                    )),
              ),
            ]),
          ),
        ));
  }
}
