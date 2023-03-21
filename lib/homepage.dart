import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quantumitapp/loginscreen/login.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  bool _isloading = false;
  List<news> list = [];
  @override
  void initState() {
    apicalling().then((value) {
      setState(() {
        list = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("News"),
      ),
      drawer: Drawer(
        child: ListView(children: [
          ListTile(
            title: Text("Log Out"),
            leading: Icon(Icons.logout_sharp),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => login(),
                ),
              );
            },
          )
        ]),
      ),
      body:
          // ListView(
          //   children: [
          //     Expanded(
          // child:
          _isloading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  children: [
                                    Text(
                                      list[index].publish,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  list[index].title,
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
      // )
      // ],
      // ),
    );
  }
}

Future<List<news>> apicalling() async {
  List<news> list = [];
  final res = await http.get(
    Uri.parse(
        'https://newsapi.org/v2/everything?q=tesla&from=2023-02-21&sortBy=publishedAt&apiKey=068bedfc697b472298bd574c0a26db19'),
    headers: {"Content-type": "application/json"},
  );
  print(res.statusCode);
  print(res.body);
  Map<String, dynamic> response = jsonDecode(res.body);
  if (res.statusCode == 200) {
    for (var data in response["articles"]) {
      list.add(news(
          source: data["source"] == null ? "No Source" : data["source"],
          auther: data["author"] == null ? "No Auther" : data["author"],
          content: data["content"],
          desrp: data["description"],
          publish: data["publishedAt"],
          title: data["title"],
          urlimage: data["urlToImage"] == null
              ? "data:image/png;base64,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"
              : data["urlToImage"]));
    }
  } else {
    print("Fail");
  }
  print(list[0].auther);
  print(list[0].content);
  print(list[0].desrp);
  return list;
}

class news {
  late Map<String, dynamic> source;
  late String auther, title, desrp, urlimage, publish, content;
  news(
      {required this.source,
      required this.auther,
      required this.content,
      required this.desrp,
      required this.publish,
      required this.title,
      required this.urlimage});
}
