import 'package:flutter/material.dart';
import '../models/surat_model.dart';
import '../models/page_header.dart';

class UpdateSuratPage extends StatefulWidget {
  final Surat surat;

  const UpdateSuratPage(this.surat, {super.key});

  @override
  State<UpdateSuratPage> createState() => _UpdateSuratPageState();
}

class _UpdateSuratPageState extends State<UpdateSuratPage> {
  late TextEditingController nomor;
  late TextEditingController perihal;
  late TextEditingController tanggal;
  late TextEditingController asalTujuan;

  late String kategori;

  @override
  void initState() {
    super.initState();

    /// ambil data lama
    nomor = TextEditingController(text: widget.surat.nomor);
    perihal = TextEditingController(text: widget.surat.perihal);
    tanggal = TextEditingController(text: widget.surat.tanggal);
    asalTujuan = TextEditingController(text: widget.surat.asalTujuan);

    kategori = widget.surat.kategori;
  }

  /// INPUT CARD STYLE
  Widget inputField(String hint, TextEditingController controller) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: hint, border: InputBorder.none),
        ),
      ),
    );
  }

  bool validasi() {
    if (nomor.text.isEmpty ||
        perihal.text.isEmpty ||
        tanggal.text.isEmpty ||
        asalTujuan.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Data tidak boleh kosong")));
      return false;
    }
    return true;
  }

  void simpanUpdate() {
    if (!validasi()) return;

    widget.surat.nomor = nomor.text;
    widget.surat.perihal = perihal.text;
    widget.surat.tanggal = tanggal.text;
    widget.surat.asalTujuan = asalTujuan.text;
    widget.surat.kategori = kategori;

    Navigator.pop(context, widget.surat);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const PageHeader(title: "Update Surat"),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    inputField("Nomor Surat", nomor),

                    inputField("Perihal", perihal),

                    inputField("Tanggal", tanggal),

                    inputField("Asal / Tujuan", asalTujuan),

                    /// DROPDOWN
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: DropdownButton<String>(
                          value: kategori,
                          isExpanded: true,
                          underline: const SizedBox(),
                          items: ["Masuk", "Keluar"]
                              .map(
                                (e) =>
                                    DropdownMenuItem(value: e, child: Text(e)),
                              )
                              .toList(),
                          onChanged: (v) {
                            setState(() {
                              kategori = v!;
                            });
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    /// BUTTON SIMPAN
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.all(14),
                        ),
                        onPressed: simpanUpdate,
                        child: const Text(
                          "Simpan Perubahan",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
