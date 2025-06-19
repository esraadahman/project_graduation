import 'package:gradution_project/Core/Imports/common_imports.dart';
import 'package:gradution_project/View/Screens/AddNewTask/UI/page/AddNewTask.dart';

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
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Chat Page', style: TextStyle(fontSize: 24)),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: () {
             // context.navigateTo(const AddNewTask());
            },
            child: const Text('Go to Add New Task')),
      ],
    ));
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


