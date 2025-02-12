import 'package:project_graduation/Core/Imports/common_imports.dart';

class NavigateHomePage extends StatelessWidget {
  const NavigateHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: HomeContent());
  }
}

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Chat Page', style: TextStyle(fontSize: 24)),
    );
  }
}

class FilesPage extends StatelessWidget {
  const FilesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Files Page', style: TextStyle(fontSize: 24)),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile Page', style: TextStyle(fontSize: 24)),
    );
  }
}
