import 'package:flutter/material.dart';

class PopupDialog {
  static Future<bool?> questionShow(
    BuildContext context,
    String question,
    String yesLabel,
    String noLabel, {
    String subQuestion = '',
  }) => show(
    context,
    (BuildContext context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(question, textAlign: TextAlign.center),
        if (subQuestion.isNotEmpty) ...[
          SizedBox(height: 8.0),
          Text(
            subQuestion,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ],
        SizedBox(height: 8.0),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(noLabel),
        ),
        SizedBox(height: 8.0),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(yesLabel),
        ),
      ],
    ),
  );

  static Future<bool?> show(BuildContext context, Widget Function(BuildContext) builder) => showDialog<bool?>(
    context: context,
    useRootNavigator: true,
    useSafeArea: true,
    barrierDismissible: false,
    builder:
        (BuildContext context) => Dialog(
          backgroundColor: Colors.white,
          insetPadding: EdgeInsets.symmetric(horizontal: 16.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: Padding(padding: EdgeInsets.all(16.0), child: builder(context)),
        ),
  );
}
