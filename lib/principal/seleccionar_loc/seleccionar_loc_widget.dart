import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'seleccionar_loc_model.dart';
export 'seleccionar_loc_model.dart';

class SeleccionarLocWidget extends StatefulWidget {
  const SeleccionarLocWidget({Key? key}) : super(key: key);

  @override
  _SeleccionarLocWidgetState createState() => _SeleccionarLocWidgetState();
}

class _SeleccionarLocWidgetState extends State<SeleccionarLocWidget> {
  late SeleccionarLocModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SeleccionarLocModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 0.0, 6.0),
            child: Container(
              width: 44.0,
              height: 44.0,
              decoration: BoxDecoration(
                color: Color(0x4D9489F5),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xFFE8A479),
                  width: 2.0,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.network(
                    'https://picsum.photos/seed/626/600',
                    width: 300.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          title: Text(
            FFAppState().authUser.name,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Color(0xFF15161E),
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 20.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.notifications_none,
                  color: Color(0xFF15161E),
                  size: 24.0,
                ),
                onPressed: () async {
                  context.pushNamed('Carrito');
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 24.0),
                    child: Wrap(
                      spacing: 16.0,
                      runSpacing: 16.0,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).width >= 1280.0
                                ? (MediaQuery.sizeOf(context).width * 0.5)
                                : MediaQuery.sizeOf(context).width,
                            600.0,
                          ),
                          height: 300.0,
                          constraints: BoxConstraints(
                            maxWidth: 430.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.network(
                              'https://picsum.photos/seed/665/600',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          width: valueOrDefault<double>(
                            MediaQuery.sizeOf(context).width >= 1280.0
                                ? (MediaQuery.sizeOf(context).width * 0.5)
                                : MediaQuery.sizeOf(context).width,
                            600.0,
                          ),
                          height: 300.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '9tlffo20' /* Escoja el municipio donde va a... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Color(0xFF14181B),
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 24.0, 0.0, 0.0),
                                                  child: FutureBuilder<
                                                      ApiCallResponse>(
                                                    future: ShopGroup
                                                        .provinceallCall
                                                        .call(
                                                      authToken: FFAppState()
                                                          .authUser
                                                          .accessToken,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final dropDownProvinceallResponse =
                                                          snapshot.data!;
                                                      return FlutterFlowDropDown<
                                                          String>(
                                                        controller: _model
                                                                .dropDownValueController1 ??=
                                                            FormFieldController<
                                                                String>(null),
                                                        options: (ShopGroup
                                                                .provinceallCall
                                                                .names(
                                                          dropDownProvinceallResponse
                                                              .jsonBody,
                                                        ) as List)
                                                            .map<String>((s) =>
                                                                s.toString())
                                                            .toList()!
                                                            .map((e) =>
                                                                e.toString())
                                                            .toList(),
                                                        onChanged: (val) async {
                                                          setState(() => _model
                                                                  .dropDownValue1 =
                                                              val);
                                                          setState(() {
                                                            _model
                                                                .updateProvinceStruct(
                                                              (e) => e
                                                                ..name = _model
                                                                    .dropDownValue1
                                                                ..id = functions
                                                                    .filterJsonList(
                                                                        getJsonField(
                                                                          dropDownProvinceallResponse
                                                                              .jsonBody,
                                                                          r'''$[*]''',
                                                                        )!,
                                                                        _model
                                                                            .dropDownValue1)
                                                                ..isSet = true,
                                                            );
                                                          });
                                                        },
                                                        width: 300.0,
                                                        height: 50.0,
                                                        searchHintTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                        hintText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'wd4yximc' /* Please select... */,
                                                        ),
                                                        searchHintText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'gk9trten' /* Search for an item... */,
                                                        ),
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        fillColor: Colors.white,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        borderWidth: 2.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    4.0,
                                                                    16.0,
                                                                    4.0),
                                                        hidesUnderline: true,
                                                        isSearchable: true,
                                                        isMultiSelect: false,
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 24.0, 0.0, 0.0),
                                                  child: FutureBuilder<
                                                      ApiCallResponse>(
                                                    future: ShopGroup
                                                        .municipalityallCall
                                                        .call(
                                                      authToken: FFAppState()
                                                          .authUser
                                                          .accessToken,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final dropDownMunicipalityallResponse =
                                                          snapshot.data!;
                                                      return FlutterFlowDropDown<
                                                          String>(
                                                        controller: _model
                                                                .dropDownValueController2 ??=
                                                            FormFieldController<
                                                                String>(null),
                                                        options: (ShopGroup
                                                                .municipalityallCall
                                                                .names(
                                                          dropDownMunicipalityallResponse
                                                              .jsonBody,
                                                        ) as List)
                                                            .map<String>((s) =>
                                                                s.toString())
                                                            .toList()!
                                                            .where((e) => functions
                                                                .newCustomFunction(
                                                                    getJsonField(
                                                                      dropDownMunicipalityallResponse
                                                                          .jsonBody,
                                                                      r'''$[*]''',
                                                                    )!,
                                                                    FFAppState()
                                                                        .Provincia
                                                                        .id,
                                                                    e
                                                                        .toString()))
                                                            .toList()
                                                            .map((e) =>
                                                                e.toString())
                                                            .toList(),
                                                        onChanged: (val) async {
                                                          setState(() => _model
                                                                  .dropDownValue2 =
                                                              val);
                                                          setState(() {
                                                            _model
                                                                .updateMunicipalityStruct(
                                                              (e) => e
                                                                ..name = _model
                                                                    .dropDownValue2
                                                                ..id = functions
                                                                    .filterJsonList(
                                                                        getJsonField(
                                                                          dropDownMunicipalityallResponse
                                                                              .jsonBody,
                                                                          r'''$[*]''',
                                                                        )!,
                                                                        _model
                                                                            .dropDownValue2)
                                                                ..isSet = true,
                                                            );
                                                          });
                                                        },
                                                        width: 300.0,
                                                        height: 50.0,
                                                        searchHintTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                        hintText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'v89k8mn4' /* Please select... */,
                                                        ),
                                                        searchHintText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '3667ots8' /* Search for an item... */,
                                                        ),
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        fillColor: Colors.white,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        borderWidth: 2.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    4.0,
                                                                    16.0,
                                                                    4.0),
                                                        hidesUnderline: true,
                                                        disabled: !FFAppState()
                                                            .Provincia
                                                            .isSet,
                                                        isSearchable: true,
                                                        isMultiSelect: false,
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 24.0, 0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: _model.municipality!
                                                      .hasIsSet()
                                                  ? null
                                                  : () async {
                                                      context
                                                          .goNamed('Productos');
                                                    },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'pz3xaj2p' /* Ir a comprar */,
                                              ),
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
