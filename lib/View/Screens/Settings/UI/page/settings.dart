import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradution_project/Core/Imports/common_imports.dart';
import 'package:gradution_project/Core/Language/LocalizationHelper.dart';
import 'package:gradution_project/Core/Theming/colors/colors.dart';
import 'package:gradution_project/Core/Theming/fonts/fonts.dart';
import 'package:gradution_project/Core/Theming/size/size.dart';
import 'package:gradution_project/Core/functions/imagepacker.dart';
import 'package:gradution_project/View/Screens/Logout/Ui/page/logout.dart';
import 'package:gradution_project/View/Screens/Settings/UI/widgets/accountFields.dart';
import 'package:gradution_project/View/Screens/Settings/UI/widgets/gradientSameAs.dart';
import 'package:gradution_project/View/Screens/Settings/UI/widgets/phoneNumberField.dart';
import 'package:gradution_project/View/Screens/Settings/cubit/cubit/settingscubit_cubit.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
    // required this.themeMode,
    // required this.onThemeChanged
  }) : super(key: key);
  // final ThemeMode themeMode;
  // final Function(bool) onThemeChanged;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    // bool isChecked() {
    //   return widget.themeMode == ThemeMode.dark;
    // }

    return Scaffold(
      backgroundColor: ColorsClass.background,

      resizeToAvoidBottomInset: false,
      // AppBar
      appBar: AppBar(
        title: Text("Settings",
            style: styling.maintitle.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            )),
        backgroundColor: ColorsClass.colorwhite,
        centerTitle: true,
        leading: const Icon(Icons.arrow_back_ios_new,
            color: ColorsClass.text, size: 20),
        actions: const [
          Icon(Icons.more_vert, color: ColorsClass.text, size: 20)
        ],
      ),
      // Body
      body: BlocProvider(
        create: (context) => SettingscubitCubit(),
        child: BlocConsumer<SettingscubitCubit, SettingscubitState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            final cubit = BlocProvider.of<SettingscubitCubit>(context);
            return SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  // Divider
                  Container(
                    width: width(context),
                    height: 2,
                    color: ColorsClass.lightGrey,
                  ),

                  size.height(24),
                  // Profile Section
                  Container(
                    padding: const EdgeInsets.all(18),
                    width: width(context) - 35,
                    decoration: BoxDecoration(
                      color: ColorsClass.colorwhite,
                      border: Border.all(color: Colors.grey.shade300, width: 2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        // Title
                        Row(
                          children: [
                            size.width(16),
                            Text(
                              "Account",
                              style: styling.maintitle.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        size.height(13),

                        // Avatar
                        Center(
                          child: Stack(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFFE5D4FB),
                                ),
                                padding: const EdgeInsets.all(1),
                                child: const CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage:
                                      AssetImage("assets/images/person.png"),
                                ),
                              ),
                              // Edit Icon
                              Positioned(
                                bottom: 0,
                                right: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    border:
                                        Border.all(color: Colors.grey.shade300),
                                  ),
                                  padding: const EdgeInsets.all(4),
                                  child: Icon(Icons.mode_edit_outlined,
                                      color: ColorsClass.primary, size: 20),
                                ),
                              )
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Name Field
                        buildField(
                            label: "Name",
                            value: state is SettingscubitLoaded
                                ? state.name
                                : cubit.name),

                        // Email Field
                        buildField(
                            label: "Email",
                            value: state is SettingscubitLoaded
                                ? state.email
                                : cubit.email),
                        // Phone Number Field
                        ProfilePhoneNumberField(),

                        ProfileGradientSameAs(
                          text: LangClass.translate(context, 'sameAsWhatsapp'),
                        ),
                        size.height(25),
                        // Password Field
                        buildPasswordField(
                          label: "Password",
                          value: state is SettingscubitLoaded
                              ? state.pass
                              : cubit.pass,
                        ),
                        // Bio Field
                        buildBioField(label: "Bio", value: "Bio"),
                        size.height(10),
                        // Bio Buttons
                        buildBioButtons(
                          onSave: () {
                            // Handle save action
                          },
                          onCancel: () {
                            // Handle cancel action
                          },
                        ),
                        size.height(10),
                        Row(
                          children: [
                            size.width(16),
                            Text(
                              "Theme Switch",
                              style: styling.maintitle.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            size.width(10),
                            // Switch(
                            //     value: isChecked(),
                            //     onChanged: (newValue) {
                            //       widget.onThemeChanged(
                            //           newValue); // Calls toggleTheme() from MyApp
                            //     }),
                          ],
                        ),
                        size.height(10),
                        // Delete Account Section
                        buildDeleteAccountSection(
                          onDelete: () {
                            context.navigateTo(const LogoutScreen());
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
