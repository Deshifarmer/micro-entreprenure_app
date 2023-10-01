import 'package:deshifarmer/core/params/api_database_params.dart';

Uri getTheProductURL(
  String? search,
  String? company,
  String? cats,
) {
  var uri = ApiDatabaseParams.productListAPI;
  // if all the params are null or empty then return the default url
  if (search == null && company == null && cats == null) {
    return Uri.parse(uri);
  }

  if (search != null && search.isNotEmpty) {
    uri += '?product_name=$search';
  }
  if (company != null && company.isNotEmpty) {
    uri += '${uri.contains('?') ? '&' : '?'}company_id=$company';
  }
  if (cats != null && cats.isNotEmpty) {
    uri += '${uri.contains('?') ? '&' : '?'}category_id=$cats';
  }
  if (uri == ApiDatabaseParams.productListAPI) {
    // All parameters are empty, use default URI
  } else if (!uri.contains('?')) {
    // No parameters were added, add a '?' to start the query string
    uri += '?';
  }
  // print('uri -> $uri');
  return Uri.parse(uri);
}
