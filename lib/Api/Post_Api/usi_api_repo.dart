import 'dart:convert';
import 'package:http/http.dart' as http;

class getUser {
  static Future getData() async {
    var data;
    http.Response response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      print(data);
    } else {
      print(response.statusCode);
    }
    return data;
  }
}
//
// postdata() async {
//   var responce = await http.post(
//     Uri.parse("https://jsonplaceholder.typicode.com/posts"),
//     body: {
//       "dfgfb": "fdfdbg",
//       "Name": "Darshil",
//       "Surname": "Malaviya",
//     },
//   );
//   print(responce.body);
// }
