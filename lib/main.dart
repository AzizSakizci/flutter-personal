import 'package:flutter/material.dart';
import './arayuz/anasayfa.dart';
import './arayuz/kullanici.dart';
import './arayuz/dinamikkullanici.dart';






void main(){
  runApp(
    MaterialApp(
      initialRoute: "/",
      routes: {
        "/":(context)=>Anasayfa(),
     "/kullanici":(context)=>Kullanici(),
     "/dinamikkullanici":(context)=>KullaniciAnasayfa(),
    
      },
    ),
  );
}