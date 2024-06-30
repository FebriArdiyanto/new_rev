import 'package:Revisi/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddProduct extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _imageUrlController = TextEditingController();

  Future saveProduct() async {
    final response = await http.post(
        Uri.parse("http://localhost/projek_one_laravel/public/api/products"),
        body: {
          "name": _nameController.text,
          "description": _descriptionController.text,
          "price": _priceController.text,
          "image_url": _imageUrlController.text,
        });
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tambah Produk")),
      body: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Nama Produk"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nama produk tidak boleh kosong";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: "Deskripsi Produk"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Deskripsi produk tidak boleh kosong";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: "Harga"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Harga produk tidak boleh kosong";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imageUrlController,
                decoration: InputDecoration(labelText: "Link Gambar"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Link Gambar produk tidak boleh kosong";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      saveProduct().then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Data berhasil disimpan')));
                      });
                    }
                  },
                  child: Text('Simpan')),
            ],
          )),
    );
  }
}
