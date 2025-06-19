import 'package:gradution_project/Core/Imports/common_imports.dart';

class Boxcontainer extends StatefulWidget {
  Boxcontainer(
      {super.key,
      required this.name,
      required this.description,
      required this.expanded,
      required this.onclick});
  final String name;
  final String description;
  bool expanded = false;
  final VoidCallback? onclick;

  @override
  State<Boxcontainer> createState() => _BoxcontainerState();
}

class _BoxcontainerState extends State<Boxcontainer> {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.name,
                  style: styling.maintitle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: ColorsClass.primary)),
              GestureDetector(
                onTap: widget.onclick,
                child: Icon(
                  Icons.more_horiz,
                  size: 23,
                  color: ColorsClass.sub_text,
                ),
              )
            ],
          ),
          size.height(10),
          if (widget.expanded)
            Text(
              widget.description,
              style: styling.subtitle.copyWith(
                  fontSize: 14,
                  color: ColorsClass.text.withOpacity(0.8),
                  fontWeight: FontWeight.normal),
            ),
          size.height(15),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              border: Border.all(color: ColorsClass.primary),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/doctorIcon.svg',
                ),
                size.width(10),
                Text("Doctor Notes",
                    style: styling.subtitle.copyWith(
                        fontSize: 16,
                        color: ColorsClass.primary,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          InkWell(
            onTap: () => setState(() => widget.expanded = !widget.expanded),
            child: Icon(
              widget.expanded
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
              size: 50,
              color: const Color.fromARGB(255, 253, 195, 20),
            ),
          ),
        ],
      ),
    );
  }
}
