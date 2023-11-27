import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_application/data/repo/to_dos_repository.dart';

class KayitSayfaCubit extends Cubit<void> {
  KayitSayfaCubit():super(0);

  var repo = ToDosRepository();

  Future<void> kaydet(String name) async {
    await repo.kaydet(name);
  }

}