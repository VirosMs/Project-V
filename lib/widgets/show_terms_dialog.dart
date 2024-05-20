import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';

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
    final terms = await rootBundle.loadString('assets/docs/terms.md');
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
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Markdown(
                data: _termsText,
              ),
            ),
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
    return CheckboxListTile(
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "He leído y acepto los ",
              style: DefaultTextStyle.of(context).style,
            ),
            TextSpan(
              text: "Términos y Condiciones de Privacidad",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = _showTermsDialog,
            ),
          ],
        ),
      ),
      value: widget.value,
      onChanged: widget.onChanged,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
