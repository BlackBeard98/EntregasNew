import '/backend/api_requests/api_calls.dart';
import '/components/productos_vacio_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'carrito_widget.dart' show CarritoWidget;
import 'package:badges/badges.dart' as badges;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CarritoModel extends FlutterFlowModel<CarritoWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (cartitemscleancartId)] action in Button widget.
  ApiCallResponse? apiResulti2d;
  // Stores action output result for [Backend Call - API (cartitemsaddproduct)] action in Text widget.
  ApiCallResponse? apiResulti84;
  // Stores action output result for [Backend Call - API (order)] action in Button widget.
  ApiCallResponse? apiResult8m0;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
