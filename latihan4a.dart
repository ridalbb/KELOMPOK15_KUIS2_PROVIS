import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(home: new MyApp()));

enum Gender { laki, perempuan }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();
  final textEditController = TextEditingController();
  String _nama = "";
  String provinsi = "Jawa Barat";
  bool isKerja = false;
  bool isAyamGoreng = false;
  bool isNasiGoreng = false;
  bool isMieGoreng = false;
  double tinggiBadan = 0;
  Gender? genderMhs;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> provinsiMhs = [];
    var itm1 = const DropdownMenuItem<String>(
      value: "Jawa Barat",
      child: Text("Jawa Barat"),
    );
    var itm2 = const DropdownMenuItem<String>(
      value: "Jawa Tengah",
      child: Text("Jawa Tengah"),
    );
    var itm3 = const DropdownMenuItem<String>(
      value: "Jawa Timur",
      child: Text("Jawa Timur"),
    );
    var itm4 = const DropdownMenuItem<String>(
      value: "Bali",
      child: Text("Bali"),
    );
    var itm5 = const DropdownMenuItem<String>(
      value: "Sumatra Barat",
      child: Text("Sumatra Barat"),
    );
    provinsiMhs.add(itm1);
    provinsiMhs.add(itm2);
    provinsiMhs.add(itm3);
    provinsiMhs.add(itm4);
    provinsiMhs.add(itm5);

    return MaterialApp(
        title: 'Hello App',
        home: Form(
          key: _formKey,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Hello'),
            ),
            body: Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Masukan Nama :'),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tidak Boleh Kosong';
                    }
                  },
                  controller: textEditController, //controller
                ),
                Text('Pilih Gender Anda :'),
                RadioListTile<Gender>(
                  title: const Text('Laki-Laki'),
                  value: Gender.laki,
                  groupValue: genderMhs,
                  onChanged: (Gender? value) {
                    setState(() {
                      genderMhs = value;
                    });
                  },
                ),
                RadioListTile<Gender>(
                  title: const Text('Perempuan'),
                  value: Gender.perempuan,
                  groupValue: genderMhs,
                  onChanged: (Gender? value) {
                    setState(() {
                      genderMhs = value; //jawaban user disimpan
                    });
                  },
                ),
                Text('Apakah Sudah Bekerja?'),

                SwitchListTile(
                  title: const Text('Sudah Kerja?'),
                  value: isKerja, //boolean
                  onChanged: (bool value) {
                    setState(() {
                      isKerja = value;
                    });
                  },
                  secondary: const Icon(Icons.location_city_rounded),
                ),
                Text('Masukkan Tinggi Badan Anda :'),

                Slider(
                  value: tinggiBadan, //tipe double
                  max: 200,
                  divisions: 200,
                  label: tinggiBadan.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      tinggiBadan = value;
                    });
                  },
                ),
                Text('Pilih Makanan Favorit Anda :'),
                CheckboxListTile(
                  title: const Text('Ayam Goreng'),
                  value: isAyamGoreng, //boolean
                  onChanged: (bool? value) {
                    setState(() {
                      isAyamGoreng = !isAyamGoreng;
                    });
                  },
                  secondary: const Icon(Icons.check_circle),
                ),
                CheckboxListTile(
                  title: const Text('Nasi Goreng'),
                  value: isNasiGoreng, //boolean
                  onChanged: (bool? value) {
                    setState(() {
                      isNasiGoreng = !isNasiGoreng;
                    });
                  },
                  secondary: const Icon(Icons.check_circle),
                ),
                CheckboxListTile(
                  title: const Text('Mie Goreng'),
                  value: isMieGoreng, //boolean
                  onChanged: (bool? value) {
                    setState(() {
                      isMieGoreng = !isMieGoreng;
                    });
                  },
                  secondary: const Icon(Icons.check_circle),
                ),
                Text('Pilih Provinsi:'),

                DropdownButton(
                  value: provinsi,
                  items: provinsiMhs,
                  onChanged: (String? newValue) {
                    setState(() {
                      if (newValue != null) {
                        provinsi = newValue;
                      }
                    });
                  },
                ),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _nama =
                            textEditController.text; //akses text via controller
                      });
                    }
                    tampilkanDialog(context); //refresh
                  },
                  child: const Text('Klik Ini'),
                ),
                Text('Halo $_nama'), //hasil disini
              ],
            )), //column center
          ), //Scaffold
        ));
    //Material APP
  }

  void tampilkanDialog(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Konfirmasi'),
        content: const Text('Anda yakin data yang dimasukan benar?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('Yakin'),
          ),
        ],
      ),
    );
  }
}
