import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().authUser.isLogued) {
        if (FFAppState().MunicipalityApp.isSet) {
          context.goNamed('Productos');
        }
      } else {
        context.goNamed('login');
      }
    });

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
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pop();
            },
            child: Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFF57636C),
              size: 24.0,
            ),
          ),
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                '${FFAppState().authUser.name} ${FFAppState().authUser.firstLastName}',
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFF151B1E),
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).titleSmallFamily),
                    ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 24.0, 0.0),
              child: FutureBuilder<ApiCallResponse>(
                future: ShopGroup.cartuserIdCall.call(
                  userId: FFAppState().authUser.id,
                  authToken: FFAppState().authUser.accessToken,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  final badgeCartuserIdResponse = snapshot.data!;
                  return badges.Badge(
                    badgeContent: Text(
                      ShopGroup.cartuserIdCall
                          .totalIteems(
                            badgeCartuserIdResponse.jsonBody,
                          )
                          .toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                    showBadge: true,
                    shape: badges.BadgeShape.circle,
                    badgeColor: Color(0xFFFFA500),
                    elevation: 4.0,
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    position: badges.BadgePosition.topEnd(),
                    animationType: badges.BadgeAnimationType.scale,
                    toAnimate: true,
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      buttonSize: 48.0,
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: Color(0xFF57636C),
                        size: 30.0,
                      ),
                      onPressed: () async {
                        context.pushNamed('Carrito');
                      },
                    ),
                  );
                },
              ),
            ),
          ],
          centerTitle: true,
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
                                    Flexible(
                                      child: Text(
                                        'Escoja el municipio donde va a comprar',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF14181B),
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLargeFamily),
                                            ),
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
                                      Flexible(
                                        child: Column(
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 24.0,
                                                                0.0, 0.0),
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
                                                          onChanged:
                                                              (val) async {
                                                            setState(() => _model
                                                                    .dropDownValue1 =
                                                                val);
                                                            setState(() {
                                                              FFAppState()
                                                                  .updateProvinceStruct(
                                                                (e) => e
                                                                  ..name = _model
                                                                      .dropDownValue1
                                                                  ..id = functions
                                                                      .filterJsonList(
                                                                          getJsonField(
                                                                            dropDownProvinceallResponse.jsonBody,
                                                                            r'''$[*]''',
                                                                            true,
                                                                          )!,
                                                                          _model
                                                                              .dropDownValue1)
                                                                  ..isSet =
                                                                      true,
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
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: Colors
                                                                        .black,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                          hintText:
                                                              'Seleccione...',
                                                          searchHintText:
                                                              'Search for an item...',
                                                          icon: Icon(
                                                            Icons
                                                                .keyboard_arrow_down_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                          fillColor:
                                                              Colors.white,
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 24.0,
                                                                0.0, 0.0),
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
                                                                        true,
                                                                      )!,
                                                                      FFAppState()
                                                                          .Province
                                                                          .id,
                                                                      e.toString()))
                                                              .toList(),
                                                          onChanged:
                                                              (val) async {
                                                            setState(() => _model
                                                                    .dropDownValue2 =
                                                                val);
                                                            setState(() {
                                                              FFAppState()
                                                                  .updateMunicipalityStruct(
                                                                (e) => e
                                                                  ..name = _model
                                                                      .dropDownValue2
                                                                  ..id = functions
                                                                      .filterJsonList(
                                                                          getJsonField(
                                                                            dropDownMunicipalityallResponse.jsonBody,
                                                                            r'''$[*]''',
                                                                            true,
                                                                          )!,
                                                                          _model
                                                                              .dropDownValue2)
                                                                  ..isSet =
                                                                      true,
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
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: Colors
                                                                        .black,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                          hintText:
                                                              'Seleccione...',
                                                          searchHintText:
                                                              'Search for an item...',
                                                          icon: Icon(
                                                            Icons
                                                                .keyboard_arrow_down_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                          fillColor:
                                                              Colors.white,
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
                                                          disabled:
                                                              !FFAppState()
                                                                  .Province
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 24.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: !FFAppState()
                                                        .Municipality
                                                        .isSet
                                                    ? null
                                                    : () async {
                                                        setState(() {
                                                          FFAppState()
                                                              .updateProvinceAppStruct(
                                                            (e) => e
                                                              ..name =
                                                                  FFAppState()
                                                                      .Province
                                                                      .name
                                                              ..id =
                                                                  FFAppState()
                                                                      .Province
                                                                      .id
                                                              ..isSet = true,
                                                          );
                                                          FFAppState()
                                                              .updateMunicipalityAppStruct(
                                                            (e) => e
                                                              ..name = FFAppState()
                                                                  .Municipality
                                                                  .name
                                                              ..id = FFAppState()
                                                                  .Municipality
                                                                  .id
                                                              ..isSet = true,
                                                          );
                                                        });

                                                        context.goNamed(
                                                            'Productos');
                                                      },
                                                text: 'Avanzar a Comprar',
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFFE27C46),
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                            color: Colors.white,
                                                            useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                .containsKey(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmallFamily),
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
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
