import 'package:flutter/material.dart';
import 'package:aurora/theme/anacard.dart';

class Anasayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.limeAccent[50],
      
      body: new Stack(
        
        children: <Widget>[
        
      
          _tasarim1(),
        
          _tasarim2(),
        ],
      ),
    );
  }

 
     
   

  Widget _tasarim1() {
    return new Padding(
      padding: EdgeInsets.only(top: 70.0),
      child:Container(
         alignment: Alignment.topCenter,
        /* decoration: BoxDecoration(
           image: DecorationImage(
             image: AssetImage("assets/image/1.jpg"),
           ),
         ),
           */    
              child: Text("AURORA" + "\n" + "BİLİŞİM ",textAlign: TextAlign.center,  style: TextStyle(fontSize: 40,color: Colors.blue,fontFamily:'CinzelDecorative-Bold' ),
            
        
          )

      )
    
     
    );
 
    
  }

  Widget _tasarim2() {
    return new Padding(
      padding: EdgeInsets.all(4.0),
      child: Container(
        
        child: Card(
          color: Colors.lime[50],
          margin: EdgeInsets.only(
              top: 200.0,left: 4.0, right: 4.0),
         
            child: new GridView.count(
              
              primary: false,
              padding: const EdgeInsets.all(5.0),
              crossAxisCount: 2,
              crossAxisSpacing: 3.0,
              children: <Widget>[
                AnaCard("/kullanici", "abdulaziz.jpg", "Abdulaziz Sakizci","0xFFF0F4F3"),
                AnaCard("/dinamikkullanici", "abdulaziz.jpg", "Abdulaziz Sakizci","0xFFF0F4F3"),
                AnaCard("/kullanici", "cevheri.bozoglan.jpg", "Cevheri Bozoglan","0xFFF0F4F3"),
                AnaCard("/kullanici", "emre.yavuz.jpg", "Emre Yavuz","0xFFF0F4F3"),
                AnaCard("/kullanici", "abdulaziz.jpg", "Abdulaziz Sakizci","0xFFF0F4F3"),
                AnaCard("/kullanici", "abdulaziz.jpg", "Abdulaziz Sakizci","0xFFF0F4F3"),
                AnaCard("/kullanici", "abdulaziz.jpg", "Abdulaziz Sakizci","0xFFF0F4F3"),
                AnaCard("/kullanici", "abdulaziz.jpg", "Abdulaziz Sakizci","0xFFF0F4F3"),
              ],
            ),
          ),
        
      ),
    );
  }
}
