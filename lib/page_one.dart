import 'package:apps_project/page_two.dart';
import 'package:apps_project/widget.dart';
import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
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
  var _isLoading = false;

  void _onSubmit() {
    setState(() => _isLoading = true);
    Future.delayed(
      const Duration(seconds: 2),
      () => setState(
        () {
          _isLoading = false;
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
    );
  }

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
                        "submit data",
                        "submit",
                        () => _isLoading ? null : _onSubmit,
                        _isLoading,
                        _onSubmit,
                        "SUBMIT"),
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
