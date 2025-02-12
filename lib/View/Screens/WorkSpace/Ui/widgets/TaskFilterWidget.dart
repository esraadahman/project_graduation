import 'package:project_graduation/Core/Imports/common_imports.dart';

class TaskFilterWidget extends StatelessWidget {
  final List<String> filters;
  final String selectedFilter;
  final Function(String) onFilterSelected;

  const TaskFilterWidget({
    required this.filters,
    required this.selectedFilter,
    required this.onFilterSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade300),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: filters.map((filter) {
            bool isSelected = selectedFilter == filter;
            return GestureDetector(
              onTap: () => onFilterSelected(filter),
              child: Column(
                children: [
                  AnimatedOpacity(
                    opacity: isSelected ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 200),
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorsClass.primary, // Primary color
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    filter,
                    style: styling.subtitle.copyWith(
                              fontSize: 16,
                              color: isSelected ? ColorsClass.primary : ColorsClass.sub_text,
                              fontWeight: FontWeight.w500,
                            ),
                          
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
