class Challenge {
  final String name;
  final String description;

  Challenge({required this.name, required this.description});
}


class Message {
  final bool isSender;
  final String? text;
  final String? image;

  Message({required this.isSender, this.text, this.image});
}