import 'dart:convert';
import 'package:http/http.dart' as http;

class PredictService {
  Future<Map> sendDataToAPI(List checkList) async {
    checkList = checkList.map((e) => e ? 1 : 0).toList();

    final response = await http.post(
      Uri.parse('http://127.0.0.1:5000/process_array'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'array': checkList}),
    );

    // if (response.statusCode == 200) {
    //   print('Response: ${response.body}');
    // } else {
    //   print('Failed to send data. Status code: ${response.statusCode}');
    // }

    return jsonDecode(response.body);
  }
}
