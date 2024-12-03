import 'package:flutter/material.dart';

class InputWidget3 extends StatefulWidget {
  const InputWidget3({super.key});

  @override
  State<InputWidget3> createState() => _InputWidgetState(); 
}

class _InputWidgetState extends State<InputWidget3> {
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
      padding: const EdgeInsets.all(16.0), // Adjust the margin as needed
      child: TextField(
        controller: isi,
        obscureText: false,
        decoration: InputDecoration( //untuk memberi dekorasi/ menghias textfield
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0), // membuat border rounded
            borderSide: BorderSide(color: Colors.blueGrey), // memberi warna border
          ),
          label: Text('Password', style: TextStyle(color: Colors.blueGrey),), //untuk memberi tulisan didalam textfield
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 8.0), // Add padding to the right of the icon
              child: IconButton(
              icon: Icon(Icons.visibility_off_outlined, color: Colors.blueGrey), // Change icon to visibility_off
              onPressed: () {
                get_nama(); // Call the get_nama function when the button is pressed
              },
              ),
            ),
            filled: true, //mengisi warna background
            fillColor: Colors.white,
        ),
      ),
    );
  }
}
