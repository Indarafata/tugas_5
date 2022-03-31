import 'package:flutter/material.dart';
import 'package:tugas_frontend_5/model/Vacations.dart';
import 'package:tugas_frontend_5/pages/LandingPage.dart';
import 'package:tugas_frontend_5/services/VacationsServices.dart';

class FormEdit extends StatefulWidget {
  static final url = "/form-edit";
  const FormEdit({Key? key}) : super(key: key);

  @override
  _FormEditState createState() => _FormEditState();
}

class _FormEditState extends State<FormEdit> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _imageController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Vacation place =
        ModalRoute.of(context)!.settings.arguments as Vacation;

    if (place != null) {
      _nameController.text = place.nama;
      _descriptionController.text = place.deskripsi;
      _imageController.text = place.imageUrl;
      _cityController.text = place.kota;
      _priceController.text = place.harga;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Update Vacation"),
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

                  await VacationsServices()
                      .updateVacation(body, place.id)
                      .then((value) {
                    Navigator.pushReplacementNamed(context, LandingPage.url);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:
                            Text('You have successfully update a vacation')));
                  });
                },
                child: Text("Update Vacation"),
              ),
            )
          ],
        ),
      )),
    );
  }
}
