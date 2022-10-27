import 'package:alcoolougas/widgets/input.widget.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'loading-button.widget.dart';

class SubmitForm extends StatelessWidget {
  var gasController = new MoneyMaskedTextController();
  var alcController = new MoneyMaskedTextController();
  var busy = false;
  final VoidCallback submitFunc;

  SubmitForm({
    required this.gasController,
    required this.alcController,
    required this.busy,
    required this.submitFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Input(
            label: 'Gasolina',
            controller: gasController,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Input(
            label: 'Álcool',
            controller: alcController,
          ),
        ),
        SizedBox(
          height: 25,
        ),
        LoadingButton(
          busy: busy,
          invert: false,
          text: 'CALCULAR',
          func: submitFunc,
        ),
      ],
    );
  }
}
