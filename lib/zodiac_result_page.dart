import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'zodiac_provider.dart';

class ZodiacResultPage extends StatelessWidget {
  final String name;

  ZodiacResultPage(this.name);

  @override
  Widget build(BuildContext context) {
    final zodiac = Provider.of<ZodiacProvider>(context).zodiac;
    final bulan = Provider.of<ZodiacProvider>(context).bulan;

    return Scaffold(
      appBar: AppBar(title: Text('RAMAL APP')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$name", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),

            Text("Bintang Anda: ${zodiac?.name ?? 'Tidak diketahui'}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(zodiac?.detail ?? 'Detail tidak ditemukan.'),
            SizedBox(height: 24),

            Text("Menurut bulan ${bulan?.name ?? 'Tidak diketahui'}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(bulan?.detail ?? 'Detail tidak ditemukan.'),
            SizedBox(height: 30),

            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Kembali"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
