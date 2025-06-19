import 'package:flutter/material.dart';
import 'package:gradution_project/Core/Imports/common_imports.dart';

class TeamMembersWidget extends StatefulWidget {
  const TeamMembersWidget({super.key});

  @override
  State<TeamMembersWidget> createState() => _TeamMembersWidgetState();
}

class _TeamMembersWidgetState extends State<TeamMembersWidget> {
  bool isExpanded = true;

  final List<bool> selected = [true, true, true, false];
  final List<String> members = [
    'Esraa',
    'Mariam',
    'Radwa',
    'Esraa',
  ];
  final List<String> images = [
    'assets/images/profile1.png',
    'assets/images/profile2.png',
    'assets/images/profile1.png',
    'assets/images/profile2.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 9),
      decoration: BoxDecoration(
        color: ColorsClass.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
          )
        ],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => isExpanded = !isExpanded),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Assigned Team Members',
                    style: styling.maintitle
                        .copyWith(fontSize: 16, fontWeight: FontWeight.normal)),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: 24,
                  color: const Color.fromARGB(255, 253, 195, 20),
                ),
              ],
            ),
          ),
          size.height(15),
          if (isExpanded)
            ...List.generate(selected.length, (index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        side: const BorderSide(color: Colors.grey),
                        value: selected[index],
                        onChanged: (val) {
                          setState(() => selected[index] = val ?? false);
                        },
                      ),
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(images[index]),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 14,
                              height: 14,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 1.5),
                              ),
                            ),
                          ),
                        ],
                      ),
                      size.width(10),
                      Expanded(
                        child: Text(
                          members[index],
                          style: styling.subtitle.copyWith(
                            fontWeight: FontWeight.normal,
                            color: ColorsClass.text,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  size.height(13),
                ],
              );
            }),
        ],
      ),
    );
  }
}
