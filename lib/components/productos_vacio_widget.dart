import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'productos_vacio_model.dart';
export 'productos_vacio_model.dart';

class ProductosVacioWidget extends StatefulWidget {
  const ProductosVacioWidget({Key? key}) : super(key: key);

  @override
  _ProductosVacioWidgetState createState() => _ProductosVacioWidgetState();
}

class _ProductosVacioWidgetState extends State<ProductosVacioWidget> {
  late ProductosVacioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductosVacioModel());

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
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            Icons.sms_failed_outlined,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 50.0,
          ),
          Text(
            FFLocalizations.of(context).getText(
              'uyg67hek' /* No Hay Productos */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
          ),
        ],
      ),
    );
  }
}
