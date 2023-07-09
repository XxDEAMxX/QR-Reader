import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scan_list_provider.dart';

class MyList extends StatelessWidget {
  final IconData icon;
  const MyList({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    final scanListProvider =  Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scan;
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (context, index) => Dismissible(
        key: UniqueKey(),
        background: Container(
          child: Icon(Icons.delete),
          color: Colors.red,
        ),
        onDismissed: (direction) {
          Provider.of<ScanListProvider>(context, listen: false).deleteScanId(scans[index].id!);
        },
        child: ListTile(
          onTap: () => print('${index}'),
          leading: Icon(icon, color: Theme.of(context).primaryColor,),
          title: Text(scans[index].valor),
          subtitle: Text('${scans[index].id}'),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
        ),
      ),
    );
  }
}