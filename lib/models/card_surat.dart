import 'package:flutter/material.dart';
import '../models/surat_model.dart';

class SuratCard extends StatelessWidget {
  final Surat surat;
  final VoidCallback? onDelete;
  final VoidCallback? onTap;

  const SuratCard({
    super.key,
    required this.surat,
    this.onDelete,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        onTap: onTap,
        title: Text(
          surat.perihal,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nomor : ${surat.nomor}"),
            Text("Tanggal : ${surat.tanggal}"),
            Text("Kategori : ${surat.kategori}"),
            Text("Asal/Tujuan : ${surat.asalTujuan}"),
          ],
        ),
        trailing: onDelete != null
            ? IconButton(
                icon: const Icon(Icons.delete,
                    color: Colors.red),
                onPressed: onDelete,
              )
            : null,
      ),
    );
  }
}