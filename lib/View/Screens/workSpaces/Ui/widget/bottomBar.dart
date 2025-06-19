import 'package:gradution_project/Core/Imports/common_imports.dart';

class NumberPageIndicatorExample extends StatefulWidget {
  const NumberPageIndicatorExample({super.key});

  @override
  _NumberPageIndicatorExampleState createState() =>
      _NumberPageIndicatorExampleState();
}

class _NumberPageIndicatorExampleState
    extends State<NumberPageIndicatorExample> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildNumberIndicator(int index) {
    return GestureDetector(
      onTap: () {
        _controller.jumpToPage(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        decoration: BoxDecoration(
          color: _currentPage == index ? Colors.blue : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Text(
          '${index + 1}',
          style: TextStyle(
            color: _currentPage == index ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: const [
          Center(child: Text("Page 1")),
          Center(child: Text("Page 2")),
          Center(child: Text("Page 3")),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) => buildNumberIndicator(index)),
        ),
      ),
    );
  }
}
