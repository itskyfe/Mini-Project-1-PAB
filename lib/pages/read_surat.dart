import 'package:flutter/material.dart';
import '../models/surat_model.dart';
import '../models/page_header.dart';
import '../models/card_surat.dart';
import 'update_surat.dart';

class ListSuratPage extends StatefulWidget {
  final List<Surat> data;

  const ListSuratPage(this.data, {super.key});

  @override
  State<ListSuratPage> createState() =>
      _ListSuratPageState();
}

class _ListSuratPageState
    extends State<ListSuratPage> {

  bukaUpdate(int index) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            UpdateSuratPage(widget.data[index]),
      ),
    );

    /// refresh UI setelah update
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
// App Bar
      appBar: AppBar(
        title: Text('Arkivee', 
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          backgroundColor: Colors.blue
        ),),
      ),
// Body
      body: Column(
        children: [
          const PageHeader(title: "List Surat"),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: widget.data.length,
              itemBuilder: (context, index) {
                return SuratCard(
                  surat: widget.data[index],

                  /// ✅ TAP = UPDATE
                  onTap: () => bukaUpdate(index),

                  /// ✅ DELETE
                  onDelete: () {
                    setState(() {
                      widget.data.removeAt(index);
                    });
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}