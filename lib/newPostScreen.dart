import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({super.key});

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  final List<String> countries = [
    'USA',
    'Canada',
    'UK',
    'Spain',
    'France',
    'Germany',
    'Italy'
  ];

  String? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(color: Colors.grey[100]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              child: Image.asset('assets/images/images.jpeg'),
              onTap: () {
                showDialog(
                  context: context,
                  barrierColor: Color.fromARGB(200, 0, 0, 0),
                  builder: (BuildContext context) {
                    return Dialog(
                      insetPadding: EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          child: Image.asset(
                            'assets/images/images.jpeg',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            TextFormField(
              style: TextStyle(color: Colors.black),
              maxLines: 3,
              onChanged: (value) {},
              decoration: InputDecoration(
                hintText: "Add a Caption",
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              ),
            ),
            const SizedBox(height: 16),
            DropdownSearch<String>(
              items: (f, cs) => ["Item 1", 'Item 2', 'Item 3', 'Item 4'],
              popupProps: PopupProps.menu(
                  disabledItemFn: (item) => item == 'Item 3',
                  fit: FlexFit.loose),
            ),
          ],
        ),
      ),
    );
  }
}
