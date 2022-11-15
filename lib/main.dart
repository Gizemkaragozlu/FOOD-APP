import 'package:flutter/material.dart';
import 'package:food_app/DetaySayfa.dart';
import 'package:food_app/Yemekler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Yemekler>> yemekleriGetir() async {
    var yemekListesi = <Yemekler>[];

    var y1 = Yemekler(1, "Hamburger", "hamburger", 59.99);
    var y2 = Yemekler(2, "Makarna", "makarna", 35.99);
    var y3 = Yemekler(3, "Pizza", "pizza", 68.99);
    var y4 = Yemekler(4, "Sarma", "sarma", 45.99);
    var y5 = Yemekler(5, "Waffle", "waffle", 28.99);
    var y6 = Yemekler(6, "Yağlama", "yaglama", 76.99);
    yemekListesi.add(y1);
    yemekListesi.add(y2);
    yemekListesi.add(y3);
    yemekListesi.add(y4);
    yemekListesi.add(y5);
    yemekListesi.add(y6);
    return yemekListesi; //Veri kümemiz oluştu
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Food"))),
      body: FutureBuilder<List<Yemekler>>(
        future: yemekleriGetir(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            var yemekListesi = snapshot.data; //Listeyi buraya aktardık
            return ListView.builder(
              itemCount: yemekListesi!.length,
              itemBuilder: ((context, indeks) {
                var yemek = yemekListesi[indeks];
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  DetaySayfa(yemek: yemek))));
                    },
                    child: Card(
                      child: Row(
                        children: [
                          SizedBox(
                              width: 150,
                              height: 150,
                              child: Image.asset(
                                  "assets/${yemek.yemek_resim_adi}.jpg")),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                yemek.yemek_adi,
                                style: TextStyle(fontSize: 25),
                              ),

                              //SizeBox(height:50,),

                              Text(
                                "${yemek.yemek_fiyat}\u{20BA}",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.green.shade200),
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(Icons.keyboard_arrow_right),
                        ],
                      ),
                    ));
              }),
            );
          } else {
            return Center();
          }
        }),
      ),
    );
  }
}
