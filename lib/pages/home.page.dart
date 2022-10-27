import 'package:alcoolougas/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import '../widgets/logo.widget.dart';
import '../widgets/submit-form.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.lightBlue;
  var _gasController = new MoneyMaskedTextController();
  var _alcController = new MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  var _resultText = 'Compensa utilizar álcool';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: Duration(
          milliseconds: 1200,
        ),
        color: _color,
        child: ListView(
          children: <Widget>[
            Logo(),
            _completed
                ? Success(result: _resultText, reset: reset)
                : SubmitForm(
                    gasController: _gasController,
                    alcController: _alcController,
                    busy: _busy,
                    submitFunc: calculate,
                  )
          ],
        ),
      ),
    );
  }

  Future calculate() {
    double alc =
        double.parse(_alcController.text.replaceAll(new RegExp(r'[,.]'), '')) /
            100;
    double gas =
        double.parse(_gasController.text.replaceAll(new RegExp(r'[,.]'), '')) /
            100;
    double res = alc / gas;

    setState(() {
      _completed = false;
      _busy = true;
    });
    return new Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        if (alc == 0.00 || gas == 0.00) {
          _color = Colors.orangeAccent;
          _resultText = 'Todos os campos devem ser preenchidos!';
          _completed = true;
          _busy = false;
        } else {
          if (res >= 0.7) {
            _color = Colors.redAccent;
            _resultText = 'Compensa utilizar Gasolina!';
          } else {
            _color = Colors.lightGreen;
            _resultText = 'Compensa utilizar Álcool!';
          }
          _completed = true;
          _busy = false;
        }
      });
    });
  }

  reset() {
    setState(() {
      _color = Theme.of(context).primaryColor;
      _alcController = new MoneyMaskedTextController();
      _gasController = new MoneyMaskedTextController();
      _completed = false;
      _busy = false;
    });
  }
}
