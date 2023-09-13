import 'package:apps_project/page_two.dart';
import 'package:apps_project/widget.dart';
import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  PageOne({super.key});

  var nameController = TextEditingController();

  var campusController = TextEditingController();

  var majorController = TextEditingController();

  final List<String> items = <String>[
    "Teknik Informatika",
    "Teknik Mesin",
    "Ekonomi",
    "Manajemen Bisnis"
  ];

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              margin: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text("Masukkan nama anda"),
                    const SizedBox(height: 20),
                    texfield(nameController, "Nama"),
                    const SizedBox(height: 20),
                    text("Masukkan nama kampus anda"),
                    const SizedBox(height: 20),
                    texfield(campusController, "Kampus"),
                    const SizedBox(height: 20),
                    text("Jurusan"),
                    const SizedBox(height: 20),
                    DropdownMenu(
                      controller: majorController,
                      hintText: "Pilih jurusan",
                      dropdownMenuEntries:
                          items.map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry<String>(
                          value: value,
                          label: value,
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                    button(
                      "submit",
                      "submit",
                      () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PageTwo(
                                name: nameController.text,
                                campus: campusController.text,
                                major: majorController.text,
                              ),
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Data tersimpan')),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
