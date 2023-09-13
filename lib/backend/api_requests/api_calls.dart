import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Shop Group Code

class ShopGroup {
  static String baseUrl = 'https://api.laventanashop.com/shop';
  static Map<String, String> headers = {};
  static ProductallCall productallCall = ProductallCall();
  static CategoryallCall categoryallCall = CategoryallCall();
  static ProveedorallCall proveedorallCall = ProveedorallCall();
  static ProvinceallCall provinceallCall = ProvinceallCall();
  static CartitemsaddproductCall cartitemsaddproductCall =
      CartitemsaddproductCall();
  static CartCall cartCall = CartCall();
  static CartuserIdCall cartuserIdCall = CartuserIdCall();
  static CartitemscleancartIdCall cartitemscleancartIdCall =
      CartitemscleancartIdCall();
  static OrderCall orderCall = OrderCall();
  static OrderallCall orderallCall = OrderallCall();
  static OrderallmeCall orderallmeCall = OrderallmeCall();
  static OrderidCall orderidCall = OrderidCall();
}

class ProductallCall {
  Future<ApiCallResponse> call({
    dynamic? filterCategoriesJson,
    int? pageNum,
    String? authToken = '',
  }) {
    final filterCategories = _serializeJson(filterCategoriesJson);
    final ffApiRequestBody = '''
{
  "pageParams": {
    "pageNum": ${pageNum},
    "pageLimit": 10
  },
  "filter": ${filterCategories}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'productall',
      apiUrl: '${ShopGroup.baseUrl}/product/all',
      callType: ApiCallType.POST,
      headers: {
        ...ShopGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic allProducts(dynamic response) => getJsonField(
        response,
        r'''$[*]''',
        true,
      );
}

class CategoryallCall {
  Future<ApiCallResponse> call({
    int? pageNum,
    String? authToken = '',
  }) {
    final ffApiRequestBody = '''
{
  "pageParams": {
    "pageNum": ${pageNum},
    "pageLimit": 10
  },
  "filter": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'categoryall',
      apiUrl: '${ShopGroup.baseUrl}/category/all',
      callType: ApiCallType.POST,
      headers: {
        ...ShopGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic productNames(dynamic response) => getJsonField(
        response,
        r'''$[:].name''',
        true,
      );
  dynamic productImages(dynamic response) => getJsonField(
        response,
        r'''$[:].iconUrl''',
        true,
      );
}

class ProveedorallCall {
  Future<ApiCallResponse> call() {
    final ffApiRequestBody = '''
{
  "pageParams": {
    "pageNum": 1,
    "pageLimit": 10
  },
  "filter": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'proveedorall',
      apiUrl: '${ShopGroup.baseUrl}/provider/all',
      callType: ApiCallType.POST,
      headers: {
        ...ShopGroup.headers,
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic proveedor(dynamic response) => getJsonField(
        response,
        r'''$[:].name''',
        true,
      );
  dynamic correo(dynamic response) => getJsonField(
        response,
        r'''$[:].email''',
        true,
      );
}

class ProvinceallCall {
  Future<ApiCallResponse> call() {
    final ffApiRequestBody = '''
{
  "pageParams": {
    "pageNum": 1,
    "pageLimit": 10
  },
  "filter": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'provinceall',
      apiUrl: '${ShopGroup.baseUrl}/province/all',
      callType: ApiCallType.POST,
      headers: {
        ...ShopGroup.headers,
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CartitemsaddproductCall {
  Future<ApiCallResponse> call({
    String? productId = '',
    String? userId = '',
    int? number = 1,
    String? authToken = '',
  }) {
    final ffApiRequestBody = '''
{
  "productId": "${productId}",
  "quantity": ${number},
  "userId": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'cartitemsaddproduct',
      apiUrl: '${ShopGroup.baseUrl}/cart/items/add_product',
      callType: ApiCallType.POST,
      headers: {
        ...ShopGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CartCall {
  Future<ApiCallResponse> call({
    String? userId = '',
  }) {
    final ffApiRequestBody = '''
{
  "userId": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'cart',
      apiUrl: '${ShopGroup.baseUrl}/cart',
      callType: ApiCallType.POST,
      headers: {
        ...ShopGroup.headers,
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CartuserIdCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? authToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'cartuserId',
      apiUrl: '${ShopGroup.baseUrl}/cart/${userId}',
      callType: ApiCallType.GET,
      headers: {
        ...ShopGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic cartItems(dynamic response) => getJsonField(
        response,
        r'''$.cartItems''',
        true,
      );
  dynamic itemsIDs(dynamic response) => getJsonField(
        response,
        r'''$.cartItems[:]._id''',
        true,
      );
  dynamic producto(dynamic response) => getJsonField(
        response,
        r'''$.cartItems[:].product''',
        true,
      );
}

class CartitemscleancartIdCall {
  Future<ApiCallResponse> call({
    String? cartId = '',
    String? authToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'cartitemscleancartId',
      apiUrl: '${ShopGroup.baseUrl}/cart/items/clean/${cartId}',
      callType: ApiCallType.POST,
      headers: {
        ...ShopGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class OrderCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    List<String>? notesList,
    String? authToken = '',
  }) {
    final notes = _serializeList(notesList);

    final ffApiRequestBody = '''
{
  "userId": "${userId}",
  "notes": ${notes}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'order',
      apiUrl: '${ShopGroup.baseUrl}/order',
      callType: ApiCallType.POST,
      headers: {
        ...ShopGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class OrderallCall {
  Future<ApiCallResponse> call() {
    final ffApiRequestBody = '''
{
  "pageParams": {
    "pageNum": 1,
    "pageLimit": 10
  },
  "filter": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'orderall',
      apiUrl: '${ShopGroup.baseUrl}/order/all',
      callType: ApiCallType.POST,
      headers: {
        ...ShopGroup.headers,
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class OrderallmeCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) {
    final ffApiRequestBody = '''
{
  "pageParams": {
    "pageNum": 1,
    "pageLimit": 10
  },
  "filter": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'orderallme',
      apiUrl: '${ShopGroup.baseUrl}/order/all/me',
      callType: ApiCallType.POST,
      headers: {
        ...ShopGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class OrderidCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? authToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'orderid',
      apiUrl: '${ShopGroup.baseUrl}/order/${id}',
      callType: ApiCallType.GET,
      headers: {
        ...ShopGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic orderNumber(dynamic response) => getJsonField(
        response,
        r'''$.orderNumber''',
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.user.name''',
      );
  dynamic firstLN(dynamic response) => getJsonField(
        response,
        r'''$.user.firstLastName''',
      );
  dynamic secondLN(dynamic response) => getJsonField(
        response,
        r'''$.user.secondLastName''',
      );
  dynamic mail(dynamic response) => getJsonField(
        response,
        r'''$.user.email''',
      );
  dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.user.address''',
        true,
      );
  dynamic payment(dynamic response) => getJsonField(
        response,
        r'''$.paymentStatus''',
      );
  dynamic items(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      );
  dynamic notes(dynamic response) => getJsonField(
        response,
        r'''$.notes''',
        true,
      );
  dynamic prices(dynamic response) => getJsonField(
        response,
        r'''$.price''',
      );
  dynamic finalPrice(dynamic response) => getJsonField(
        response,
        r'''$.finalPrice''',
      );
}

/// End Shop Group Code

/// Start Identity Group Code

class IdentityGroup {
  static String baseUrl = 'https://api.laventanashop.com/identity';
  static Map<String, String> headers = {};
  static AuthCall authCall = AuthCall();
  static RegisterCall registerCall = RegisterCall();
  static UsersupdateidCall usersupdateidCall = UsersupdateidCall();
}

class AuthCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) {
    final ffApiRequestBody = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'auth',
      apiUrl: '${IdentityGroup.baseUrl}/auth',
      callType: ApiCallType.POST,
      headers: {
        ...IdentityGroup.headers,
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic accesstoken(dynamic response) => getJsonField(
        response,
        r'''$.access_token''',
      );
  dynamic userMail(dynamic response) => getJsonField(
        response,
        r'''$.payload.email''',
      );
  dynamic userClaims(dynamic response) => getJsonField(
        response,
        r'''$.payload.claims''',
        true,
      );
  dynamic userName(dynamic response) => getJsonField(
        response,
        r'''$.payload.name''',
      );
  dynamic userID(dynamic response) => getJsonField(
        response,
        r'''$.payload._id''',
      );
  dynamic firstLastName(dynamic response) => getJsonField(
        response,
        r'''$.payload.firstLastName''',
      );
  dynamic secondLastName(dynamic response) => getJsonField(
        response,
        r'''$.payload.secondLastName''',
      );
}

class RegisterCall {
  Future<ApiCallResponse> call({
    String? password = '',
    String? email = '',
    String? name = '',
    String? firstLastName = '',
    String? secondLastName = '',
  }) {
    final ffApiRequestBody = '''
{
  "password": "${password}",
  "email": "${email}",
  "name": "${name}",
  "firstLastName": "${firstLastName}",
  "secondLastName": "${secondLastName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'register',
      apiUrl: '${IdentityGroup.baseUrl}/users/register',
      callType: ApiCallType.POST,
      headers: {
        ...IdentityGroup.headers,
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InJvb3RAbWFpbC5jb20iLCJfaWQiOiIyNDg2MTA1Yi1mYTIzLTRhNzEtYWI1MC1hODczN2UyNjZiOWMiLCJjbGFpbXMiOlsiU3VwZXJBY2Nlc3MiXSwiaWF0IjoxNjkzNDgxNDU1LCJleHAiOjE2OTQzNDU0NTV9.rzdj9s46cFogUGOwSJE6-FmwHu00ODMGi3fFpkuMUlQ',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UsersupdateidCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? name = '',
    String? firstLastName = '',
    String? secondLastName = '',
  }) {
    final ffApiRequestBody = '''
{
  "name": "${name}",
  "firstLastName": "${firstLastName}",
  "secondLastName": "${secondLastName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'usersupdateid',
      apiUrl: '${IdentityGroup.baseUrl}/users/update/${id}',
      callType: ApiCallType.PUT,
      headers: {
        ...IdentityGroup.headers,
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Identity Group Code

class FindOneCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) {
    final ffApiRequestBody = '''
{
  "pageParams": {
    "pageNum": 1,
    "pageLimit": 10
  },
  "filter": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'findOne',
      apiUrl: 'https://api.laventanashop.com/shop/ProductController_getAll',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InJvb3RAbWFpbC5jb20iLCJfaWQiOiIyNDg2MTA1Yi1mYTIzLTRhNzEtYWI1MC1hODczN2UyNjZiOWMiLCJjbGFpbXMiOlsiU3VwZXJBY2Nlc3MiXSwiaWF0IjoxNjkyOTAyMzY0LCJleHAiOjE2OTM3NjYzNjR9.of4Vos-JMj-N_YjlU19lB3TdkWvkz_cluWUAIVHe2ro',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
