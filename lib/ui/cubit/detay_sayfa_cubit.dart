import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_application/data/repo/to_dos_repository.dart';

class DetaySayfaCubit extends Cubit<void> {
  DetaySayfaCubit():super(0);

  var repo = ToDosRepository();

  Future<void> guncelle(int id, String name) async {
    await repo.guncelle(id, name);
  }

}