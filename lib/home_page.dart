import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String pass32 = "-";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text("32 caracteres"),
        Expanded(
          child: ListView(
            children: [
              Row(
                children: [
                  Expanded(child: Text(pass32)),
                  IconButton(
                    onPressed: () {
                      pass32 = generarPassword(32);
                      setState(() {});
                    },
                    icon: Icon(Icons.refresh),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.copy)),
                ],
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            pass32 = generarPassword(32);
            setState(() {});
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text("Se generaron passwords."),
                ),
              );
          },
          child: Text("Generar passwords"),
        ),
        OutlinedButton(
          onPressed: resetAll,
          child: Text("Borrar passwords"),
        )
      ]),
    );
  }

  String generarPassword(int charsNum) {
    return String.fromCharCodes(
      List.generate(charsNum, (index) => Random().nextInt(48) + 60),
    );
  }

  void resetAll() {
    pass32 = "-";
  }
}
