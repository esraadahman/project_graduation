import 'package:flutter/material.dart';
import 'package:project_graduation/Core/Imports/common_imports.dart';

class ProgressBarWidget extends StatelessWidget {
  final int activeIndex;

  const ProgressBarWidget({
    Key? key,
    required this.activeIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // First step
        Positioned(
          left: width(context) * 0.05,
          top: 0,
          child: _buildStep(
            label: "Basics",
            isActive: activeIndex == 0,
            context: context,
            activeIndex: activeIndex,
          ),
        ),
        // Line between steps 1 and 2
        Positioned(
          left: width(context) * 0.15,
          top: height(context) * 0.02,
          width: width(context) * 0.3,
          child: _buildLine(),
        ),
        // Second step
        Positioned(
          left: width(context) * 0.44,
          top: 0,
          child: _buildStep(
            label: "Stage",
            isActive: activeIndex == 1,
            context: context,
            activeIndex: activeIndex,
          ),
        ),
        // Line between steps 2 and 3
        Positioned(
          left: width(context) * 0.535,
          top: height(context) * 0.02,
          width: width(context) * 0.29,
          child: _buildLine(),
        ),
        // Third step
        Positioned(
          right: width(context) * 0.05,
          top: 0,
          child: _buildStep(
            label: "Templates",
            isActive: activeIndex == 2,
            context: context,
            activeIndex: activeIndex,
          ),
        ),
      ],
    );
  }

  Widget _buildStep(
      {required BuildContext context,
      required String label,
      required bool isActive,
      required int activeIndex}) {
    int stepIndex = ['Basics', 'Stage', 'Templates'].indexOf(label);

    // Determine if the step is completed based on its index and activeIndex
    bool isCompleted = stepIndex < activeIndex;
    return Column(
      children: [
        Container(
          width: width(context) * .09,
          height: height(context) * .06,
          decoration: BoxDecoration(
            gradient: isCompleted ? ColorsClass.appGradient : null,
            shape: BoxShape.circle,
            border: isCompleted
                ? null
                : Border.all(
                    color: isActive ? ColorsClass.dark_gradient : Colors.grey,
                    width: 2,
                  ),
          ),
          child: Center(
            child: isCompleted
                ? const Icon(
                    Icons.check, // Checkmark for completed step
                    color: Colors.white,
                    size: 20,
                  )
                : isActive
                    ? Container(
                        width: width(context) * .02,
                        height: height(context) * .01,
                        decoration: const BoxDecoration(
                          gradient: ColorsClass.appGradient,
                          shape: BoxShape.circle,
                        ),
                      ) // Blue dot for active step
                    : null, // No dot or icon for inactive step
          ),
        ),
        Text(label,
            style: styling.subtitle.copyWith(
              fontSize: 14,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive
                  ? ColorsClass.copyRights
                  : isCompleted
                      ? ColorsClass.complateColorText
                      : ColorsClass.border_color,
            )),
      ],
    );
  }

  // Builds the line between steps
  Widget _buildLine() {
    return const Expanded(
      child: Divider(
        color: ColorsClass.border_color,
        thickness: 2,
      ),
    );
  }
}
