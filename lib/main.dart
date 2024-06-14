import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  TextEditingController inputUsername = TextEditingController();
  TextEditingController inputPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Silahkan Login Terlebih Dahulu!',
              style: TextStyle(
                color: Colors.amberAccent,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
              child: TextField(
                controller: inputUsername,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Username',
                  hintText: 'Masukkan Username Anda',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
              child: TextField(
                controller: inputPassword,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  labelText: 'Password',
                  hintText: 'Masukkan Password Anda',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    //Logika Ketika Tombol Ditekan

                    //Ambil Value Dari TextField
                    String uname = inputUsername.text;
                    String pass = inputPassword.text;

                    //Logika Percabangan
                    if (uname == 'manda' && pass == '12345678') {
                      //Login Sukses
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondScreen()),
                      );

                      Fluttertoast.showToast(
                        msg: 'Login Berhasil!, SELAMAT DATANG :)',
                        toastLength: Toast.LENGTH_SHORT,
                      );
                    } else {
                      //Login Gagal
                      Fluttertoast.showToast(
                        msg:
                            'Login Gagal, Periksa Kembali Username dan Password Anda!',
                        toastLength: Toast.LENGTH_LONG,
                      );
                    }
                  },
                  child: Text('Login'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    //Logika Ketika Tombol Ditekan
                    inputUsername.clear();
                    inputPassword.clear();
                  },
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  //Ini Data Yang Digunakan
  final List<dataBuah> buah = [
    dataBuah(nama: 'Anggur', gambar: 'images/anggur.jpeg'),
    dataBuah(nama: 'Apel', gambar: 'images/apel.jpeg'),
    dataBuah(nama: 'Jeruk', gambar: 'images/jeruk.jpeg'),
    dataBuah(nama: 'Lemon', gambar: 'images/lemon.jpeg'),
    dataBuah(nama: 'Nanas', gambar: 'images/nanas.jpeg'),
    dataBuah(nama: 'Pisang', gambar: 'images/pisang.jpeg'),
    dataBuah(nama: 'Salak', gambar: 'images/salak.jpeg'),
    dataBuah(nama: 'Semangka', gambar: 'images/semangka.jpeg'),
    dataBuah(nama: 'Strawberry', gambar: 'images/strawberry.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Tugas Pertemuan 12'),
          ),
          body: TabBarView(
            children: [
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                itemCount: buah.length,
                itemBuilder: (context, index) {
                  return GridItem(ambilData: buah[index]);
                },
              ),
              ListView.builder(
                itemCount: buah.length,
                itemBuilder: (context, index) {
                  return ListItem(getFruit: buah[index]);
                },
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/ane.jpg'),
                    SizedBox(height: 10),
                    Text(
                      'Amanda Sari',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '21220529',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'SI - 5N',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        //Logika Ketika Tombol Ditekan
                        Navigator.pop(context);

                        Fluttertoast.showToast(
                        msg: 'Anda Logout!, Selamat Datang Kembali :)',
                        toastLength: Toast.LENGTH_SHORT,
                      );
                      },
                      child: Text('LogOut'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: ConvexAppBar(
            items: [
              TabItem(icon: Icons.home, title: 'Beranda'),
              TabItem(icon: Icons.search, title: 'Search'),
              TabItem(icon: Icons.person, title: 'Person'),
            ],
          ),
        ),
      ),
    );
  }
}

class dataBuah {
  final String nama;
  final String gambar;

  dataBuah({required this.nama, required this.gambar});
}

class GridItem extends StatelessWidget {
  final dataBuah ambilData;

  GridItem({required this.ambilData});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(
            ambilData.gambar,
            height: 100,
          ),
          SizedBox(height: 10),
          Text(ambilData.nama),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final dataBuah getFruit;

  ListItem({required this.getFruit});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          getFruit.gambar,
          width: 50,
        ),
        title: Text(getFruit.nama),
      ),
    );
  }
}
