import 'package:flutter/material.dart';

class InputWidget2 extends StatefulWidget {
  const InputWidget2({super.key});

  @override
  State<InputWidget2> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget2> {
  TextEditingController isi = TextEditingController();
  var input = ''; //fungsinya untuk menyimpan data dari nama //petik atas digunakan untuk kosong/ string, agar ada isinya
  get_nama(){
    setState(() { //untuk menyimpan/ merubah data secara realtime
      input = isi.text; //jadi nama_lengkap itu isinya dari nama.text/ nama.text disimpan di nama_lengkap
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0), // Adjust the margin as needed
      child: TextField(
        controller: isi,
        obscureText: false,
        decoration: InputDecoration( //untuk memberi dekorasi/ menghias textfield
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0), // membuat border rounded
            borderSide: BorderSide(color: Colors.blueGrey), // memberi warna border
          ),
          label: Text('Movie/ Cinema', style: TextStyle(color: Colors.blueGrey),), //untuk memberi tulisan didalam textfield
          prefixIcon: Icon(Icons.search, color: Colors.blueGrey,), //untuk memberi icon di depan textfield
          filled: true, //mengisi warna background
          fillColor: Colors.white, //warna background
        ),
      ),
    );
  }
}
