import '/backend/api_requests/api_calls.dart';
import '/components/productos_vacio_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:badges/badges.dart' as badges;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'carrito_model.dart';
export 'carrito_model.dart';

class CarritoWidget extends StatefulWidget {
  const CarritoWidget({Key? key}) : super(key: key);

  @override
  _CarritoWidgetState createState() => _CarritoWidgetState();
}

class _CarritoWidgetState extends State<CarritoWidget> {
  late CarritoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarritoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().authUser.isLogued) {
        if (!FFAppState().MunicipalityApp.isSet) {
          context.goNamed('SeleccionarLoc');
        }
      } else {
        context.pushNamed('login');
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

    return FutureBuilder<ApiCallResponse>(
      future: ShopGroup.cartuserIdCall.call(
        userId: FFAppState().authUser.id,
        authToken: FFAppState().authUser.accessToken,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFF1F4F8),
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
        final carritoCartuserIdResponse = snapshot.data!;
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFFF1F4F8),
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
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
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Plus Jakarta Sans',
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                        showBadge: true,
                        shape: badges.BadgeShape.circle,
                        badgeColor: Color(0xFFFFA500),
                        elevation: 4.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
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
            body: Align(
              alignment: AlignmentDirectional(0.00, -1.00),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 24.0),
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
                            constraints: BoxConstraints(
                              maxWidth: 750.0,
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
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 16.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: ShopGroup.municipalityallCall.call(
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
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final columnMunicipalityallResponse =
                                      snapshot.data!;
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (ShopGroup.cartuserIdCall
                                              .municipalityId(
                                                carritoCartuserIdResponse
                                                    .jsonBody,
                                              )
                                              .toString() !=
                                          ("null"))
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            if (ShopGroup.cartuserIdCall
                                                    .municipalityId(
                                                      carritoCartuserIdResponse
                                                          .jsonBody,
                                                    )
                                                    .toString() !=
                                                ("null"))
                                              Flexible(
                                                child: Text(
                                                  'Su Carrito está en: ${functions.getMunicipalityNameByID(ShopGroup.cartuserIdCall.municipalityId(
                                                        carritoCartuserIdResponse
                                                            .jsonBody,
                                                      ).toString(), ShopGroup.municipalityallCall.all(
                                                        columnMunicipalityallResponse
                                                            .jsonBody,
                                                      )!.toList())}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF14181B),
                                                        fontSize: 22.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeFamily),
                                                      ),
                                                ),
                                              ),
                                            Flexible(
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  _model.apiResulti2d =
                                                      await ShopGroup
                                                          .cartitemscleancartIdCall
                                                          .call(
                                                    cartId:
                                                        ShopGroup.cartuserIdCall
                                                            .id(
                                                              carritoCartuserIdResponse
                                                                  .jsonBody,
                                                            )
                                                            .toString(),
                                                    authToken: FFAppState()
                                                        .authUser
                                                        .accessToken,
                                                  );
                                                  if ((_model.apiResulti2d
                                                          ?.succeeded ??
                                                      true)) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Carrito Eliminado con éxito',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Algo salió mal',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            Color(0x59E27C46),
                                                      ),
                                                    );
                                                  }

                                                  setState(() {});
                                                },
                                                text: 'Eliminar',
                                                icon: Icon(
                                                  Icons
                                                      .remove_shopping_cart_outlined,
                                                  size: 15.0,
                                                ),
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 12.0),
                                        child: Text(
                                          'Abajo esta la lista de items de su carrito',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: Color(0xFF57636C),
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMediumFamily),
                                              ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 289.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Builder(
                                          builder: (context) {
                                            final cartItems =
                                                ShopGroup.cartuserIdCall
                                                        .cartItems(
                                                          carritoCartuserIdResponse
                                                              .jsonBody,
                                                        )
                                                        ?.toList() ??
                                                    [];
                                            if (cartItems.isEmpty) {
                                              return ProductosVacioWidget();
                                            }
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: cartItems.length,
                                              itemBuilder:
                                                  (context, cartItemsIndex) {
                                                final cartItemsItem =
                                                    cartItems[cartItemsIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 12.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 0.0,
                                                          color:
                                                              Color(0xFFE0E3E7),
                                                          offset:
                                                              Offset(0.0, 1.0),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      0.0,
                                                                      12.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            1.0,
                                                                            1.0,
                                                                            1.0),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  child: Image
                                                                      .network(
                                                                    functions
                                                                        .getImages(
                                                                            getJsonField(
                                                                      cartItemsItem,
                                                                      r'''$.product.images''',
                                                                      true,
                                                                    )!),
                                                                    width: 70.0,
                                                                    height:
                                                                        70.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 3,
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          4.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            cartItemsItem,
                                                                            r'''$.product.name''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF14181B),
                                                                                fontSize: 22.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            cartItemsItem,
                                                                            r'''$.product.price''',
                                                                          ).toString(),
                                                                          textAlign:
                                                                              TextAlign.end,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF14181B),
                                                                                fontSize: 22.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            RichText(
                                                                          textScaleFactor:
                                                                              MediaQuery.of(context).textScaleFactor,
                                                                          text:
                                                                              TextSpan(
                                                                            children: [
                                                                              TextSpan(
                                                                                text: 'Cantidad:',
                                                                                style: TextStyle(),
                                                                              ),
                                                                              TextSpan(
                                                                                text: getJsonField(
                                                                                  cartItemsItem,
                                                                                  r'''$.quantity''',
                                                                                ).toString(),
                                                                                style: TextStyle(),
                                                                              )
                                                                            ],
                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                  color: Color(0xFF57636C),
                                                                                  fontSize: 12.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      8.0,
                                                                      12.0),
                                                          child: AutoSizeText(
                                                            getJsonField(
                                                              cartItemsItem,
                                                              r'''$.product.fullDescription''',
                                                            )
                                                                .toString()
                                                                .maybeHandleOverflow(
                                                                  maxChars: 70,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: Color(
                                                                      0xFF57636C),
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily),
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      12.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .delete_outline,
                                                                color: Color(
                                                                    0xFFE8A479),
                                                                size: 24.0,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    _model.apiResulti84 =
                                                                        await ShopGroup
                                                                            .cartitemsaddproductCall
                                                                            .call(
                                                                      productId:
                                                                          getJsonField(
                                                                        cartItemsItem,
                                                                        r'''$.product._id._id''',
                                                                      ).toString(),
                                                                      userId: FFAppState()
                                                                          .authUser
                                                                          .id,
                                                                      authToken: FFAppState()
                                                                          .authUser
                                                                          .accessToken,
                                                                      number:
                                                                          -getJsonField(
                                                                        cartItemsItem,
                                                                        r'''$.quantity''',
                                                                      ),
                                                                      municipalityId: ShopGroup
                                                                          .cartuserIdCall
                                                                          .municipalityId(
                                                                            carritoCartuserIdResponse.jsonBody,
                                                                          )
                                                                          .toString(),
                                                                    );
                                                                    if ((_model
                                                                            .apiResulti84
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'Eliminado con éxito ',
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                      );
                                                                      await Future.delayed(const Duration(
                                                                          milliseconds:
                                                                              4000));

                                                                      context.pushNamed(
                                                                          'Carrito');
                                                                    } else {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'Algo salió mal',
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              Color(0x59E27C46),
                                                                        ),
                                                                      );
                                                                    }

                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  child: Text(
                                                                    'Remove',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Plus Jakarta Sans',
                                                                          color:
                                                                              Color(0xFFE8A479),
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
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
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 24.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Resumen de Pedido',
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Color(0xFF14181B),
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleLargeFamily),
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 12.0),
                                    child: Text(
                                      'Abajo hay un resumen de su Pedido',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Color(0xFF57636C),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily),
                                          ),
                                    ),
                                  ),
                                  Divider(
                                    height: 32.0,
                                    thickness: 2.0,
                                    color: Color(0xFFE0E3E7),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 24.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Total',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF57636C),
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily),
                                                        ),
                                                  ),
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 36.0,
                                                    icon: Icon(
                                                      Icons.info_outlined,
                                                      color: Color(0xFF57636C),
                                                      size: 18.0,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                '\$ ${functions.currencyFormat(getJsonField(
                                                  carritoCartuserIdResponse
                                                      .jsonBody,
                                                  r'''$.totalCost''',
                                                ).toString())}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF14181B),
                                                          fontSize: 36.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmallFamily),
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      _model.apiResult8m0 =
                                          await ShopGroup.orderCall.call(
                                        userId: FFAppState().authUser.id,
                                        authToken:
                                            FFAppState().authUser.accessToken,
                                        notesList: [],
                                      );
                                      if ((_model.apiResult8m0?.succeeded ??
                                          true)) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Orden Realizada Correctamente ',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                        await ShopGroup.cartitemscleancartIdCall
                                            .call(
                                          cartId: ShopGroup.cartuserIdCall
                                              .id(
                                                carritoCartuserIdResponse
                                                    .jsonBody,
                                              )
                                              .toString(),
                                          authToken:
                                              FFAppState().authUser.accessToken,
                                        );

                                        context.pushNamed('Carrito');
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Pedido Fallido',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor: Color(0x1DE27C46),
                                          ),
                                        );
                                      }

                                      setState(() {});
                                    },
                                    text: 'Realizar Orden',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 50.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFFEE5F01),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily),
                                          ),
                                      elevation: 2.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(50.0),
                                      hoverColor: Color(0x4C4B39EF),
                                      hoverBorderSide: BorderSide(
                                        color: Color(0xFF4B39EF),
                                        width: 1.0,
                                      ),
                                      hoverTextColor: Color(0xFF4B39EF),
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
        );
      },
    );
  }
}
