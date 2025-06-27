import 'package:gradution_project/Core/Imports/common_imports.dart';


class ChallengeActionDialog extends StatelessWidget {
  final VoidCallback onDelete;
  final VoidCallback onUpdate;

  const ChallengeActionDialog({
    super.key,
    required this.onDelete,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          gradient: ColorsClass.appGradient,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: ColorsClass.primary.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Choose an action",
                style: styling.maintitle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ColorsClass.colorwhite),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the current dialog first
                  showDialog(
                    context: context,
                    builder: (context) => ConfirmDeleteDialog(
                      onConfirm: onDelete,
                    ),
                  );
                },
                icon: const Icon(Icons.delete, color: Colors.white),
                label: Text("Delete",
                    style: styling.maintitle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ColorsClass.colorwhite)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsClass.errorcolor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: onUpdate,
                icon: const Icon(Icons.edit, color: Colors.white),
                label: Text("Update",
                    style: styling.maintitle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ColorsClass.colorwhite)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 129, 179, 230),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
