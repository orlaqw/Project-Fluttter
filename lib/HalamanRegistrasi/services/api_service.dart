import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<Map<String, dynamic>> registerUser({
    required String nama,
    required String gender,
    required String alamat,
    required String telepon,
    required String username,
    required String password,
    File? imageFile,
  }) async {
    var uri = Uri.parse("https://learn.smktelkom-mlg.sch.id/ukl1/api/register");

    var request = http.MultipartRequest('POST', uri);
    request.fields['nama nasabah'] = nama;
    request.fields['gender'] = gender;
    request.fields['alamat'] = alamat;
    request.fields['telepon'] = telepon;
    request.fields['username'] = username;
    request.fields['password'] = password;

    if (imageFile != null) {
      request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));
    }

    var response = await request.send();
    final respStr = await response.stream.bytesToString();
    final result = jsonDecode(respStr);

    return result;
  }
}

