class Message {
  final int id;
  final String name;
  final String timeStamp;
  final String emailAddress;
  final String phoneNumber;
  final String requestContent;

  Message(
      {this.emailAddress,
      this.id,
      this.name,
      this.timeStamp,
      this.phoneNumber,
      this.requestContent});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      name: json['name'],
      timeStamp: json['time_stamp'],
      emailAddress: json['email_address'],
      phoneNumber: json['phone_number'],
      requestContent: json['request_content'],
    );
  }
}
