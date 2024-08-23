import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/kategori_model.dart';
import '../controllers/kategori_controller.dart';

class EditKategoriView extends StatelessWidget {
  final KategoriController controller = Get.find();

  final TextEditingController namaKategoriController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final DataKategori kategori = Get.arguments;
    namaKategoriController.text = kategori.namaKategori!;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kategori',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.amberAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Update Kategori',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.amberAccent,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: namaKategoriController,
              decoration: InputDecoration(
                labelText: 'Nama Kategori',
                labelStyle: TextStyle(color: Colors.amberAccent),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final updatedKategori = DataKategori(
                    id: kategori.id,
                    namaKategori: namaKategoriController.text,
                  );
                  controller.updateKategori(kategori.id!, updatedKategori);
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  backgroundColor: Colors.amberAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
