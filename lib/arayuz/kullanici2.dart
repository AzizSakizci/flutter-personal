/*import 'package:fazilet_test/veritabani/ogrenci.dart';
import 'package:fazilet_test/veritabani/vtyardimcisi.dart';
import 'package:flutter/material.dart';

class VtAnasayfa extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AnasayfaState();
}

class AnasayfaState extends State<VtAnasayfa> {
  Vtyardimcisi vtYardimcisi = new Vtyardimcisi();
  List<Ogrenci> ogrenciler = new List();
  final genelCtrl = GlobalKey<FormState>();
  bool duzenleMi=false;

  final isimCtrl = TextEditingController();
  final soyisimCtrl = TextEditingController();
  final sinifCtrl = TextEditingController();

  _ogrenciEkle() {
    vtYardimcisi
        .ogrenciKaydet(
            new Ogrenci(isimCtrl.text, soyisimCtrl.text, sinifCtrl.text))
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

  _ogrenciSil(Ogrenci ogrenci) {
    vtYardimcisi.ogrenciSil(ogrenci).then((cvp){  
      if(cvp > 0){
        listeYenile();
      }
    });
  }
  _ogrenciGuncelle(Ogrenci ogrenci) {
    var ogr =new Ogrenci(isimCtrl.text, soyisimCtrl.text, sinifCtrl.text);
    ogr.no=ogrenci.no;
    vtYardimcisi.ogrenciGuncelle(ogr).then((cvp){
      if(cvp){
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

  listeYenile(){
     vtYardimcisi.ogrencilerGetir().then((gelen) {
       setState(() {
         ogrenciler = gelen;
       });
      
      debugPrint(gelen.toString());
    });
  }

  void eklemeEkraniAc({Ogrenci ogrenci}) {
    if(ogrenci!=null){
      duzenleMi=true;
      isimCtrl.text=ogrenci.isim;
      soyisimCtrl.text=ogrenci.soyisim;
      sinifCtrl.text=ogrenci.sinif;
    }
    else{
      duzenleMi=false;
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
                          controller: isimCtrl,
                          decoration: InputDecoration(
                              hintText: "Ogrencinin ismini Giriniz"),
                        ),
                        TextFormField(
                          controller: soyisimCtrl,
                          decoration: InputDecoration(
                              hintText: "Ogrencinin soyismini Giriniz"),
                        ),
                        TextFormField(
                          controller: sinifCtrl,
                          decoration:
                              InputDecoration(hintText: "Sınıfınızı giriniz"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed:()=> duzenleMi  ? _ogrenciGuncelle(ogrenci) : _ogrenciEkle,
                child: Text(duzenleMi ? "Düzenle" : "Ekle" ),
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
      appBar: AppBar(
        title: Text(
          "Veri Tabani islemleri",
          style: TextStyle(
            fontFamily: "ZCOOLQingKeHuangYou-Regular",
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.plus_one),
            onPressed: () => eklemeEkraniAc(),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: ogrenciler.length,
          itemBuilder: (BuildContext baglam, int sira) {
            return Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                        " ${ogrenciler[sira].isim} ${ogrenciler[sira].soyisim}",
                        style: TextStyle(
                          fontFamily: "ZCOOLQingKeHuangYou-Regular",
                          fontSize: 20.0,
                        )),
                    leading: Text("${ogrenciler[sira].no}"),
                    subtitle: Text("${ogrenciler[sira].sinif}"),
                  ),
                  Row(
                    children: <Widget>[
                      FlatButton(
                        onPressed:()=> eklemeEkraniAc(ogrenci: ogrenciler[sira]),
                        child: Text("guncelle"),
                      ),
                      FlatButton(
                        onPressed:() => _ogrenciSil(ogrenciler[sira]),
                        child: Text("sil",
                            style: TextStyle(
                              fontFamily: "ZCOOLQingKeHuangYou-Regular",
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
*/