import 'package:gradution_project/Core/Imports/common_imports.dart';

class ChatTopBar extends StatelessWidget {
  final String userName;
  final String lastSeen;
  final String userImagePath;

  const ChatTopBar({
    Key? key,
    required this.userName,
    required this.lastSeen,
    required this.userImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 26,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 1),
          CircleAvatar(
            radius: 26,
            backgroundImage: AssetImage(userImagePath),
            backgroundColor: Colors.grey[300],
          ),
          const SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: styling.subtitle.copyWith(
                  fontSize: 16,
                  color: ColorsClass.text,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                lastSeen,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
