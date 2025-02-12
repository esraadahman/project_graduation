import 'package:project_graduation/Core/Imports/common_imports.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String status;
  final String deadline;
  final double progress;
  final List<String> assignees;
  final int attachments;
  final int comments;

  const TaskCard({
    required this.title,
    required this.status,
    required this.deadline,
    required this.progress,
    required this.assignees,
    required this.attachments,
    required this.comments,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// **Task Title**
            Row(
              children: [
                SvgPicture.asset(
                  'assets/images/taskicon.svg',
                  width: 20,
                  height: 15,
                ),
                SizedBox(width: 10),
                Text(
                  title,
                  style: styling.subtitle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorsClass.text,
                  ),
                ),
              ],
            ),
            SizedBox(height: 19),

            /// **Task Status**
            Container(
              width: 100,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 221, 235, 247),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Text(
                    status,
                    style: styling.subtitle.copyWith(
                      fontSize: 14,
                      color: Colors.blue,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Icon(Icons.arrow_drop_down, color: Colors.blue, size: 25),
                ],
              ),
            ),
            SizedBox(height: 30),

            /// **Task Deadline**
            Row(
              children: [
                SvgPicture.asset(
                  'assets/images/deadline.svg',
                  width: 25,
                  height: 25,
                ),
                SizedBox(width: 4),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Deadline  ',
                        style: styling.subtitle.copyWith(
                          fontSize: 14,
                          color: Colors.orange,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: deadline,
                        style: styling.subtitle.copyWith(
                          fontSize: 14,
                          color: ColorsClass.sub_text,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),

            /// **Attachments & Comments**
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// **Avatars (Max 3, Rest in "+X" Circle)**
                Row(
                  children: [
                    ...assignees.take(3).map((avatar) => CircleAvatar(
                          backgroundImage: NetworkImage(avatar),
                          radius: 15,
                        )),
                    if (assignees.length > 3)
                      CircleAvatar(
                        radius: 15,
                        backgroundColor:
                            const Color.fromARGB(255, 245, 234, 234),
                        child: Text("+${assignees.length - 3}",
                            style: styling.subtitle.copyWith(
                              fontSize: 11,
                              color: ColorsClass.sub_text,
                            )),
                      ),
                  ],
                ),

                ///*Add member button */
                Container(
                  width: 30,
                  height: 30,
                  margin: EdgeInsets.only(right: 95),
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorsClass.sub_text),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.add,
                    color: ColorsClass.sub_text,
                    size: 23,
                  ),
                ),

                /// **Attachments & Comments**
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/files.svg',
                      width: 25,
                      height: 25,
                    ),
                    SizedBox(width: 4),
                    Text("$attachments",
                        style: styling.subtitle.copyWith(fontSize: 12)),
                    SizedBox(width: 12),
                    SvgPicture.asset(
                      'assets/images/task_chat.svg',
                      width: 25,
                      height: 25,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "$comments",
                      style: styling.subtitle.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 25),
            Row(
              children: [
                Text(
                  'Progress',
                  style: styling.subtitle.copyWith(
                    fontSize: 12,
                    color: ColorsClass.sub_text,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Spacer(),
                Text(
                  '$progress%',
                  style: styling.subtitle.copyWith(
                    fontSize: 12,
                    color: ColorsClass.sub_text,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            /// **Progress Bar**
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(10), // Adjust for rounded corners
              child: LinearProgressIndicator(
                value: progress / 100,
                backgroundColor: Colors.grey.shade300,
                color: Colors.green,
                minHeight: 8, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
