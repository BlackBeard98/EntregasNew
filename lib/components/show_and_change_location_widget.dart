import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'show_and_change_location_model.dart';
export 'show_and_change_location_model.dart';

class ShowAndChangeLocationWidget extends StatefulWidget {
  const ShowAndChangeLocationWidget({Key? key}) : super(key: key);

  @override
  _ShowAndChangeLocationWidgetState createState() =>
      _ShowAndChangeLocationWidgetState();
}

class _ShowAndChangeLocationWidgetState
    extends State<ShowAndChangeLocationWidget> {
  late ShowAndChangeLocationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShowAndChangeLocationModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: RichText(
              textScaleFactor: MediaQuery.of(context).textScaleFactor,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: FFLocalizations.of(context).getText(
                      '5fudlg3x' /* Comprando en  */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  TextSpan(
                    text: FFAppState().MunicipalityApp.name,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: FFLocalizations.of(context).getText(
                      '7rds40ca' /*  Cambiar? */,
                    ),
                    style: TextStyle(
                      color: Color(0xFFE27C46),
                    ),
                    mouseCursor: SystemMouseCursors.click,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        setState(() {
                          FFAppState().deleteMunicipalityApp();
                          FFAppState().MunicipalityApp =
                              NameIDStruct.fromSerializableMap(
                                  jsonDecode('{\"isSet\":\"false\"}'));

                          FFAppState().deleteProvinceApp();
                          FFAppState().ProvinceApp =
                              NameIDStruct.fromSerializableMap(
                                  jsonDecode('{\"isSet\":\"false\"}'));
                        });

                        context.goNamed('SeleccionarLoc');
                      },
                  )
                ],
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
