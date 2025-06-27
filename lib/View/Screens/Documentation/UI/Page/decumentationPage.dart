import 'package:gradution_project/Core/Imports/common_imports.dart';

class DocumentationScreen extends StatelessWidget {
  const DocumentationScreen({super.key, required this.groupId});
  final int groupId;

  @override
  Widget build(BuildContext context) {
    List<FileCardData> uploadedFiles = []; // Example list

    return Scaffold(
      backgroundColor: ColorsClass.colorwhite,
      appBar: AppBar(
        backgroundColor: ColorsClass.colorwhite,
        title: Text(
          'Task Name',
          style: styling.maintitle.copyWith(fontSize: 20),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: ColorsClass.text),
          onPressed: () {
            context.goBack();
          },
        ),
        actions: const [
          Icon(Icons.more_vert, color: Colors.black),
          SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 2,
              color: ColorsClass.lightGrey,
            ),
            size.height(16),

            // Breadcrumbs
            Row(
              children: [
                size.width(16),
                Text.rich(
                  TextSpan(
                    style: styling.subtitle.copyWith(
                      fontSize: 20,
                      color: ColorsClass.sub_text,
                      fontWeight: FontWeight.normal,
                    ),
                    children: [
                      const TextSpan(
                          text: 'Work Spaces  >  Work Space Name \n > '),
                      TextSpan(
                        text: 'Documentation',
                        style: styling.subtitle.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Steps & History Buttons
            Padding(
              padding: const EdgeInsets.only(left: 17.0, top: 10, bottom: 8),
              child: Row(
                children: [
                  // Steps Button
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 235, 240, 247),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/steps.svg',
                            height: 20,
                            width: 20,
                          ),
                          size.width(6),
                          Text(
                            'Steps',
                            style: styling.maintitle.copyWith(
                              color: ColorsClass.sub_text,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  size.width(16),

                  // History Button
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        gradient: ColorsClass.appGradient,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/history.svg',
                            height: 20,
                            width: 20,
                            colorFilter: const ColorFilter.mode(
                                Colors.white, BlendMode.srcIn),
                          ),
                          size.width(6),
                          Text(
                            'History',
                            style: styling.maintitle.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Confirmbutton(
                    text: "Download Documentation",
                    onTap: () {
                      context.navigateTo(DownloadPage(groupId: groupId));
                    }),
              ],
            ),
            const SizedBox(height: 16),
            // Sort by Time
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SortButton(label: "Time", onPressed: () {}),
              ],
            ),
            const SizedBox(height: 16),

            // File Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Icon Box
                      Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/fileicons.svg',
                              height: 60,
                              width: 60,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Template Name',
                              style: styling.subtitle.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  color: ColorsClass.sub_text),
                            ),
                          ],
                        ),
                      ),
                      size.height(12),

                      // File name
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "File Name",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),

                      // Upload date
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            DateFormat('yyyy-MM-dd').format(DateTime.now()),
                            style: styling.subtitle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: ColorsClass.sub_text),
                          )),

                      size.height(10),
                      // Publish Button
                      SizedBox(
                        width: double.infinity,
                        height: 36,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: ColorsClass.primary,
                            side: const BorderSide(color: ColorsClass.primary),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            // Action
                          },
                          child: Text(
                            "Publish",
                            style: styling.maintitle.copyWith(
                              color: ColorsClass.primary,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
