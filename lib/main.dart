import 'package:flutter/material.dart';

void main() {
  runApp(Tes());
}

class Tes extends StatelessWidget {
  List<String> menu = ["Soto", "Rawon"];

  List<int> harga = [10000, 15000];

  List<String> gambar = ["assets/soto.jpg", "assets/rawon.jpg"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffFFF3E0),
        appBar: AppBar(
          title: Text(
            "Menu Makanan",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xff795548),
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Table(
            border: TableBorder.all(
              width: 1.5,
              color: Color(0xff795548),
            ),
            columnWidths: {
              0: FlexColumnWidth(0.6),
              1: FlexColumnWidth(1.5),
              2: FlexColumnWidth(1.2),
              3: FlexColumnWidth(1.2),
            },
            children: [
              // Header
              TableRow(
                decoration: BoxDecoration(
                  color: Color(0xffA1887F),
                ),
                children: [
                  header("No"),
                  header("Gambar"),
                  header("Menu"),
                  header("Harga"),
                ],
              ),

              // Data
              for (int i = 0; i < menu.length; i++)
                TableRow(
                  decoration: BoxDecoration(
                    color: i % 2 == 0 ? Color(0xffFFFFFF) : Color(0xffEFEBE9),
                  ),
                  children: [
                    isi("${i + 1}"),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          gambar[i],
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    isi(menu[i]),
                    isi("Rp ${harga[i]}"),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget header(String teks) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Text(
        teks,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget isi(String teks) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Center(
        child: Text(
          teks,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xff4E342E),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
