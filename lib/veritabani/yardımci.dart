import 'package:aurora/veritabani/model.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class Vtyardimcisi{
  
  static final Vtyardimcisi _yardimci=new Vtyardimcisi.icIslem();
    factory Vtyardimcisi()=>_yardimci; //ramden yer almak icin bu işlemi yapıyoruz
    Vtyardimcisi.icIslem();
    static Database _db; //buradaki Database ismi bizim import ettigmiz dart dosyasının icindeki ismi
    
    Future<Database> get veritabani async{
      if(_db !=null ) return _db;
      _db=await olusturVt();
      return _db;
    }
    olusturVt() async{
      io.Directory dosyaKonumu=await getApplicationDocumentsDirectory(); //dosya konumunu bulma uygulamanıın belge yolu
      String yol=join(dosyaKonumu.path,"aurora.db");
      var veriTabani=await openDatabase(yol,version:1,onCreate:_ilkacilis);
      return veriTabani;
    
    }
    
    _ilkacilis(Database db,int version) async{
      await db.execute(
        "CREATE TABLE Kullanici(no INTEGER PRIMARY KEY AUTOINCREMENT,isim TEXT,departman TEXT,gorev TEXT)");
    }
    
    Future<int> kullaniciKaydet(Kullanici kullanici) async{
      var veritab=await veritabani;
      int cvp=await veritab.insert("Kullanici",kullanici.haritaYap());
      return cvp;
    
    }
    
    Future<List<Kullanici>> kullaniciGetir() async{
      var veritab=await veritabani;
      List<Map> liste=await veritab.rawQuery("SELECT *FROM Kullanici");
      List<Kullanici> kullanicilar=new List();
    
      
        for(int i=0;i<liste.length;i++){
        var kullanici=new Kullanici(liste[i]["isim"],liste[i]["departman"],liste[i]["gorev"]);
        kullanici.numaraVer(liste[i]["no"]);
        kullanicilar.add(kullanici);
      }
      return kullanicilar;
    }
    Future<int> kullaniciSil(Kullanici kullanici) async{
      var veritab=await veritabani;
      int cvp=await veritab.rawDelete("DELETE FROM Kullanici WHERE no=?",[kullanici.no]);
      return cvp;
    
    }
    Future<bool> kullaniciGuncelle(Kullanici kullanici) async{
      var veritab=await veritabani; 
      int cvp=await veritab.update("Kullanici", kullanici.haritaYap(), where: "no=?",whereArgs: <int>[kullanici.no]);
      return cvp>0 ? true :false;
    
    }
  
   
  
    
}