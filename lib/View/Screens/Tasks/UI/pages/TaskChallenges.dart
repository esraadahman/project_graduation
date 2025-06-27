import 'package:gradution_project/Core/Imports/common_imports.dart';



class Taskchallenges extends StatefulWidget {
  const Taskchallenges(
      {super.key,
      required this.Challenges,
      required this.onclick,
      required this.onclick2});
  final List<ChallengeModel> Challenges;
  final VoidCallback? onclick;
  final void Function(int id)? onclick2;

  @override
  State<Taskchallenges> createState() => _TaskchallengesState();
}

class _TaskchallengesState extends State<Taskchallenges> {
  List<bool> expanded = [];

  @override
  void initState() {
    super.initState();
    expanded = List.generate(widget.Challenges.length + 1, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.Challenges.length,
              itemBuilder: (context, index) {
                final challenge = widget.Challenges[index];
                return Boxcontainer(
                  name: challenge.title,
                  description: challenge.solution.contents,
                  expanded: expanded[index],
                  onclick: () => widget.onclick2?.call(challenge.id),
                );
              },
              separatorBuilder: (context, index) {
                return size.height(10);
              },
            ),
            size.height(30),
            GestureDetector(
              onTap: widget.onclick,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorsClass.primary),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/add.svg',
                      width: 25,
                    ),
                    size.width(10),
                    Text("New Challenge",
                        style: styling.subtitle.copyWith(
                            fontSize: 16,
                            color: ColorsClass.primary,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            size.height(30),
          ],
        ),
      ),
    );
  }
}
