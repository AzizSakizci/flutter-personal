import 'package:flutter/material.dart';

class AnaCard extends StatelessWidget{
  final String rota;
  final String resim;
  final String baslik;
  final String renk;

  AnaCard(this.rota,this.resim, this.baslik , this.renk);


  @override
  Widget build(BuildContext context) {
   
    return new GestureDetector(
      onTap:() {
         Navigator.pushNamed(context, rota);
      },
  
      child:Card(
        color:Color(int.parse(renk)),
        child:Container(
          
          decoration: BoxDecoration(
            
            image: DecorationImage(
            
            
              image: AssetImage('assets/image/'+resim),
              fit: BoxFit.cover,
            ),
          ),
          margin: EdgeInsets.all(5.0),
          alignment: Alignment.bottomCenter,
          child: Transform(
            alignment: Alignment.bottomCenter,
             transform: Matrix4.skewY(0.0)..rotateZ(0.0),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(8.0),
              color: Color(0x99FFFFFF),
              child: new Text(
                baslik,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight:FontWeight.bold),
              ),
            ),
          ),
        ) ,
      ),
    );
  }

  





}