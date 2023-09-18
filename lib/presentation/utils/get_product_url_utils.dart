import 'package:deshifarmer/core/params/api_database_params.dart';

Uri getTheProductURL(
  String? search,
  String? company,
  String? cats,
) {
  var uri = ApiDatabaseParams.productListAPI;

  if (search != null &&
      company != null &&
      cats != null &&
      search.isNotEmpty &&
      company.isNotEmpty &&
      cats.isNotEmpty) {
    uri += '?product_name=$search&company_id=$company&category_id=$cats';
  } else if (search != null && company != null && search.isNotEmpty) {
    uri += '?product_name=$search&company_id=$company';
  } else if (company != null && cats != null && company.isNotEmpty) {
    uri += '?category_id=$cats&company_id=$company';
  } else if (search != null && cats != null && search.isNotEmpty) {
    uri += '?category_id=$cats&product_name=$search';
  } else if (search != null && search.isNotEmpty) {
    uri += '?product_name=$search';
  } else if (cats != null && cats.isNotEmpty) {
    uri += '?category_id=$cats';
  } else if (company != null && company.isNotEmpty) {
    uri += '?company_id=$company';
  } else {
    uri = ApiDatabaseParams.productListAPI;
  }

  print('uri -> $uri');
  return Uri.parse(uri);
  /* return Uri.parse(
    search != null && company != null && cats != null
        ? '${ApiDatabaseParams.productListAPI}?${search.isNotEmpty ? 'product_name=$search&' : ""}company_id=$company&category_id=$cats'
        : search != null && company != null
            ? '${ApiDatabaseParams.productListAPI}?${search.isNotEmpty ? 'product_name=$search&' : ""}company_id=$company'
            : company != null && cats != null
                ? '''
${ApiDatabaseParams.productListAPI}?category_id=$cats&company_id=$company'''
                : search != null && cats != null
                    ? '${ApiDatabaseParams.productListAPI}?category_id=$cats&${search.isNotEmpty ? "product_name=$search" : ""}'
                    : search != null
                        ? '${ApiDatabaseParams.productListAPI}?${search.isNotEmpty ? 'product_name=$search' : ""}'
                        : cats != null
                            ? '${ApiDatabaseParams.productListAPI}?category_id=$cats'
                            : company != null
                                ? '${ApiDatabaseParams.productListAPI}?company_id=$company'
                                : ApiDatabaseParams.productListAPI,
  ); */
}
