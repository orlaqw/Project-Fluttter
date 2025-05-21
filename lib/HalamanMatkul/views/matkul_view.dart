import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Matkul {
  final String id;
  final String nama;
  final int sks;
  bool selected;

  Matkul({required this.id, required this.nama, required this.sks, this.selected = false});
}

class MatkulPage extends StatefulWidget {
  @override
  _MatkulPageState createState() => _MatkulPageState();
}

class _MatkulPageState extends State<MatkulPage> {
  List<Matkul> matkulList = [];

  // GET data mata kuliah
  Future<void> fetchMatkul() async {
    final response = await http.get(Uri.parse('https://learn.smktelkom-mlg.sch.id/uk11/api/getmatkul'));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      setState(() {
        matkulList = data.map((item) => Matkul(
          id: item['id'].toString(),
          nama: item['nama_matkul'],
          sks: item['sks'],
        )).toList();
      });
    } else {
      throw Exception('Gagal memuat data mata kuliah');
    }
  }

  // POST matkul terpilih
  Future<void> submitMatkul() async {
    final selectedMatkul = matkulList.where((matkul) => matkul.selected).toList();

    final body = json.encode({
      "list_matkul": selectedMatkul.map((matkul) => {
        "id": matkul.id,
        "nama_matkul": matkul.nama,
        "sks": matkul.sks
      }).toList()
    });

    final response = await http.post(
      Uri.parse('https://learn.smktelkom-mlg.sch.id/uk11/api/selectmatkul'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    final responseJson = json.decode(response.body);
    if (response.statusCode == 200 && responseJson['status'] == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(responseJson['message'])),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal submit matkul')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    fetchMatkul();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daftar Mata Kuliah')),
      body: matkulList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: matkulList.length,
                    itemBuilder: (context, index) {
                      final matkul = matkulList[index];
                      return CheckboxListTile(
                        title: Text('${matkul.nama} (${matkul.sks} SKS)'),
                        value: matkul.selected,
                        onChanged: (value) {
                          setState(() {
                            matkul.selected = value!;
                          });
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: submitMatkul,
                    child: Text("Simpan yang Terpilih"),
                  ),
                )
              ],
            ),
    );
  }
}
