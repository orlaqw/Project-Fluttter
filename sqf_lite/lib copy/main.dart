import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'sql_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter SQLite Demo',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _items = [];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  bool _isLoading = true;
  bool _isCompleted = false;
  File? _image;

  @override
  void initState() {
    super.initState();
    _refreshItems();
  }

  // **Membaca semua data dari database**
  void _refreshItems() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _items = data;
      _isLoading = false;
    });
  }

  // **Menampilkan dialog untuk menambah data**
  void _showForm(int? id) async {
    if (id != null) {
      final existingItem = _items.firstWhere((element) => element['id'] == id);
      _titleController.text = existingItem['title'];
      _descriptionController.text = existingItem['description'];
      _noteController.text = existingItem['note'];
      _isCompleted = existingItem['isCompleted'] == 1;
      _image = existingItem['imagePath'] != null ? File(existingItem['imagePath']) : null;
    }

    showModalBottomSheet(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setModalState) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(controller: _titleController, decoration: const InputDecoration(labelText: 'Title')),
                TextField(controller: _descriptionController, decoration: const InputDecoration(labelText: 'Description')),
                TextField(controller: _noteController, decoration: const InputDecoration(labelText: 'Note')),
                CheckboxListTile(
                  title: const Text('Completed'),
                  value: _isCompleted,
                  onChanged: (newValue) {
                    setModalState(() {
                      _isCompleted = newValue!;
                    });
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      setModalState(() {
                        _image = File(pickedFile.path);
                      });
                      print('Image selected: ${pickedFile.path}');
                    } else {
                      print('No image selected.');
                    }
                  },
                  child: const Text('Pick Image'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (_titleController.text.isEmpty) {
                      print('Title is empty');
                      return;
                    }
                    try {
      if (id == null) {
        await SQLHelper.createItem(_titleController.text, _descriptionController.text, _noteController.text, _image?.path);
        print('Item created with image path: ${_image?.path}');
      } else {
        await SQLHelper.updateItem(id, _titleController.text, _descriptionController.text, _noteController.text, _isCompleted ? 1 : 0, _image?.path);
        print('Item updated with image path: ${_image?.path}');
      }
      _titleController.clear();
      _descriptionController.clear();
      _noteController.clear();
      _isCompleted = false;
      _image = null;
      Navigator.of(context).pop();
      _refreshItems();
    } catch (e) {
      print('Error: $e');
    }
                  },
                  child: Text(id == null ? 'Add Item' : 'Update Item'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // **Menghapus data berdasarkan ID**
  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    _refreshItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SQLite CRUD Example')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) => Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            title: Row(
              children: [
                if (_items[index]['imagePath'] != null)
                  Image.file(
                    File(_items[index]['imagePath']),
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_items[index]['title'] ?? 'No Title', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(_items[index]['description'] ?? 'No Description'),
                      Text(_items[index]['note'] ?? 'No Note'),
                      Text(_items[index]['isCompleted'] == 1 ? 'Completed' : 'Not Completed'),
                    ],
                  ),
                ),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(icon: const Icon(Icons.edit), onPressed: () => _showForm(_items[index]['id'])),
                IconButton(icon: const Icon(Icons.delete), onPressed: () => _deleteItem(_items[index]['id'])),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(null),
        child: const Icon(Icons.add),
      ),
    );
  }
}