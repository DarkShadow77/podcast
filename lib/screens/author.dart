import 'package:flutter/material.dart';

import '../AuthorPage/body.dart';

class AuthorPage extends StatefulWidget {
  const AuthorPage({Key? key}) : super(key: key);

  @override
  State<AuthorPage> createState() => _AuthorPageState();
}

class _AuthorPageState extends State<AuthorPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Body(),
      ),
    );
  }
}
