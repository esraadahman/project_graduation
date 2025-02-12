import 'package:flutter/cupertino.dart';
import 'package:project_graduation/Core/Imports/common_imports.dart';



class Nameinputfiled extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController? controller;
  final List<String> items;

  const Nameinputfiled({
    Key? key,
    required this.labelText,
    this.hintText = "",
    this.controller,
    required this.items,
  }) : super(key: key);

  @override
  State<Nameinputfiled> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<Nameinputfiled> {
  String? _selectedValue;
  final HiveConstants hiveService = HiveConstants();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddWorkspaceCubit(Userrepo(api: DioConsumer(dio: Dio()))),
      child: BlocConsumer<AddWorkspaceCubit, AddWorkspaceState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<AddWorkspaceCubit>(context);
          return Container(
            width: width(context) * 0.9,
            margin: EdgeInsets.only(
                left: width(context) * .05, right: width(context) * .05),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(widget.labelText,
                      style: styling.subtitle.copyWith(
                          color: ColorsClass.password_text, fontSize: 14)),
                ),
                size.height(5),
                SizedBox(
                  width: width(context),
                  height: height(context) * .07,
                  child: TextFormField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                color: ColorsClass.border_color, width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                color: ColorsClass.border_color, width: 1)),
                        hintText: widget.hintText,
                        hintStyle: styling.subtitle.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 14)),
                    controller: cubit.workSpaceName,
                  ),
                ),
                size.height(40),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Category",
                      style: styling.subtitle.copyWith(
                          color: ColorsClass.password_text, fontSize: 14)),
                ),
                size.height(5),
                SizedBox(
                  width: width(context),
                  height: height(context) * 0.07,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: ColorsClass.border_color, width: 1.0),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: DropdownButton<String>(
                        value: _selectedValue,
                        borderRadius: BorderRadius.circular(10),
                        icon: Transform.rotate(
                          angle: 4.7124, // Rotate the icon to point down
                          child: Icon(Icons.arrow_back_ios_new,
                              color: ColorsClass.text),
                        ),
                        isExpanded: true,
                        hint: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Choose your project category',
                              style: styling.subtitle.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedValue = newValue;
                          });
                        },
                        underline: SizedBox(),
                        items: widget.items
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: styling.subtitle.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                size.height(40),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Objective",
                      style: styling.subtitle.copyWith(
                          color: ColorsClass.password_text, fontSize: 14)),
                ),
                size.height(5),
                SizedBox(
                  width: width(context),
                  height: height(context) * .25,
                  child: TextFormField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                color: ColorsClass.border_color, width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                color: ColorsClass.border_color, width: 1)),
                        hintText: "Enter your project objectives ",
                        hintStyle: styling.subtitle.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 14)),
                    controller: cubit.workSpaceDescription,
                    minLines: 7,
                    maxLines: 10,
                  ),
                ),
                size.height(40),
                Confirmbutton(
                    text: "Next",
                    onTap: () async{
                       await hiveService.saveData(
                      "workspaceName",
                      cubit.workSpaceName.text,
                    );
                    await hiveService.saveData(
                      "workspaceDescription",
                      cubit.workSpaceDescription.text,
                    );
                      context.navigateTo(StageScreen());
                    }),
                size.height(30),
              ],
            ),
          );
        },
      ),
    );
  }
}
