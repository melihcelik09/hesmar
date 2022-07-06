import 'package:flutter/material.dart';
import 'package:hesmar/screens/new_detail_page.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController search = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        controller: search,
        onSubmitted: (value) {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => SearchFind(
          //               searchText: search.text,
          //             )));
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailPage(
                        path: '',
                        searchText: search.text,
                        barcode: '',
                      )));
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          prefixIcon: Icon(Icons.search),
          hintText: 'Neye ihtiyacın var?',
        ),
      ),
    );
  }
}
