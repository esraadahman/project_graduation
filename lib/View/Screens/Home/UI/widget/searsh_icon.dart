import 'package:gradution_project/Core/Imports/common_imports.dart';

class SearshBarWidget extends StatelessWidget {
  const SearshBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: TextField(
        onChanged: (value) {
          // cubit.searchbyname(value);
        },
        decoration: InputDecoration(
          hintText: 'Search or jump to...',

          filled: true,
          //   fillColor: ColorsClass.background,
          prefixIcon: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Stack(
              clipBehavior:
                  Clip.none, // Allows overflow of the stars outside bounds
              children: [
                Icon(Icons.search,
                    size: 28, color: ColorsClass.primary), // Main search icon
                Positioned(
                  right: 4, // Position star closer to the top-right corner
                  top: -5,
                  child: Icon(Icons.star,
                      size: 10, color: ColorsClass.primary), // Smaller sparkle
                ),
                Positioned(
                  right: 3, // Position star closer to the top-right corner
                  top: 5,
                  child: Icon(Icons.star,
                      size: 7, color: ColorsClass.primary), // Smaller sparkle
                ),
              ],
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(
              color: ColorsClass.sub_text,
              width: 0,
            ),
          ),
        ),
      ),
    );
  }
}
