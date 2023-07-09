import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';

class MapsScreen extends StatelessWidget {
  const MapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scanListProvider =  Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scan;
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () => print('${index}'),
        leading: Icon(Icons.map, color: Theme.of(context).primaryColor,),
        title: Text(scans[index].valor),
        subtitle: Text('${scans[index].id}'),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
      ),
    );
  }
}