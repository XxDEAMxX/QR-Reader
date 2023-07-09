import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/widgets/MyList.dart';

import '../providers/scan_list_provider.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyList(icon: Icons.pages);
  }
 }


