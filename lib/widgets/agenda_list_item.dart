import 'package:flutter/material.dart';
import 'package:museum_guide/models/agenda_item.dart';

class AgendaListItem extends StatelessWidget
{
  final AgendaItem item;
  const AgendaListItem(this.item);

  @override
  Widget build(BuildContext context) {
    if(item.isDone)
    {
      return buildLink(context);
    }
    return buildDefault(context);
  }

  Widget buildDefault(BuildContext context) {
    return ListTile(
      title: Text(
        item.title, 
        style: Theme.of(context).
          textTheme.
          headline5?.
          copyWith(color: Colors.black54),
      ),
      leading: Icon(
        Icons.circle, 
        color: Colors.lightBlueAccent,
      ),
    );
  }

  Widget buildLink(BuildContext context) {
    return ListTile(
      title: Text(
        item.title, 
        style: Theme.of(context).
          textTheme.
          headline5?.
          copyWith(color: Colors.black),
      ),
      leading: Icon(
        Icons.check_circle, 
        color: Colors.green,
      ),
      trailing: Icon(
        Icons.navigate_next, 
        color: Colors.green,
      ),
      onTap: () {
        Navigator.pushNamed(context, "/detail", arguments: item);
      },
    );
  }
}