// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:quill_html_editor/quill_html_editor.dart';
import '/custom_code/actions/declare_global_keys.dart';
import '/custom_code/widgets/quill_editor.dart';

Future setTextQuillEditor(
  String? contentToSet,
  String editorKeyValue,
) async {
  GlobalKey<QuillEditorState>? thisWidgetKey = editorKeys[editorKeyValue];

  if (thisWidgetKey?.currentState != null && contentToSet != null) {
    thisWidgetKey!.currentState!.controller!.setText(contentToSet);
  } else {
    // Handle the error appropriately; this is just an example.
    throw Exception(
        "The GlobalKey for editorKeyValue: $editorKeyValue is not available or the text to set is empty");
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
