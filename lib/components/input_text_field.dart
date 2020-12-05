import 'package:flutter/material.dart';

import '../app_theme.dart';

class InputTextField extends StatefulWidget {
  final TextInputType inputType;
  final String label;
  final bool passwordText;
  final Function(String) changeValue;
  final String errorText;
  final bool one;

  InputTextField(
      {this.inputType,
        this.label,
        this.passwordText,
        this.changeValue,
        this.errorText,
        this.one});

  @override
  _InputTextFieldState createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  FocusNode focusNode = new FocusNode();
  String value;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(onOnFocusNodeEvent);
    if (widget.one) {
      Future.delayed(const Duration(milliseconds: 100), () {
        WidgetsBinding.instance.addPostFrameCallback(
                (_) => FocusScope.of(context).requestFocus(focusNode));
      });
    }
  }

  onOnFocusNodeEvent() {
    setState(() {});
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    final user = InheritedModel.inheritFrom<Vendor>(context, aspect: 'one');

    String _name;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            TextFormField(
              obscureText: widget.passwordText,
              keyboardType: widget.inputType,
              focusNode: focusNode,
              style: eTextField,
              cursorColor: AppTheme.lightAccent,
              decoration: new InputDecoration(
                labelText: '${widget.label}',
                labelStyle: widget.errorText != null
                    ? eLabelError
                    : focusNode.hasFocus ? eLabelFocused : eLabel,
                enabledBorder: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color:
                    widget.errorText != null ? Colors.red : Colors.black54,
                  ),
                ),
                focusedBorder: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: widget.errorText != null
                        ? Colors.red
                        : AppTheme.lightAccent,
                    width: 1.5,
                  ),
                ),
              ),
              onChanged: (val) => widget.changeValue(val),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                child: Text(
                  widget.errorText == null ? '' : widget.errorText,
                  style: eWarning,
                ),
              ),
            ),
          ],
        ));
  }
}
