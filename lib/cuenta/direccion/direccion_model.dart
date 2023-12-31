import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'direccion_widget.dart' show DireccionWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DireccionModel extends FlutterFlowModel<DireccionWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for textAddress widget.
  TextEditingController? textAddressController;
  String? Function(BuildContext, String?)? textAddressControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textAddressController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
