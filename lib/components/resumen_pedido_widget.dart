import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'resumen_pedido_model.dart';
export 'resumen_pedido_model.dart';

class ResumenPedidoWidget extends StatefulWidget {
  const ResumenPedidoWidget({
    Key? key,
    required this.orderId,
  }) : super(key: key);

  final String? orderId;

  @override
  _ResumenPedidoWidgetState createState() => _ResumenPedidoWidgetState();
}

class _ResumenPedidoWidgetState extends State<ResumenPedidoWidget> {
  late ResumenPedidoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResumenPedidoModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
      child: FutureBuilder<ApiCallResponse>(
        future: ShopGroup.orderidCall.call(
          id: widget.orderId,
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
          final checkoutBottomSheetOrderidResponse = snapshot.data!;
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0x25090F13),
                  offset: Offset(0.0, 2.0),
                )
              ],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60.0,
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFF1F4F8),
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'z5522vtj' /* Resumen del Pedido: */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Outfit',
                                color: Color(0xFF14181B),
                                fontSize: 24.0,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: Text(
                          '\$ ${ShopGroup.orderidCall.orderNumber(
                                checkoutBottomSheetOrderidResponse.jsonBody,
                              ).toString()}',
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Color(0xFF14181B),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: RichText(
                          textScaleFactor:
                              MediaQuery.of(context).textScaleFactor,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'ong6fwew' /* Creación  */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              TextSpan(
                                text: getJsonField(
                                  checkoutBottomSheetOrderidResponse.jsonBody,
                                  r'''$.createdAt''',
                                ).toString(),
                                style: TextStyle(),
                              )
                            ],
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 8.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'dyi626o1' /* Revise su orden */,
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            color: Color(0xFF57636C),
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  Divider(
                    height: 24.0,
                    thickness: 2.0,
                    color: Color(0xFFE0E3E7),
                  ),
                  Builder(
                    builder: (context) {
                      final items = ShopGroup.orderidCall
                              .items(
                                checkoutBottomSheetOrderidResponse.jsonBody,
                              )
                              ?.toList() ??
                          [];
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: items.length,
                        itemBuilder: (context, itemsIndex) {
                          final itemsItem = items[itemsIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: FutureBuilder<ApiCallResponse>(
                              future: ShopGroup.productidCall.call(
                                id: getJsonField(
                                  itemsItem,
                                  r'''$.productId._id''',
                                ).toString(),
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                final containerProductidResponse =
                                    snapshot.data!;
                                return Container(
                                  width: double.infinity,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: Color(0xFFE0E3E7),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 8.0, 12.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            functions.getImages(getJsonField(
                                              containerProductidResponse
                                                  .jsonBody,
                                              r'''$.images''',
                                            )!),
                                            width: 40.0,
                                            height: 40.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  getJsonField(
                                                    itemsItem,
                                                    r'''$.productName''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            Color(0xFF14181B),
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Cantidad: ${getJsonField(
                                                        itemsItem,
                                                        r'''$.quantity''',
                                                      ).toString()}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Plus Jakarta Sans',
                                                                color: Color(
                                                                    0xFF57636C),
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Text(
                                          getJsonField(
                                            containerProductidResponse.jsonBody,
                                            r'''$.price''',
                                          ).toString(),
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: Color(0xFF14181B),
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 16.0, 24.0, 4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'pj860l4g' /* Desglose */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Color(0xFF14181B),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 4.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'pi9003jq' /* Precio */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Color(0xFF57636C),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            Text(
                              '\$ ${getJsonField(
                                checkoutBottomSheetOrderidResponse.jsonBody,
                                r'''$.price''',
                              ).toString()}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Color(0xFF14181B),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 4.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'bu1l0kev' /* Estado */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Color(0xFF57636C),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            Container(
                              height: 32.0,
                              decoration: BoxDecoration(
                                color: () {
                                  if ((String status) {
                                    return status == "10";
                                  }(ShopGroup.orderidCall
                                      .status(
                                        checkoutBottomSheetOrderidResponse
                                            .jsonBody,
                                      )
                                      .toString())) {
                                    return Color(0xFFFFC966);
                                  } else if ((String status) {
                                    return status == "20";
                                  }(ShopGroup.orderidCall
                                      .status(
                                        checkoutBottomSheetOrderidResponse
                                            .jsonBody,
                                      )
                                      .toString())) {
                                    return Color(0xFFFFE58C);
                                  } else if ((String status) {
                                    return status == "30";
                                  }(ShopGroup.orderidCall
                                      .status(
                                        checkoutBottomSheetOrderidResponse
                                            .jsonBody,
                                      )
                                      .toString())) {
                                    return Color(0xFF9CF080);
                                  } else if ((String status) {
                                    return status == "40";
                                  }(ShopGroup.orderidCall
                                      .status(
                                        checkoutBottomSheetOrderidResponse
                                            .jsonBody,
                                      )
                                      .toString())) {
                                    return Color(0xFF85C1FF);
                                  } else if ((String status) {
                                    return status == "50";
                                  }(ShopGroup.orderidCall
                                      .status(
                                        checkoutBottomSheetOrderidResponse
                                            .jsonBody,
                                      )
                                      .toString())) {
                                    return Color(0xFFFF8080);
                                  } else {
                                    return Color(0xFFFF94C3);
                                  }
                                }(),
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: () {
                                    if ((String status) {
                                      return status == "10";
                                    }(ShopGroup.orderidCall
                                        .status(
                                          checkoutBottomSheetOrderidResponse
                                              .jsonBody,
                                        )
                                        .toString())) {
                                      return Color(0xFFFFA500);
                                    } else if ((String status) {
                                      return status == "20";
                                    }(ShopGroup.orderidCall
                                        .status(
                                          checkoutBottomSheetOrderidResponse
                                              .jsonBody,
                                        )
                                        .toString())) {
                                      return Color(0xFFFFD700);
                                    } else if ((String status) {
                                      return status == "30";
                                    }(ShopGroup.orderidCall
                                        .status(
                                          checkoutBottomSheetOrderidResponse
                                              .jsonBody,
                                        )
                                        .toString())) {
                                      return Color(0xFF32CD32);
                                    } else if ((String status) {
                                      return status == "40";
                                    }(ShopGroup.orderidCall
                                        .status(
                                          checkoutBottomSheetOrderidResponse
                                              .jsonBody,
                                        )
                                        .toString())) {
                                      return Color(0xFF00BFFF);
                                    } else if ((String status) {
                                      return status == "50";
                                    }(ShopGroup.orderidCall
                                        .status(
                                          checkoutBottomSheetOrderidResponse
                                              .jsonBody,
                                        )
                                        .toString())) {
                                      return Color(0xFFFF0000);
                                    } else {
                                      return Color(0xFFFF1493);
                                    }
                                  }(),
                                  width: 2.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.00, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Text(
                                    () {
                                      if ((String status) {
                                        return status == "10";
                                      }(ShopGroup.orderidCall
                                          .status(
                                            checkoutBottomSheetOrderidResponse
                                                .jsonBody,
                                          )
                                          .toString())) {
                                        return 'Pendiente';
                                      } else if ((String status) {
                                        return status == "20";
                                      }(ShopGroup.orderidCall
                                          .status(
                                            checkoutBottomSheetOrderidResponse
                                                .jsonBody,
                                          )
                                          .toString())) {
                                        return 'Procesando';
                                      } else if ((String status) {
                                        return status == "30";
                                      }(ShopGroup.orderidCall
                                          .status(
                                            checkoutBottomSheetOrderidResponse
                                                .jsonBody,
                                          )
                                          .toString())) {
                                        return 'Pagada';
                                      } else if ((String status) {
                                        return status == "40";
                                      }(ShopGroup.orderidCall
                                          .status(
                                            checkoutBottomSheetOrderidResponse
                                                .jsonBody,
                                          )
                                          .toString())) {
                                        return 'Completada';
                                      } else if ((String status) {
                                        return status == "50";
                                      }(ShopGroup.orderidCall
                                          .status(
                                            checkoutBottomSheetOrderidResponse
                                                .jsonBody,
                                          )
                                          .toString())) {
                                        return 'Cancelada';
                                      } else {
                                        return 'Retrasada';
                                      }
                                    }(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: () {
                                            if ((String status) {
                                              return status == "10";
                                            }(ShopGroup.orderidCall
                                                .status(
                                                  checkoutBottomSheetOrderidResponse
                                                      .jsonBody,
                                                )
                                                .toString())) {
                                              return Color(0xFFFFA500);
                                            } else if ((String status) {
                                              return status == "20";
                                            }(ShopGroup.orderidCall
                                                .status(
                                                  checkoutBottomSheetOrderidResponse
                                                      .jsonBody,
                                                )
                                                .toString())) {
                                              return Color(0xFFFFD700);
                                            } else if ((String status) {
                                              return status == "30";
                                            }(ShopGroup.orderidCall
                                                .status(
                                                  checkoutBottomSheetOrderidResponse
                                                      .jsonBody,
                                                )
                                                .toString())) {
                                              return Color(0xFF32CD32);
                                            } else if ((String status) {
                                              return status == "40";
                                            }(ShopGroup.orderidCall
                                                .status(
                                                  checkoutBottomSheetOrderidResponse
                                                      .jsonBody,
                                                )
                                                .toString())) {
                                              return Color(0xFF00BFFF);
                                            } else if ((String status) {
                                              return status == "50";
                                            }(ShopGroup.orderidCall
                                                .status(
                                                  checkoutBottomSheetOrderidResponse
                                                      .jsonBody,
                                                )
                                                .toString())) {
                                              return Color(0xFFFF0000);
                                            } else {
                                              return Color(0xFFFF1493);
                                            }
                                          }(),
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 4.0, 24.0, 24.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'r05yiboj' /* Precio Final */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Color(0xFF57636C),
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 36.0,
                                  icon: Icon(
                                    Icons.info_outlined,
                                    color: Color(0xFF57636C),
                                    size: 18.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ],
                            ),
                            Text(
                              '\$ ${getJsonField(
                                checkoutBottomSheetOrderidResponse.jsonBody,
                                r'''$.finalPrice''',
                              ).toString()}',
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF14181B),
                                    fontSize: 36.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
