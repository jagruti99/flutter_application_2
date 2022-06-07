import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/user_details.dart';
import 'package:http/http.dart' as http;

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List userlist = [];

  getUserList() async {
    var userresponse =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    var data = json.decode(userresponse.body);
    return data;
  }

  @override
  void initState() {
    super.initState();

    // String s = "one two";

//Removes everything after first '.'
    // String result = s.substring(0, s.indexOf(' '));
    // print(result);

    getUserList().then((data) {
      // print("DATA");
      // print(data);

      setState(() {
        userlist = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("USER LIST")),
        body: SafeArea(
            child: ListView.builder(
                itemCount: userlist.length,
                itemBuilder: (BuildContext context, int index) {
                  String s = userlist[index]['name'].toString();
                  int idx = s.indexOf(" ");
                  List parts = [
                    s.substring(0, idx).trim(),
                    s.substring(idx + 1).trim()
                  ];

                  print(parts[1].toString()[0]);
                  var f = parts[0].toString();
                  var sd = parts[1].toString()[0];

                  // print('${parts[1].toString()[0]}');
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Name : "),
                                Text(f + "  " + sd.toString()),
                                SizedBox(
                                  width: 30,
                                ),
                                Text(userlist[index]['phone']),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Email : "),
                                Text(userlist[index]['email']),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Website : "),
                                Text(userlist[index]['website']),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UserDetailsScreen(
                                                      userlist[index]['name'],
                                                      userlist[index]
                                                          ['website'],
                                                      userlist[index]['company']
                                                          ['name'],
                                                      userlist[index]['phone'],
                                                      userlist[index]['email'],
                                                      userlist[index]['address']
                                                          ['street'],
                                                      userlist[index]['address']
                                                          ['suite'],
                                                      userlist[index]['address']
                                                          ['city'],
                                                      userlist[index]['address']
                                                          ['zipcode'],
                                                      userlist[index]['address']
                                                          ['geo']['lat'],
                                                      userlist[index]['address']
                                                          ['geo']['lng'])));
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward,
                                      size: 20,
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                })));
  }
}
