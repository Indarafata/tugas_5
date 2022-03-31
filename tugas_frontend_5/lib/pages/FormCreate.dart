import 'package:flutter/material.dart';
import 'package:tugas_frontend_5/services/VacationsServices.dart';

class FormCreate extends StatefulWidget {
  const FormCreate({Key? key}) : super(key: key);

  @override
  _FormCreateState createState() => _FormCreateState();
}

class _FormCreateState extends State<FormCreate> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _imageController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Create Vacation"),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nama Wisata"),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Deskripsi Wisata"),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Image URL Wisata"),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                      controller: _imageController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Lokasi Wisata"),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                      controller: _cityController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Harga Tiket Wisata"),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                      controller: _priceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      )),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  Map<String, dynamic> body = {
                    'nama': _nameController.text,
                    'deskripsi': _descriptionController.text,
                    'image_url': _imageController.text,
                    'kota': _cityController.text,
                    'harga': _priceController.text,
                  };

                  await VacationsServices().createVacation(body).then((value) {
                    Navigator.pushReplacementNamed(context, '/');
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:
                            Text('You have successfully create a vacation')));
                  });
                },
                child: Text("Create Vacation"),
              ),
            )
          ],
        ),
      )),
    );
  }
}
