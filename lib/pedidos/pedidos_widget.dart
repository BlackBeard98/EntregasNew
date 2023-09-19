import '/backend/api_requests/api_calls.dart';
import '/components/resumen_pedido_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pedidos_model.dart';
export 'pedidos_model.dart';

class PedidosWidget extends StatefulWidget {
  const PedidosWidget({Key? key}) : super(key: key);

  @override
  _PedidosWidgetState createState() => _PedidosWidgetState();
}

class _PedidosWidgetState extends State<PedidosWidget> {
  late PedidosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PedidosModel());

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

    return FutureBuilder<ApiCallResponse>(
      future: ShopGroup.orderallmeCall.call(
        authToken: FFAppState().authUser.accessToken,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final pedidosOrderallmeResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Color(0xFF606A85),
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              actions: [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Container(
                width: 1265.0,
                height: 678.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'tbr8hqx8' /* Pedidos */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Outfit',
                                color: Color(0xFF15161E),
                                fontSize: 24.0,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '2dbpv3u2' /* Abajo se puede observar una li... */,
                          ),
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF606A85),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 671.0,
                        constraints: BoxConstraints(
                          maxHeight: 700.0,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 24.0),
                          child: Builder(
                            builder: (context) {
                              final orders = getJsonField(
                                pedidosOrderallmeResponse.jsonBody,
                                r'''$[*]''',
                              ).toList();
                              return SingleChildScrollView(
                                primary: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(orders.length,
                                      (ordersIndex) {
                                    final ordersItem = orders[ordersIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 16.0),
                                      child: Container(
                                        width: double.infinity,
                                        constraints: BoxConstraints(
                                          maxWidth: 570.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: Color(0xFFE5E7EB),
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 12.0, 16.0, 12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 12.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () => FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.5,
                                                                    child:
                                                                        ResumenPedidoWidget(
                                                                      orderId:
                                                                          getJsonField(
                                                                        ordersItem,
                                                                        r'''$._id._id''',
                                                                      ).toString(),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        },
                                                        child: RichText(
                                                          textScaleFactor:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaleFactor,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '7l10yga2' /* Pedido #:  */,
                                                                ),
                                                                style:
                                                                    TextStyle(),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    getJsonField(
                                                                  ordersItem,
                                                                  r'''$.orderNumber''',
                                                                ).toString(),
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xFF6F61EF),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: Color(
                                                                      0xFF15161E),
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          getJsonField(
                                                            ordersItem,
                                                            r'''$.createdAt''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Color(
                                                                    0xFF606A85),
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 12.0),
                                                    child: Text(
                                                      '\$ ${getJsonField(
                                                        ordersItem,
                                                        r'''$.price''',
                                                      ).toString()}',
                                                      textAlign: TextAlign.end,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineSmall
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Color(
                                                                0xFF15161E),
                                                            fontSize: 22.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      height: 32.0,
                                                      decoration: BoxDecoration(
                                                        color: () {
                                                          if ((String status) {
                                                            return status ==
                                                                "10";
                                                          }(getJsonField(
                                                            ordersItem,
                                                            r'''$.status''',
                                                          ).toString())) {
                                                            return Color(
                                                                0xFFFFC966);
                                                          } else if ((String
                                                              status) {
                                                            return status ==
                                                                "20";
                                                          }(getJsonField(
                                                            ordersItem,
                                                            r'''$.status''',
                                                          ).toString())) {
                                                            return Color(
                                                                0xFFFFE58C);
                                                          } else if ((String
                                                              status) {
                                                            return status ==
                                                                "30";
                                                          }(getJsonField(
                                                            ordersItem,
                                                            r'''$.status''',
                                                          ).toString())) {
                                                            return Color(
                                                                0xFF9CF080);
                                                          } else if ((String
                                                              status) {
                                                            return status ==
                                                                "40";
                                                          }(getJsonField(
                                                            ordersItem,
                                                            r'''$.status''',
                                                          ).toString())) {
                                                            return Color(
                                                                0xFF85C1FF);
                                                          } else if ((String
                                                              status) {
                                                            return status ==
                                                                "50";
                                                          }(getJsonField(
                                                            ordersItem,
                                                            r'''$.status''',
                                                          ).toString())) {
                                                            return Color(
                                                                0xFFFF8080);
                                                          } else {
                                                            return Color(
                                                                0xFFFF94C3);
                                                          }
                                                        }(),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        border: Border.all(
                                                          color: () {
                                                            if ((String
                                                                status) {
                                                              return status ==
                                                                  "10";
                                                            }(getJsonField(
                                                              ordersItem,
                                                              r'''$.status''',
                                                            ).toString())) {
                                                              return Color(
                                                                  0xFFFFA500);
                                                            } else if ((String
                                                                status) {
                                                              return status ==
                                                                  "20";
                                                            }(getJsonField(
                                                              ordersItem,
                                                              r'''$.status''',
                                                            ).toString())) {
                                                              return Color(
                                                                  0xFFFFD700);
                                                            } else if ((String
                                                                status) {
                                                              return status ==
                                                                  "30";
                                                            }(getJsonField(
                                                              ordersItem,
                                                              r'''$.status''',
                                                            ).toString())) {
                                                              return Color(
                                                                  0xFF32CD32);
                                                            } else if ((String
                                                                status) {
                                                              return status ==
                                                                  "40";
                                                            }(getJsonField(
                                                              ordersItem,
                                                              r'''$.status''',
                                                            ).toString())) {
                                                              return Color(
                                                                  0xFF00BFFF);
                                                            } else if ((String
                                                                status) {
                                                              return status ==
                                                                  "50";
                                                            }(getJsonField(
                                                              ordersItem,
                                                              r'''$.status''',
                                                            ).toString())) {
                                                              return Color(
                                                                  0xFFFF0000);
                                                            } else {
                                                              return Color(
                                                                  0xFFFF1493);
                                                            }
                                                          }(),
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.00, 0.00),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Text(
                                                            () {
                                                              if ((String
                                                                  status) {
                                                                return status ==
                                                                    "10";
                                                              }(getJsonField(
                                                                ordersItem,
                                                                r'''$.status''',
                                                              ).toString())) {
                                                                return 'Pendiente';
                                                              } else if ((String
                                                                  status) {
                                                                return status ==
                                                                    "20";
                                                              }(getJsonField(
                                                                ordersItem,
                                                                r'''$.status''',
                                                              ).toString())) {
                                                                return 'Procesando';
                                                              } else if ((String
                                                                  status) {
                                                                return status ==
                                                                    "30";
                                                              }(getJsonField(
                                                                ordersItem,
                                                                r'''$.status''',
                                                              ).toString())) {
                                                                return 'Pagada';
                                                              } else if ((String
                                                                  status) {
                                                                return status ==
                                                                    "40";
                                                              }(getJsonField(
                                                                ordersItem,
                                                                r'''$.status''',
                                                              ).toString())) {
                                                                return 'Completada';
                                                              } else if ((String
                                                                  status) {
                                                                return status ==
                                                                    "50";
                                                              }(getJsonField(
                                                                ordersItem,
                                                                r'''$.status''',
                                                              ).toString())) {
                                                                return 'Cancelada';
                                                              } else {
                                                                return 'Retrasada';
                                                              }
                                                            }(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: () {
                                                                    if ((String
                                                                        status) {
                                                                      return status ==
                                                                          "10";
                                                                    }(getJsonField(
                                                                      ordersItem,
                                                                      r'''$.status''',
                                                                    ).toString())) {
                                                                      return Color(
                                                                          0xFFFFA500);
                                                                    } else if ((String status) {
                                                                      return status ==
                                                                          "20";
                                                                    }(getJsonField(
                                                                      ordersItem,
                                                                      r'''$.status''',
                                                                    ).toString())) {
                                                                      return Color(
                                                                          0xFFFFD700);
                                                                    } else if ((String status) {
                                                                      return status ==
                                                                          "30";
                                                                    }(getJsonField(
                                                                      ordersItem,
                                                                      r'''$.status''',
                                                                    ).toString())) {
                                                                      return Color(
                                                                          0xFF32CD32);
                                                                    } else if ((String status) {
                                                                      return status ==
                                                                          "40";
                                                                    }(getJsonField(
                                                                      ordersItem,
                                                                      r'''$.status''',
                                                                    ).toString())) {
                                                                      return Color(
                                                                          0xFF00BFFF);
                                                                    } else if ((String status) {
                                                                      return status ==
                                                                          "50";
                                                                    }(getJsonField(
                                                                      ordersItem,
                                                                      r'''$.status''',
                                                                    ).toString())) {
                                                                      return Color(
                                                                          0xFFFF0000);
                                                                    } else {
                                                                      return Color(
                                                                          0xFFFF1493);
                                                                    }
                                                                  }(),
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }).divide(SizedBox(height: 12.0)),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
