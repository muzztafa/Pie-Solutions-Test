import 'dart:convert';
import 'message.dart';
import 'package:http/http.dart' as http;

class Data {
  static List<Message> messagesList = [];

  void getData() async {
    try {
      var url = Uri.parse('https://pietest.dev.new.wf/data.json');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        Map<dynamic, dynamic> res = jsonDecode(response.body);
        List<dynamic> res2 = res['categories'];

        for (int i = 0; i < res2.length; i++) {
          Message msg = new Message(
              emailAddress: res2[i]["email_address"],
              id: res2[i]["id"],
              name: res2[i]["name"],
              timeStamp: res2[i]["time_stamp"],
              phoneNumber: res2[i]["phone_number"],
              requestContent: res2[i]["request_content"]);

          messagesList.add(msg);
        }
        print("Messages added to List successfully!");
      } else {
        throw Exception('Failed to load album');
      }
    } catch (e) {
      throw Exception("$e");
    }
  }
}
