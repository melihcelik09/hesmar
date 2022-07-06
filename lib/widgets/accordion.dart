import 'package:flutter/material.dart';

class Accordion extends StatefulWidget {
  final List list;
  const Accordion({Key? key, required this.list}) : super(key: key);

  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  List expandedList = [];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 175,
      child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  ListTile(
                      title: Text(widget.list[index]['month']),
                      trailing: IconButton(
                        icon: Icon(expandedList.contains(index)
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down),
                        onPressed: () {
                          setState(() {
                            expandedList.contains(index)
                                ? expandedList.remove(index)
                                : expandedList.add(index);
                          });
                        },
                      )),
                  expandedList.contains(index)
                      ? Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              ListTile(
                                leading: const Icon(Icons.arrow_forward_ios),
                                title: Text(widget.list[index]['current']),
                              ),
                              ListTile(
                                leading: const Icon(Icons.arrow_forward_ios),
                                title: Text(widget.list[index]['pred']),
                              ),
                            ],
                          ),
                        )
                      : Container()
                ],
              ),
            );
          },
          itemCount: widget.list.length),
    );
  }
}
