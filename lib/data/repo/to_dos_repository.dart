import 'package:to_do_application/data/entity/to_dos.dart';
import 'package:to_do_application/sqlite/veritabani_yardimcisi.dart';

class ToDosRepository {
  Future<List<ToDos>> yukle() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM toDos");
    return List.generate(maps.length, (indeks){
      var satir = maps[indeks];
      return ToDos(id: satir["id"], name: satir["name"]);
    });
  }

  Future<List<ToDos>> aramaYap(String arananName) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM toDos WHERE name like '%${arananName}%'");
    return List.generate(maps.length, (indeks){
      var satir = maps[indeks];
      return ToDos(id: satir["id"], name: satir["name"]);
    });
  }

  Future<void> kaydet(String name) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    Map<String, dynamic> kayitMap = {};
    kayitMap["name"] = name;
    await db.insert("toDos", kayitMap);
  }

  Future<void> guncelle(int id, String name) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    Map<String, dynamic> kayitMap = {};
    kayitMap["name"] = name;
    await db.update("toDos", kayitMap, where: "id = ?", whereArgs: [id]);//whereArgs soru işaretine
  }

  Future<void> sil(int id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    Map<String, dynamic> kayitMap = {};
    await db.delete("toDos", where: "id = ?", whereArgs: [id]);//whereArgs soru işaretine
  }

}