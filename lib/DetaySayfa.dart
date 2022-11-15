import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_app/Yemekler.dart';

class DetaySayfa extends StatefulWidget {
  Yemekler yemek;

  DetaySayfa({required this.yemek});
  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.yemek.yemek_adi)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/${widget.yemek.yemek_adi.toLowerCase()}.jpg"),
            Text(
              "${widget.yemek.yemek_fiyat}\u{20BA}",
              style: TextStyle(fontSize: 48, color: Colors.green.shade200),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("Sipariş Ver"),
                //color: Colors.orange.shade200,
                //textColor: Colors.white,
                onPressed: () {
                  print("${widget.yemek.yemek_adi}");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
