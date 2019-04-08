/*
import 'package:flutter/material.dart';
import 'arayuz/resimKirp.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double _imageHeight = 370.0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          _renk(),
          _buildIamge(),
          _anasayfaIcon(),
          _profil(),
          _baslik(),
          _liste()
        ],
      ),
    );
  }

  Widget _renk() {
    return new Container(color: Colors.teal[50]);
  }

  Widget _liste() {
    return new Padding(
      padding: EdgeInsets.only(
        top: _imageHeight + 70.0,
      ),
      child: Container(
        child: ListView(
          children: <Widget>[
           
            ListTile(
              leading: Icon(Icons.computer,size: 50,color: Colors.blue[400],),
              title: Text("Hisar Hospital Hbys",style: TextStyle(fontFamily: 'LobsterTwo',fontSize: 25),),
              contentPadding: EdgeInsets.only(left: 10.0,top: 20)
              
            
            ),
            ListTile(
              leading: Icon(Icons.mail_outline,size:50,color:Colors.orange[400]),
               title: Text("abdulaziz.sakizci@aurorabilisim.com",style: TextStyle(fontFamily: 'LobsterTwo',fontSize: 22),),
               contentPadding: EdgeInsets.only(left: 10.0,top: 20)
            ),
            ListTile(
              leading: Icon(Icons.phone,size: 50,color:Colors.green[300],),
               title: Text("05078740993",style: TextStyle(fontFamily: 'LobsterTwo',fontSize: 26),),
               contentPadding: EdgeInsets.only(left: 10.0,top: 20)
            ),
            
          ],
        ),
      ),
    );
  }

  Widget _buildIamge() {
    return new ClipPath(
      clipper: new DialogonalClipper(),
      child: new Image.asset(
        "assets/image/auroraa.jpg",
        fit: BoxFit.fitHeight,
        height: _imageHeight,
        colorBlendMode: BlendMode.srcOver,
        color: new Color.fromARGB(120, 20, 10, 40),
      ),
    );
  }

  Widget _anasayfaIcon() {
    return new SafeArea(
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 32.0),
        child: new Row(
          children: <Widget>[
            new Expanded(
              child: new Padding(
                padding: const EdgeInsets.only(left: 8.0),
              ),
            ),
            new Icon(Icons.linear_scale, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _profil() {
    return Padding(
      padding: EdgeInsets.only(left: 6.0, top: _imageHeight / 2.5),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            minRadius: 70,
            maxRadius: 70,
            backgroundImage: AssetImage("assets/image/Abdulaziz.Sakızcı.jpg"),
          ),
          new Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Text(
                  "Abdulaziz Sakızcı",
                  style: TextStyle(fontSize: 34, color: Colors.white,fontFamily: 'LobsterTwo'),
                ),
                new Text("Yazılım Test ve Kalite",
                    style: TextStyle(fontSize: 20, color: Colors.white,fontFamily: 'LobsterTwo')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _baslik() {
    return new Align(
      alignment: Alignment.center,
      child: new Container(
        child: Padding(
          padding: EdgeInsets.only(top: _imageHeight + 25.0, left: 10.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Card(
                color: Colors.teal,
                
                child:Padding(
                  padding: EdgeInsets.all(3.0),
                
                child: Container(
                  
                  
                  
                  
                  child:Text(
                "    Dashboard    ",
                style: TextStyle(fontSize: 41, fontFamily: 'LobsterTwo',backgroundColor: Colors.white),
              
              ),
                ),
                ),
              )
              
            ],
          ),
        ),
      ),
    );
  }
}
*/