import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class TermsAndConditions extends StatefulWidget {
  final bool value;
  final Function(bool?) onChanged;

  const TermsAndConditions({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  String _termsText = "";


  @override
  void initState() {
    super.initState();
    _loadTerms();
  }

  Future<void> _loadTerms() async {
    final terms = await rootBundle.loadString('assets/docs/terms.txt');
    setState(() {
      _termsText = terms;
    });
  }

  void _showTermsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Términos y Condiciones de Privacidad"),
          content: SingleChildScrollView(
            child: Text(_termsText),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Cerrar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckboxListTile(
          title: Text(
              "He leído y acepto los Términos y Condiciones de Privacidad"),
          value: widget.value,
          onChanged: widget.onChanged,
          controlAffinity: ListTileControlAffinity.leading,
        ),
        TextButton(
          onPressed: _showTermsDialog,
          child: Text("Ver Términos y Condiciones"),
        ),
      ],
    );
  }
}
