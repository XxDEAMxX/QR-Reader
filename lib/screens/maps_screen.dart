import 'package:flutter/material.dart';

class MapsScreen extends StatelessWidget {
  const MapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => ListTile(
        onTap: () => print('${index}'),
        leading: Icon(Icons.map, color: Theme.of(context).primaryColor,),
        title: Text('http//:msajkdmjasñ'),
        subtitle: Text('ID: 1'),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
      ),
    );
  }
}