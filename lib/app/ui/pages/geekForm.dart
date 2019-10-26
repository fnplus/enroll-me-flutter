import 'package:flutter/material.dart';

class GeekForm extends StatefulWidget {
  @override
  _GeekFormState createState() => _GeekFormState();
}

class _GeekFormState extends State<GeekForm> {
  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "GEEK FORM",
          style: TextStyle(letterSpacing: 4),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              DataField(
                heading: "First Name",
              ),
              DataField(
                heading: "Middle Name",
              ),
              DataField(
                heading: "Last Name",
              ),
              DataField(
                heading: "Email ID",
              ),
              DataField(
                heading: "Phone Number",
              ),
              DataField(
                heading: "City",
              ),
              DataField(
                heading: "State",
              ),
              DataField(
                heading: "Address",
              ),
              DataField(
                heading: "Github URL",
              ),
              DataField(
                heading: "LinkedIN URL",
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: showFab
          ? FloatingActionButton.extended(
              label: Text("Geek me up"),
              onPressed: () {},
              icon: Icon(Icons.school),
            )
          : null,
    );
  }
}

class DataField extends StatelessWidget {
  final String heading;

  const DataField({Key key, this.heading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
            labelText: heading,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
