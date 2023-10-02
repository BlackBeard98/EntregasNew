import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'editar_peril_widget.dart' show EditarPerilWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditarPerilModel extends FlutterFlowModel<EditarPerilWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for name widget.
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for apellido1 widget.
  TextEditingController? apellido1Controller;
  String? Function(BuildContext, String?)? apellido1ControllerValidator;
  // State field(s) for apellido2 widget.
  TextEditingController? apellido2Controller;
  String? Function(BuildContext, String?)? apellido2ControllerValidator;
  // Stores action output result for [Backend Call - API (usersupdateuserme)] action in Button widget.
  ApiCallResponse? apiResultsUpdate;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    nameController?.dispose();
    apellido1Controller?.dispose();
    apellido2Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
