import 'package:flutter/cupertino.dart';
import 'package:gradution_project/Core/Imports/common_imports.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Deleteaccount extends StatefulWidget {
  const Deleteaccount({super.key});

  @override
  State<Deleteaccount> createState() => _DeleteaccountState();
}

class _DeleteaccountState extends State<Deleteaccount> {
  final TextEditingController pass = TextEditingController();
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delete Account",
            style: styling.maintitle.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            )),
        backgroundColor: ColorsClass.colorwhite,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              color: ColorsClass.text, size: 23),
          onPressed: () {
            context.goBack(); // Custom goBack function
          },
        ),
        actions: const [
          Icon(Icons.more_vert, color: ColorsClass.text, size: 23)
        ],
      ),
      body: BlocProvider(
        create: (context) =>
            SettingscubitCubit(Userrepo(api: DioConsumer(dio: Dio()))),
        child: BlocConsumer<SettingscubitCubit, SettingscubitState>(
          listener: (context, state) {
            if (state is DeleteAccountSucces) {
              showTopSnackBar(
                Overlay.of(context),
                const CustomSnackBar.info(
                  message: 'Account Deleted  successfuly',
                ),
              );
              context.navigateTo(SignUpScreen());
            }
            if (state is DeleteAccountFail) {
              showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.error(
                  message: state.message,
                ),
              );
            }
          },
          builder: (context, state) {
            final cubit = BlocProvider.of<SettingscubitCubit>(context);
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 400,
                    width: 400,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/deleteAcccount1.png"),
                      ),
                    ),
                  ),
                  size.height(5),
                  Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Enter your password ",
                          style: styling.subtitle.copyWith(
                              color: const Color.fromARGB(255, 132, 133, 136),
                              fontSize: 20)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: pass,
                      obscureText: true,
                      style: styling.subtitle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ColorsClass.text,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: isError
                                ? Colors.red
                                : ColorsClass.text.withOpacity(0.5),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: isError
                                ? Colors.red
                                : ColorsClass.text.withOpacity(0.6),
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorText: isError ? "Password is required" : null,
                      ),
                    ),
                  ),
                  size.height(30),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isError = pass.text.isEmpty;
                        });
                        if (!isError) {
                          showDialog(
                            context: context,
                            builder: (context) => ConfirmDeleteDialog(
                              onConfirm: () {
                                cubit.deleteAccount(pass.text);
                              },
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 218, 61, 61),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "    Delete Account    ",
                        style: styling.subtitle.copyWith(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
