import 'package:flutter/cupertino.dart';
import 'package:gradution_project/Core/Imports/common_imports.dart';
import 'package:gradution_project/Core/Theming/colors/colors.dart';
import 'package:gradution_project/Core/Theming/fonts/fonts.dart';

Widget buildField({required String label, required String value}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label with "Edit"
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label,
                style: styling.subtitle.copyWith(
                  color: ColorsClass.sub_text,
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                )),
            Text("Edit",
                style: styling.subtitle.copyWith(
                  color: ColorsClass.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                )),
          ],
        ),
        const SizedBox(height: 6),
        TextField(
          controller: TextEditingController(text: value),
          style: styling.subtitle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: ColorsClass.text),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white, // White background
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsClass.lightGrey, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildPasswordField({required String label, required String value}) {
  bool obscureText = true;
  final controller = TextEditingController(text: value);

  return StatefulBuilder(
    builder: (context, setState) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Label with "Edit"
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(label,
                    style: styling.subtitle.copyWith(
                      color: ColorsClass.sub_text,
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    )),
                Text("Edit",
                    style: styling.subtitle.copyWith(
                      color: ColorsClass.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    )),
              ],
            ),
            const SizedBox(height: 6),

            // Password TextField
            TextField(
              controller: controller,
              obscureText: obscureText,
              style: styling.subtitle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: ColorsClass.text,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white, // White background
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color: ColorsClass.text,
                  ),
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget buildBioField({required String label, required String value}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label with "Edit"
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label,
                style: styling.subtitle.copyWith(
                  color: ColorsClass.sub_text,
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                )),
            Text("Edit",
                style: styling.subtitle.copyWith(
                  color: ColorsClass.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                )),
          ],
        ),
        const SizedBox(height: 6),

        // Multiline TextField
        TextField(
          controller: TextEditingController(text: value),
          maxLines: 5,
          style: styling.subtitle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: ColorsClass.text,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white, // White background
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildBioButtons({
  required VoidCallback onSave,
  required VoidCallback onCancel,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      // Save Button
      ElevatedButton(
        onPressed: onSave,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsClass.profile,
          padding: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          "Save",
          style: styling.subtitle.copyWith(
              color: ColorsClass.colorwhite,
              fontWeight: FontWeight.w600,
              fontSize: 20),
        ),
      ),
      const SizedBox(height: 12),

      // Cancel Button
      OutlinedButton(
        onPressed: onCancel,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
          ),
          side: BorderSide(
            color: ColorsClass.profile,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          "Cancel",
          style: styling.subtitle.copyWith(
              color: ColorsClass.profile,
              fontWeight: FontWeight.w600,
              fontSize: 20),
        ),
      ),
    ],
  );
}

Widget buildDeleteAccountSection({
  required VoidCallback onDelete,
}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: ColorsClass.colorwhite,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: ColorsClass.lightGrey, width: 2),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // "Delete Account" text aligned to top-right
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Delete Account",
              style: styling.subtitle.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: ColorsClass.text,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Centered warning message
        Center(
          child: Text(
            "Deleting your account will remove all of your information "
            "from our database. This cannot be undone.",
            style: styling.subtitle.copyWith(
              fontSize: 17,
              color: ColorsClass.sub_text,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Delete button
        ElevatedButton(
          onPressed: onDelete,
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorsClass.delete,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.delete,
                color: Colors.red,
              ),
              SizedBox(width: 8),
              Text(
                "Delete Account",
                style: styling.subtitle.copyWith(
                  color: Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
