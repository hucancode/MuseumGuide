import 'package:flutter/material.dart';
import 'package:museum_guide/models/agenda_item.dart';
import 'agenda_list_item.dart';

class AgendaListView extends StatefulWidget {
  final List<AgendaItem> items;
  const AgendaListView({
    Key? key,
    required this.items
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AgendaListViewState(items: items);
  }
}
class AgendaListViewState extends State<AgendaListView> {
  final List<AgendaItem> items;
  AgendaListViewState({required this.items});

  void clearDoneMark()
  {
    setState(() {
      for(AgendaItem item in items)
      {
        item.isDone = false;
      }
    });
  }
  bool markAsDone({required int index, bool value = true})
  {
    if(index >= items.length)
    {
      return true;
    }
    setState(() {
      items[index].isDone = value;
    });
    return index == items.length - 1;
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return AgendaListItem(items[index]);
      },
    );
  }
}