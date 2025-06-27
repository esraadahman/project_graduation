import 'package:gradution_project/Core/Imports/common_imports.dart';

class TemplatesPage extends StatefulWidget {
  const TemplatesPage({super.key});

  @override
  State<TemplatesPage> createState() => _TemplatesPageState();
}

class _TemplatesPageState extends State<TemplatesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsClass.colorwhite,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(children: [
            size.height(height(context) * .05),
            ImageSlider(),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip('All', selected: true),
                  _buildFilterChip('Category'),
                  _buildFilterChip('Category'),
                  _buildFilterChip('Category'),
                  _buildFilterChip('Category'),
                  _buildFilterChip('Category'),
                  _buildFilterChip('Category'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Column(
                children: List.generate(
              images_workSpaces.length,
              (index) => Column(
                children: [
                  Workspacetemplate(
                    image: images_workSpaces[index],
                    title: 'Title',
                    imagelist: listimages_member,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            )),
            size.height(height(context) * .05),
          ])),
        ));
  }
}

Widget _buildFilterChip(String label, {bool selected = false}) {
  return Container(
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
    decoration: BoxDecoration(
      gradient: selected ? ColorsClass.appGradient : ColorsClass.appGradient2,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(
      label,
      style: TextStyle(
        color: selected ? Colors.white : ColorsClass.complateColorText,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
