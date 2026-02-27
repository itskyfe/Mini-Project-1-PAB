import 'package:flutter/material.dart';
import '../models/surat_model.dart';
import '../models/card_surat.dart';
import 'create_surat.dart';
import 'read_surat.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Surat> dataSurat = [];

  tambahSurat() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const CreateSuratPage(),
      ),
    );

    if (result != null) {
      setState(() {
        dataSurat.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int masuk =
        dataSurat.where((e) => e.kategori == "Masuk").length;
    int keluar =
        dataSurat.where((e) => e.kategori == "Keluar").length;

    /// LIMIT RECENT DATA
    List<Surat> recent =
        dataSurat.reversed.take(4).toList();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: tambahSurat,
        child: const Icon(Icons.add),
      ),

      appBar: AppBar(
        title: const Text(
          "Arkivee",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),

      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    height: 120,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius:
                          BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment:
                              MainAxisAlignment.center,
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Surat Masuk : $masuk",
                              style: const TextStyle(
                                  color: Colors.white),
                            ),
                            Text(
                              "Surat Keluar : $keluar",
                              style: const TextStyle(
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment:
                              MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Total Surat",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${dataSurat.length}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Recently",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          final result =
                              await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  ListSuratPage(
                                      dataSurat),
                            ),
                          );

                          /// SYNC DELETE / UPDATE
                          if (result != null) {
                            setState(() {
                              dataSurat = result;
                            });
                          }
                        },
                        child: const Row(
                          mainAxisSize:
                              MainAxisSize.min,
                          children: [
                            Text("See All"),
                            SizedBox(width: 4),
                            Icon(Icons.arrow_forward,
                                size: 18),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Expanded(
                    child: ListView.builder(
                      itemCount: recent.length,
                      itemBuilder: (c, i) =>
                          SuratCard(
                              surat: recent[i]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}