import 'package:flutter/cupertino.dart';
import 'package:gradution_project/Core/Imports/common_imports.dart';

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
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  late String phoneNumber;
  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              color: ColorsClass.text, size: 20),
          onPressed: () {
            context.goBack(); // This navigates back
          },
        ),
        actions: const [
          Icon(Icons.more_vert, color: ColorsClass.text, size: 20)
        ],
      ),
      // Body
      body: BlocProvider(
        create: (context) =>
            SettingscubitCubit(Userrepo(api: DioConsumer(dio: Dio())))
              ..getUserData(),
        child: BlocConsumer<SettingscubitCubit, SettingscubitState>(
          listener: (context, state) {
            if (state is GetUserDataSucces) {
              nameController.text = state.userdata.name;
              emailController.text = state.userdata.email;
              phoneNumber = state.userdata.phone ?? " ";
              bioController.text = state.userdata.bio ?? "bio not set";
            }
            if (state is GetUserDataFail) {
              final cubit = context.read<SettingscubitCubit>();
              nameController.text = cubit.name;
              emailController.text = cubit.email;
            }
            if (state is UploadImageSucces) {
              showTopSnackBar(
                Overlay.of(context),
                const CustomSnackBar.info(
                  message: 'Image Updated  successfuly',
                ),
              );
              //  context.navigateTo(NaviBar());
            }
            if (state is UploadImageFail) {
              showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.error(
                  message: state.message,
                ),
              );
            }
            if (state is UpdateUserFail) {
              showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.error(
                  message: state.message,
                ),
              );
            }
            if (state is UpdateUserSucces) {
              showTopSnackBar(
                Overlay.of(context),
                const CustomSnackBar.info(
                  message: 'Account Updated  successfuly',
                ),
              );
              context.navigateTo(NaviBar());
            }
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
                  state is GetUserDataLoading
                      ? const Center(
                          child: SizedBox(
                            width: 40.0,
                            height: 250.0,
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                CupertinoColors.activeBlue,
                                BlendMode.srcIn,
                              ),
                              child: CupertinoActivityIndicator(radius: 20.0),
                            ),
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.all(18),
                          width: width(context) - 35,
                          decoration: BoxDecoration(
                            color: ColorsClass.colorwhite,
                            border: Border.all(
                                color: Colors.grey.shade300, width: 2),
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
                                      child: CircleAvatar(
                                        radius: 50,
                                        // backgroundImage: state
                                        //             is GetUserDataSucces &&
                                        //         state
                                        //             .userdata.avatar!.isNotEmpty
                                        //     ? NetworkImage(
                                        //         // Fix the avatar URL to ensure it uses the correct domain/prefix
                                        //         state.userdata.avatar!.contains(
                                        //                 '/api/storage/avatars/')
                                        //             ? state.userdata.avatar!
                                        //             : state.userdata.avatar!
                                        //                 .replaceFirst(
                                        //                     '/avatars/',
                                        //                     '/api/storage/avatars/'))
                                        //     : state is UploadImageSucces
                                        //         ? NetworkImage(state.userdata.avatar!
                                        //                 .contains(
                                        //                     '/api/storage/avatars/')
                                        //             ? state.userdata.avatar!
                                        //             : state.userdata.avatar!
                                        //                 .replaceFirst(
                                        //                     '/avatars/',
                                        //                     '/api/storage/avatars/'))
                                        //         : AssetImage(
                                        //             "assets/images/person.png"),

                                        backgroundImage: (state
                                                    is GetUserDataSucces &&
                                                state.userdata.avatar != null)
                                            ? NetworkImage(
                                                cubit.formatAvatarUrl(
                                                    state.userdata.avatar!))
                                            : (state is UploadImageSucces &&
                                                    state.userdata.avatar !=
                                                        null)
                                                ? NetworkImage(
                                                    cubit.formatAvatarUrl(
                                                        state.userdata.avatar!))
                                                : const AssetImage(
                                                        "assets/images/person.png")
                                                    as ImageProvider,
                                      ),
                                    ),
                                    // Edit Icon
                                    Positioned(
                                      bottom: 0,
                                      right: 2,
                                      child: GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                            backgroundColor:
                                                ColorsClass.colorwhite,
                                            context: context,
                                            builder: (_) {
                                              return BottomsheetWidget(
                                                onImageSelected: (imageFile) {
                                                  cubit.uploadProfileImage(
                                                      imageFile);
                                                },
                                                onImageTaked: (imageFile) {
                                                  cubit.uploadProfileImage(
                                                      imageFile);
                                                },
                                              );
                                            },
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.grey.shade300),
                                          ),
                                          padding: const EdgeInsets.all(4),
                                          child: const Icon(
                                              Icons.mode_edit_outlined,
                                              color: ColorsClass.primary,
                                              size: 20),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              const SizedBox(height: 24),

                              // Name Field
                              buildField(
                                label: "Name",
                                controller: nameController,
                              ),

                              // Email Field
                              buildField(
                                  label: "Email", controller: emailController),
                              // Phone Number Field
                              ProfilePhoneNumberField(
                                onPhoneChanged: (phone) {
                                  setState(() {
                                    //   print("Phone number changed: $phone");
                                    phoneNumber = phone;
                                  });
                                },
                              ),

                              ProfileGradientSameAs(
                                text: LangClass.translate(
                                    context, 'sameAsWhatsapp'),
                              ),
                              size.height(25),
                              // Password Field
                              buildPasswordField(
                                  label: "Password",
                                  controller: passwordController),
                              // Bio Field
                              buildBioField(
                                  label: "Bio", controller: bioController),
                              size.height(10),
                              // Bio Buttons
                              buildBioButtons(
                                text: state is UpdateUserLoading
                                    ? "Loading...."
                                    : "Save",
                                onSave: () {
                                  // Handle save action

                                  // print(
                                  //     "phone ${phoneNumber}          name ${nameController.text}      , email ${emailController.text}              , pass${passwordController.text}      , bio ${bioController.text}");
                                  if (phoneNumber.isNotEmpty &&
                                      nameController.text.isNotEmpty &&
                                      emailController.text.isNotEmpty &&
                                      bioController.text.isNotEmpty) {
                                    cubit.UpdateUserData(
                                        name: nameController.text,
                                        email: emailController.text,
                                        phone: phoneNumber,
                                        bio: bioController.text);
                                  }
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
                                  Switch(
                                    value: isDark,
                                    onChanged: (newValue) {
                                      print("Switch value: $newValue");
                                      context
                                          .read<ThemeCubit>()
                                          .toggleTheme(newValue);
                                    },
                                  ),
                                ],
                              ),
                              size.height(10),
                              // Delete Account Section
                              buildDeleteAccountSection(
                                onDelete: () {
                                  context.navigateTo(Deleteaccount());
                                  //   context.navigateTo(const LogoutScreen());
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
