import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persegi Panjang',
      home: PersegiPanjang(),
    );
  }
}

class PersegiPanjang extends StatefulWidget {
  @override
  _PersegiPanjangState createState() => _PersegiPanjangState();
}

class _PersegiPanjangState extends State<PersegiPanjang> {
  TextEditingController _panjangController = TextEditingController();
  TextEditingController _lebarController = TextEditingController();
  double _luas = 0;
  double _keliling = 0;

  void _hitungLuasKeliling() {
    double panjang = double.parse(_panjangController.text);
    double lebar = double.parse(_lebarController.text);
    setState(() {
      _luas = panjang * lebar;
      _keliling = 2 * (panjang + lebar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Persegi Panjang'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _panjangController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Panjang',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _lebarController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Lebar',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _hitungLuasKeliling,
              child: const Text('Hitung'),
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0))),
            ),
            SizedBox(height: 16.0),
            Text('Luas: $_luas'),
            SizedBox(height: 8.0),
            Text('Keliling: $_keliling'),
          ],
        ),
      ),
    );
  }
}
