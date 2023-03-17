import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          )
        ],
        title: Text("Search Page"),
      ),
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}

class DataSearch extends SearchDelegate {
  List names = [
    "json momoa",
    "tylor swift",
    "marlyn monro",
    "lady gaga",
    "harry",
    "lebron james",
    "steve curry",
    "wide",
    "kobby brayent"
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("${query}");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List filterNames = names.where((el) => el.contains(query)).toList();

    return ListView.builder(
        itemCount: query == '' ? names.length : filterNames.length,
        itemBuilder: (context, i) {
          return InkWell(
              onTap: () {
                query = query == '' ? names[i] : filterNames[i];
                showResults(context);
              },
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: query == ''
                      ? Text(
                          "${names[i]}",
                          style: TextStyle(fontSize: 20),
                        )
                      : Text(
                          "${filterNames[i]}",
                          style: TextStyle(fontSize: 20),
                        )));
        });
  }
}
