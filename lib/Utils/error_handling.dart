import 'dart:convert';

import 'package:amazon/Utils/utility.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

void httpErrorhandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showsnackbar(context, jsonDecode(response.body)['msg']);
      break;
    case 500:
      showsnackbar(context, jsonDecode(response.body)['error']);
      break;
    default:
      showsnackbar(context, response.body);
  }
}
