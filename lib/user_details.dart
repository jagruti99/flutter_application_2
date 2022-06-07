import 'package:flutter/material.dart';

class UserDetailsScreen extends StatefulWidget {
  final String name, webs, cname, phn, mail, street, suit, city, zip, lat, lan;

  UserDetailsScreen(this.name, this.webs, this.cname, this.phn, this.mail,
      this.street, this.suit, this.city, this.zip, this.lat, this.lan);
  // const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name.toString()),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Text(widget.name.toString()),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Address :"),
                  SizedBox(
                    height: 5,
                  ),
                  Text(widget.street.toString() +
                      " ," +
                      widget.suit.toString() +
                      " ," +
                      widget.city.toString() +
                      "\n" +
                      widget.zip.toString()),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.mail.toString()),
                      Text(widget.phn.toString())
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Company :"),
                  Text(widget.cname.toString()),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Website :"),
                  Text(widget.webs.toString()),
                  Divider(
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Location :"),
                  Text(widget.lat.toString() + "\n" + widget.lan.toString()),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
