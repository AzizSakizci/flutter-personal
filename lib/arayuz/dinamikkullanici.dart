import 'package:flutter/material.dart';
import 'package:aurora/arayuz/resimKirp.dart';
import 'package:aurora/veritabani/model.dart';
import 'package:aurora/veritabani/yardımci.dart';

class KullaniciAnasayfa extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>KullaniciState();
    
    
  
  }
  
  class KullaniciState extends State<KullaniciAnasayfa> {

  double _imageHeight = 370.0;
  Vtyardimcisi vtYardimcisi = new Vtyardimcisi();
  List<Kullanici> kullanicilar = new List();
  final genelCtrl = GlobalKey<FormState>();
  bool duzenleMi = false;

  final isimCtrl = TextEditingController();
  final soyisimCtrl = TextEditingController();
  final sinifCtrl = TextEditingController();

  _kullaniciEkle() {
    vtYardimcisi
        .kullaniciKaydet(
            new Kullanici(isimCtrl.text, soyisimCtrl.text, sinifCtrl.text))
        .then((deger) {
      debugPrint(deger.toString());
      if (deger > 0) {
        listeYenile();
        isimCtrl.clear();
        soyisimCtrl.clear();
        sinifCtrl.clear();
        Navigator.pop(context);
      }
    });
  }

  _kullaniciSil(Kullanici kullanici) {
    vtYardimcisi.kullaniciSil(kullanici).then((cvp) {
      if (cvp > 0) {
        listeYenile();
      }
    });
  }

  _kullaniciGuncelle(int kno) {
    var ogr = new Kullanici(isimCtrl.text, soyisimCtrl.text, sinifCtrl.text);
    ogr.no = kno;
    vtYardimcisi.kullaniciGuncelle(ogr).then((cvp) {
      if (cvp) {
        debugPrint(cvp.toString());
        listeYenile();
        Navigator.pop(context);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    listeYenile();
  }

  listeYenile() {
    vtYardimcisi.kullaniciGetir().then((gelen) {
      setState(() {
        kullanicilar = gelen;
      });

      debugPrint(gelen.toString());
    });
  }

  void eklemeEkraniAc({Kullanici kullanici}) {
    if (kullanici != null) {
      duzenleMi = true;
      isimCtrl.text = kullanici.isim;
      soyisimCtrl.text = kullanici.departman;
      sinifCtrl.text = kullanici.gorev;
    } else {
      duzenleMi = false;
    }
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(duzenleMi ? "Öğrenci Düzenle" : "Ogrenci Ekle"),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Form(
                    key: genelCtrl,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          validator: (val){
                            if(val.length>0){
                              return "lutfen buraya bos gecmeyin";
                            }
                            },
                          controller: isimCtrl,
                          decoration: InputDecoration(
                              hintText: "İsmini Giriniz"),
                        ),
                        TextFormField(
                           validator: (val){
                            if(val.length>0){
                              return "lutfen buraya bos gecmeyin";
                            }
                            },
                          controller: soyisimCtrl,
                          decoration: InputDecoration(
                              hintText: "Çalışmış olduğunuz Departmanı Giriniz"),
                        ),
                        TextFormField(
                           validator: (val){
                            if(val.length>0){
                              return "lutfen buraya bos gecmeyin";
                            }
                            }, 
                          controller: sinifCtrl,
                          decoration:
                              InputDecoration(hintText: " Görevinizi giriniz"),
                        ),

                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () =>
                    duzenleMi ? _kullaniciGuncelle(kullanici.no) : _kullaniciEkle,
                child: Text(duzenleMi ? "Düzenle" : "Ekle"),
              ),
              FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text("iptal"),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: ListView.builder(
            itemCount: kullanicilar.length,
            itemBuilder: (BuildContext baglam, int sira) {
            return Card(
             child: Column(
                children: <Widget>[
                  ListTile(
                      leading: Icon(
                        Icons.computer,
                        size: 50,
                        color: Colors.blue[400],
                      ),
                      title: Text(
                        " ${kullanicilar[sira].isim}  ${kullanicilar[sira].departman}  ${kullanicilar[sira].gorev} ",
                        style:
                            TextStyle(fontFamily: 'LobsterTwo', fontSize: 25),
                      ),
                      contentPadding: EdgeInsets.only(left: 10.0, top: 20)),
                  ListTile(
                      leading: Icon(Icons.mail_outline,
                          size: 50, color: Colors.orange[400]),
                      title: Text(
                        "111",
                        style:
                            TextStyle(fontFamily: 'LobsterTwo', fontSize: 22),
                      ),
                      contentPadding: EdgeInsets.only(left: 10.0, top: 20)),
                  ListTile(
                      leading: Icon(
                        Icons.phone,
                        size: 50,
                        color: Colors.green[300],
                      ),
                      title: Text(
                        "05078740993",
                        style:
                            TextStyle(fontFamily: 'LobsterTwo', fontSize: 26),
                      ),
                      contentPadding: EdgeInsets.only(left: 10.0, top: 20)
                      ), 
                  Row(
                    children: <Widget>[
                      FlatButton(
                        onPressed: () =>
                            eklemeEkraniAc(kullanici: kullanicilar[sira]),
                        child: Text("guncelle"),
                      ),
                      FlatButton(
                        onPressed: () => _kullaniciSil(kullanicilar[sira]),
                        child: Text("sil",
                            style: TextStyle(
                              fontFamily: "LobsterTwo",
                            )),
                      ),
                      
                    ],
                  ),
                ],
              )
            );
            }),

      ),
    );
  }

  Widget _buildIamge() {
    return new ClipPath(
      clipper: new DialogonalClipper(),
      child: new Image.asset(
        "assets/image/auroraa2.jpg",
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
        child:new Row(
          
          children: <Widget>[
            
            new Expanded(
              child: new Padding(
                padding: const EdgeInsets.only(left: 8.0),
              ),
            ),
            IconButton(
              icon: Icon(Icons.library_add,color: Colors.white,),                   //(Icons.linear_scale, color: Colors.white),
              onPressed: () => eklemeEkraniAc(),
            )
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
                  style: TextStyle(
                      fontSize: 34,
                      color: Colors.white,
                      fontFamily: 'LobsterTwo'),
                ),
                new Text("Yazılım Test ve Kalite",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'LobsterTwo')),
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
                child: Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Container(
                    child: Text(
                      "    Dashboard    ",
                      style: TextStyle(
                          fontSize: 41,
                          fontFamily: 'LobsterTwo',
                          backgroundColor: Colors.white),
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
