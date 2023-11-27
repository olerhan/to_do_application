import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_application/data/entity/to_dos.dart';
import 'package:to_do_application/ui/cubit/detay_sayfa_cubit.dart';

class DetaySayfa extends StatefulWidget {
  ToDos toDo;
  DetaySayfa({required this.toDo});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {

  var tfToDoName = TextEditingController();

  @override
  void initState() {
    super.initState();
  var toDo = widget.toDo;
  tfToDoName.text = toDo.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detay Sayfa"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfToDoName,decoration: const InputDecoration(hintText: "Ne yapılacak?"),),
              ElevatedButton(onPressed: (){
                context.read<DetaySayfaCubit>().guncelle(widget.toDo.id, tfToDoName.text);
                Navigator.pop(context);
              }, child: const Text("GÜNCELLE"))
            ],
          ),
        ),
      ),
    );
  }
}
