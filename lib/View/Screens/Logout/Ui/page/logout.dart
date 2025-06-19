import 'package:gradution_project/Core/Imports/common_imports.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Box box1 = Hive.box(HiveConstants.Boxname);
    final Box box2 = Hive.box(HiveConstants.boxName);

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon:
                  const Icon(Icons.arrow_back_ios_new, color: ColorsClass.text),
              onPressed: () {
                context.goBack();
              },
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: ColorsClass.colorwhite,
            title: Text(
              'Logout',
              style: styling.maintitle
                  .copyWith(color: const Color.fromARGB(255, 48, 49, 51)),
            )),
        body: Container(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Text(
                  "Are you sure you want to logout?",
                  style: styling.maintitle
                      .copyWith(fontSize: 20, color: ColorsClass.sub_text),
                ),
                Container(
                  height: 450,
                  width: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logout.png'),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await box1.clear();
                    await box2.clear();
                    context.navigateTo(const SignInScreen());
                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: ColorsClass.appGradient,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text(
                      "Logout",
                      style: styling.maintitle.copyWith(
                          fontSize: 20, color: ColorsClass.colorwhite),
                    )),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
