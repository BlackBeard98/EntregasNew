import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class ProductosModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<String> pageCategories = [];
  void addToPageCategories(String item) => pageCategories.add(item);
  void removeFromPageCategories(String item) => pageCategories.remove(item);
  void removeAtIndexFromPageCategories(int index) =>
      pageCategories.removeAt(index);
  void updatePageCategoriesAtIndex(int index, Function(String) updateFn) =>
      pageCategories[index] = updateFn(pageCategories[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController2;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textController?.dispose();
    listViewPagingController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<ApiPagingParams, dynamic> setListViewController2(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall2 = apiCall;
    return listViewPagingController2 ??= _createListViewController2(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController2(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewProductallPage2);
  }

  void listViewProductallPage2(ApiPagingParams nextPageMarker) =>
      listViewApiCall2!(nextPageMarker).then((listViewProductallResponse) {
        final pageItems = (getJsonField(
                  listViewProductallResponse.jsonBody,
                  r'''$[*]''',
                ) ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController2?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewProductallResponse,
                )
              : null,
        );
      });
}
