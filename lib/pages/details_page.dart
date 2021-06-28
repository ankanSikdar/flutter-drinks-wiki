import 'package:drinks_wiki/repositories/repositories.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final String id;

  const DetailsPage({
    Key key,
    @required this.id,
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();
    getDrinkDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.id),
      ),
    );
  }
}
