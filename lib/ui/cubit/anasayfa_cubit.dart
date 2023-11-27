import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_application/data/entity/to_dos.dart';
import 'package:to_do_application/data/repo/to_dos_repository.dart';

class AnasayfaCubit extends Cubit<List<ToDos>> {
  AnasayfaCubit():super(<ToDos>[]);

  var repo = ToDosRepository();

  Future<void> yukle() async {
    var toDoList = await repo.yukle();
    emit(toDoList);
  }

  Future<void> aramaYap(String arananName) async {
    var toDoList = await repo.aramaYap(arananName);
    emit(toDoList);
  }

  Future<void> sil(int id) async {
    await repo.sil(id);
    await yukle();
  }


}