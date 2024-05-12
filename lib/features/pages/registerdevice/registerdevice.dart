import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class registerdevice extends StatefulWidget {
  const registerdevice({super.key});

  @override
  State<registerdevice> createState() => _registerdeviceState();
}

class _registerdeviceState extends State<registerdevice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text('Register a device'),
    ));
  }
}
