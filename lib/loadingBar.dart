import 'package:flutter/material.dart';

class LoadingBar extends StatelessWidget {
  final double opac;
  LoadingBar({this.opac});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: opac,
          child: new CircularProgressIndicator(
            backgroundColor: Colors.orangeAccent,
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange[900]),
          ),
        ),
      ),
    );
  }
}
