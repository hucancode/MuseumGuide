import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:museum_guide/models/agenda_item.dart';

class DetailPage extends StatefulWidget {
  final AgendaItem item;
  DetailPage({Key? key, required this.item}) : super(key: key);

  @override
  DetailState createState() => DetailState(item: item);
}

class DetailState extends State<DetailPage> {
  AgendaItem item;
  DetailState({required this.item});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: buildAgendaList(),
    );
  }

  Future<String> readMD(BuildContext context) async {
    String response = await DefaultAssetBundle.of(context)
        .loadString('assets/docs/${item.detailDocumentPath}');
    return response;
  }

  Widget buildAgendaList() {
    return FutureBuilder(
      future: readMD(context),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Text(
              'Loading...',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          );
        }
        final content = snapshot.data??"Seems no content 😀";
        return Markdown(
          selectable: true,
          data: content,
        );
      },
    );
  }
}
