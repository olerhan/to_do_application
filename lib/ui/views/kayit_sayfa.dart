import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_application/ui/cubit/kayit_sayfa_cubit.dart';

class KayitSayfa extends StatefulWidget {
  const KayitSayfa({super.key});

  @override
  State<KayitSayfa> createState() => _KayitSayfaState();
}

class _KayitSayfaState extends State<KayitSayfa> {

  var tfToDoName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kayıt Sayfa"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfToDoName,decoration: const InputDecoration(hintText: "Ne yapılacak?"),),
              ElevatedButton(onPressed: (){
                context.read<KayitSayfaCubit>().kaydet(tfToDoName.text);
                Navigator.pop(context);
              }, child: const Text("KAYDET"))
            ],
          ),
        ),
      ),
    );
  }
}
