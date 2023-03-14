import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final textEditController = TextEditingController();
  String _nama = "";
  String pilihanSalam = "pagi";
  String pilihanSalamOut = ""; //untuk ditampilkan

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> salam = [];

    var itm1 = const DropdownMenuItem<String>(
      value: "pagi",
      child: Text("selamat pagi"),
    );

    var itm2 = const DropdownMenuItem<String>(
      value: "siang",
      child: Text("selamat siang"),
    );

    var itm3 = const DropdownMenuItem<String>(
      value: "sore",
      child: Text("selamat sore"),
    );

    var itm4 = const DropdownMenuItem<String>(
      value: "malam",
      child: Text("selamat malam"),
    );

    salam.add(itm1);
    salam.add(itm2);
    salam.add(itm3);
    salam.add(itm4);

    return MaterialApp(
      title: 'Hello App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello'),
        ),
        //dibawah langsung scaffold
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //jika ditap
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.dangerous),
        ),

        
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButton(
              value: pilihanSalam,
              items: salam,
              onChanged: (String? newValue) {
                setState(() {
                  if (newValue != null) {
                    pilihanSalam = newValue;
                  }
                });
              },
            ),
            Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
              height: 150,
            ),
            Text('Masukan Nama :'),
            TextField(
              controller: textEditController, //controller
            ),
            Padding(
              padding: EdgeInsets.all(20), //20 pixel ke semua arah
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _nama = textEditController.text;
                    pilihanSalamOut = pilihanSalam; //akses text via controller
                  }); //refresh
                },
                child: const Text('Klik Ini'),
              ),
            ),
            Text(
              _nama != "" ? 'Halo $_nama selamat $pilihanSalamOut' : "",
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ), //hasil disini
          ],
        )), //column center
      ), //Scaffold
    ); //Material APP
  }
}
