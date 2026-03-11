import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/surat_control.dart';
import '../models/card_surat.dart';
import '../models/page_header.dart';
import 'update_surat.dart';

class ListSuratPage extends StatelessWidget {
  const ListSuratPage({super.key});

  void konfirmasiDelete(controller, surat) {
    Get.defaultDialog(
      title: "Hapus Surat",
      middleText: "Apakah yakin ingin menghapus surat ini?",
      textCancel: "Batal",
      textConfirm: "Hapus",
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
      onConfirm: () {
        controller.hapus(surat);
        Get.back();
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    final controller = Get.find<SuratController>();

    return Scaffold(
      body: Column(
        children: [

          const PageHeader(title: "All Letters"),

          Expanded(
            child: Obx(() {

              if (controller.dataSurat.isEmpty) {
                return const Center(
                  child: Text("Belum ada surat"),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: controller.dataSurat.length,
                itemBuilder: (context, i) {

                  final surat = controller.dataSurat[i];

                  return SuratCard(
                    surat: surat,

                    onEdit: () {
                      Get.to(() => UpdateSuratPage(surat));
                    },

                    onDelete: () {
                      konfirmasiDelete(controller, surat);
                    },

                    onTap: () {
                      Get.to(() => UpdateSuratPage(surat));
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}