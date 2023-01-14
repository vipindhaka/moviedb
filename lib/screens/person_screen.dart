import 'package:instantsy/list_item.dart';
import 'package:instantsy/repsoitory/fetch_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen({super.key});

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<FetchData>(context);
    return FutureBuilder(
      future: data.fetchPerson(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasData) {
          final persons = snapshot.data;
          return ListView.builder(
              itemCount: persons!.length,
              itemBuilder: (context, i) {
                return MovieItem(
                    name: persons[i].name,
                    path: persons[i].profilepath,
                    overview: persons[i].knownfordepartment);
              });
        }
        return Text('no data');
      },
    );
  }
}
