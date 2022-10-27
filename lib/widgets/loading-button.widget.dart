import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  // const LoadingButton({super.key});
  var busy = false;
  var invert = false;
  var text = '';
  final VoidCallback func;

  LoadingButton({
    required this.busy,
    required this.invert,
    required this.text,
    required this.func,
  });

  @override
  Widget build(BuildContext context) {
    return busy
        ? Container(
            alignment: Alignment.center,
            height: 50,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          )
        : Container(
            margin: EdgeInsets.all(30),
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
                color: invert
                    ? Theme.of(context).primaryColor
                    : Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(60)),
            child: TextButton(
              child: Text(
                text,
                style: TextStyle(
                  color: invert ? Colors.white : Theme.of(context).primaryColor,
                  fontFamily: 'Big Shouldes Display',
                  fontSize: 30,
                ),
              ),
              onPressed: func,
            ),
          );
  }
}
