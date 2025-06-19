
import 'package:gradution_project/Core/Imports/common_imports.dart';


class TaskCategoriesWidget extends StatelessWidget {
  final List<Map<String, dynamic>> taskCategories;
  final int selectedCategoryIndex;
  final Function(int) onCategorySelected;

  const TaskCategoriesWidget({
    required this.taskCategories,
    required this.selectedCategoryIndex,
    required this.onCategorySelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: taskCategories.length,
          itemBuilder: (context, index) {
            bool isSelected = selectedCategoryIndex == index;
            return GestureDetector(
              onTap: () => onCategorySelected(index),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue : const Color.fromARGB(255, 242, 244, 247).withOpacity(0.1),
                  gradient: isSelected
                      ? ColorsClass.appGradient
                      : null,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "${taskCategories[index]['title']} (${taskCategories[index]['count']})",
                  style: styling.subtitle.copyWith(
                fontSize: 16,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    color: isSelected ? ColorsClass.colorwhite : ColorsClass.sub_text,
                ),
              ),
             ) );
          },
        ),
      ),
    );
  }
}
