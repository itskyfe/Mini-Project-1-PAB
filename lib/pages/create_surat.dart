import 'package:flutter/material.dart';
import '../models/surat_model.dart';
import '../models/page_header.dart';

class CreateSuratPage extends StatefulWidget {
  const CreateSuratPage({super.key});

  @override
  State<CreateSuratPage> createState() =>
      _CreateSuratPageState();
}

class _CreateSuratPageState
    extends State<CreateSuratPage> {
  final nomor = TextEditingController();
  final perihal = TextEditingController();
  final tanggal = TextEditingController();
  final asalTujuan = TextEditingController();

  String kategori = "Masuk";

  Widget input(
    String title,
    String placeholder,
    TextEditingController controller,
  ) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                fontWeight:
                    FontWeight.bold)),
        const SizedBox(height: 6),
        Card(
          child: Padding(
            padding:
                const EdgeInsets.all(12),
            child: TextField(
              controller: controller,
              decoration:
                  InputDecoration(
                hintText: placeholder,
                border:
                    InputBorder.none,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  bool validasi() {
    if (nomor.text.isEmpty ||
        perihal.text.isEmpty ||
        tanggal.text.isEmpty ||
        asalTujuan.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
            content: Text(
                "Semua field wajib diisi")),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const PageHeader(
              title: "Tambah Surat"),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.all(16),
              child: Column(
                children: [
                  input("Nomor Surat",
                      "Isi nomor surat",
                      nomor),
                  input("Perihal",
                      "Isi perihal",
                      perihal),
                  input("Tanggal",
                      "dd/mm/yyyy",
                      tanggal),
                  input(
                      "Asal / Tujuan",
                      "Isi asal atau tujuan",
                      asalTujuan),

                  Card(
                    child: DropdownButton(
                      value: kategori,
                      isExpanded: true,
                      underline:
                          const SizedBox(),
                      items: [
                        "Masuk",
                        "Keluar"
                      ]
                          .map((e) =>
                              DropdownMenuItem(
                                value: e,
                                child:
                                    Text(e),
                              ))
                          .toList(),
                      onChanged: (v) =>
                          setState(() =>
                              kategori = v!),
                    ),
                  ),

                  const SizedBox(
                      height: 20),

                  ElevatedButton(
                    onPressed: () {
                      if (!validasi())
                        return;

                      Navigator.pop(
                        context,
                        Surat(
                          nomor:
                              nomor.text,
                          perihal:
                              perihal.text,
                          tanggal:
                              tanggal.text,
                          kategori:
                              kategori,
                          asalTujuan:
                              asalTujuan
                                  .text,
                        ),
                      );
                    },
                    child:
                        const Text(
                            "Simpan"),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}