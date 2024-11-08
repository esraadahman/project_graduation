import 'package:flutter/cupertino.dart';
import 'package:project_graduation/Core/Imports/common_imports.dart';

class SchoolOrCompany extends StatefulWidget {
  SchoolOrCompany({super.key});

  @override
  State<SchoolOrCompany> createState() => _SchoolOrCompanyState();
}

class _SchoolOrCompanyState extends State<SchoolOrCompany> {
  bool checked_company = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const bacground_widget(),
          Center(
            child: Container(
              height: size.heightMedia(context, .62),
              width: size.widthMedia(context, .9),
              decoration: CustomDecoration.decorationForCenterContainer(),
              child: Column(
                children: [
                  size.height(25),
                  MainTiltleWidget(
                    text: LangClass.translate(context, "new_account"),
                    fontSize: 23,
                  ),
                  size.height(5),
                  subtextWidget(
                      text: LangClass.translate(context, "start_journey"),
                      fontsize: 15),
                  size.height(10),
                  text_textbutton(
                    text: LangClass.translate(context, "already_have_account"),
                    buttontext: LangClass.translate(context, "login"),
                    ontap: () {
                      context.navigateTo(SignInScreen());
                    },
                  ),
                  size.height(20),
                  MainTiltleWidget(
                      text: LangClass.translate(context, "account_type"),
                      fontSize: 15),
                  size.height(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              checked_company = true;
                            });
                          },
                          child: Company_or_school_icons(
                            checked: checked_company,
                            icon: Icons.school,
                            text: LangClass.translate(context, "school"),
                          )),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              checked_company = false;
                            });
                          },
                          child: Company_or_school_icons(
                            checked: !checked_company,
                            icon: CupertinoIcons.building_2_fill,
                            text: LangClass.translate(context, "company"),
                          )),
                    ],
                  ),
                  size.height(50),
                  Confirmbutton(
                      text:   LangClass.translate(context, "next"),
                      onTap: () {
                        checked_company
                            ? context.navigateTo(SchoolAccountScreen())
                            //

                            : null;
                      }),
                  size.height(10),
                  Row(
                    children: [
                      size.width(15),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            LangClass.translate(context, "register_as_user"),
                            style: styling.subtitle.copyWith(
                                color: ColorsClass.primary,
                                decoration: TextDecoration.underline,
                                decorationColor: ColorsClass.primary,
                                fontSize: 12),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
