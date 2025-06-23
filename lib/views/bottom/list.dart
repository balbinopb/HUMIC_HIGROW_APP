
  import 'package:flutter/material.dart';
import 'package:higrow/views/dashboard/mock.dart';

class ListItems extends StatelessWidget {
  const ListItems({super.key});

  @override
  Widget build(BuildContext context) {
    List<Dummy> listItems = [
    Dummy(),
    Dummy(),
    Dummy(),
    Dummy(),
    Dummy(),
    Dummy(),
    Dummy(),
  ];
    return Column(children: listItems,);
  }
}