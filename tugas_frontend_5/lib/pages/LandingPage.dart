import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tugas_frontend_5/model/Vacations.dart';
import 'package:tugas_frontend_5/services/VacationsServices.dart';
import 'DetailPage.dart';

class LandingPage extends StatefulWidget {
  static final url = "/";
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late Future<Vacations> _vacations;
  int id = 0;

  @override
  void initState() {
    super.initState();
    _vacations = VacationsServices().getAllVacations();
  }

  void refreshData() {
    id++;
  }

  FutureOr onGoBack(dynamic value) {
    refreshData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vacation"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/form-create').then(onGoBack);
        },
      ),
      body: FutureBuilder(
        future: _vacations,
        builder: (context, AsyncSnapshot<Vacations> snapshot) {
          var state = snapshot.connectionState;
          if (state != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  var vacation = snapshot.data!.data[index];
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, DetailPage.url,
                          arguments: vacation);
                    },
                    child: listItem(vacation),
                  );
                },
                itemCount: snapshot.data!.data.length,
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            } else {
              return Text('');
            }
          }
        },
      ),
    );
  }

  Widget listItem(Vacation place) {
    return Card(
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(flex: 1, child: Image.network(place.imageUrl)),
        Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    place.nama,
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(place.kota),
                ],
              ),
            )),
      ]),
    );
  }
}
