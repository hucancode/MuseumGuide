import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:museum_guide/models/agenda_item.dart';
import 'package:museum_guide/widgets/agenda_list_view.dart';
import 'package:museum_guide/widgets/congrats_card.dart';
import 'package:museum_guide/widgets/scrollable_backdrop.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key? key}) : super(key: key);

  @override
  MenuState createState() => MenuState();
}

class MenuState extends State<MenuPage> {
  final GlobalKey<AgendaListViewState> listRef = GlobalKey();
  final GlobalKey<CongratsCardState> congratsCardRef = GlobalKey();
  final GlobalKey<ScrollableBackdropState> backdropRef = GlobalKey();
  int progress = 0;
  int agendaItemCount = 1;

  void nextStep() {
    bool isAllDone = listRef.currentState?.markAsDone(index: progress) ?? false;
    congratsCardRef.currentState?.setStatus(isAllDone);
    progress++;
    backdropRef.currentState?.setOffset(progress/agendaItemCount);
  }

  void dismissCongratsCard()
  {
    print('dismissing congrats card');
    progress = 0;
    backdropRef.currentState?.setOffset(0);
    listRef.currentState?.clearDoneMark();
    congratsCardRef.currentState?.setStatus(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            buildBackdrop(),
            buildMainBody(),
            buildCongratsCard(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: nextStep,
          tooltip: 'Go forward',
          child: Icon(Icons.forward),
        ),
    );
  }
  
  Widget buildCongratsCard() {
    return CongratsCard(
      key: congratsCardRef, 
      onTap: () => dismissCongratsCard(),
      );
  }
  Widget buildBackdrop()
  {
    return ScrollableBackdrop(key: backdropRef, scale: 4.0,);
  }
  Widget buildMainBody() {
    return SafeArea(
      child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 120),
          Text(
            'Agenda',
            style: Theme.of(context).textTheme.headline1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'These are today\'s tour schedule. Feel free to ask question to your tour guide.',
            ),
          ),
          buildAgendaList(),
        ],
      ),
      ),
    );
  }

  Future<List<AgendaItem>> readJSON(BuildContext context) async {
    String response = await DefaultAssetBundle.of(context)
        .loadString("assets/agenda.json");
    Iterable it = json.decode(response);
    return List<AgendaItem>.from(it.map((model) => AgendaItem.fromJson(model)));
  }

  Widget buildAgendaList() {
    return FutureBuilder(
      future: readJSON(context),
      builder: (BuildContext context, AsyncSnapshot<List<AgendaItem>> snapshot) {
        if (!snapshot.hasData) {
          return Text(
            'Loading...',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          );
        }
        final items = snapshot.data??[];
        agendaItemCount = math.max(items.length, 1);
        return AgendaListView(key: listRef, items: items);
      },
    );
  }
}