import 'package:flutter/cupertino.dart';
import 'package:gradution_project/Core/Imports/common_imports.dart';
import 'package:http/http.dart' as http;

class DownloadPage extends StatelessWidget {
  final int groupId;

  const DownloadPage({required this.groupId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DownloadCubit(Userrepo(api: DioConsumer(dio: Dio())))
        ..fetchDownloadLink(groupId),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsClass.lightBlue2,
          title: Text(
            'Download Document',
            style: styling.maintitle.copyWith(fontSize: 20),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: ColorsClass.text),
            onPressed: () {
              context.goBack();
            },
          ),
          actions: const [
            Icon(Icons.more_vert, color: Colors.black),
            SizedBox(width: 8),
          ],
        ),
        body: BlocBuilder<DownloadCubit, DownloadState>(
          builder: (context, state) {
            return Stack(
              children: [
                // Background Image
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/back_mask.png'), // Your background image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Foreground Content
                if (state is DownloadLoading)
                  const Center(
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
                else if (state is DownloadSuccess)
                  Center(
                    child: Column(
                      children: [
                        size.height(100),
                        Container(
                          width: 200,
                          height: 200,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/dowenload.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        size.height(20),
                        Text(
                          "Documentation Generated Succesfully",
                          style: styling.maintitle.copyWith(
                            fontSize: 20,
                            color: ColorsClass.primary,
                          ),
                        ),
                        size.height(40),
                        GestureDetector(
                          onTap: () async {
                            final url =
                                "https://Bridgeit-Bridgeit.hf.space${state.downloadUrl}";

                            try {
                              if (Platform.isAndroid) {
                                final status =
                                    await Permission.storage.request();
                                if (!status.isGranted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("Storage permission denied")),
                                  );
                                  return;
                                }
                              }
                              final Box box = Hive.box(HiveConstants.Boxname);
                              final token =
                                  box.get(ApiKey.token, defaultValue: "");
                              final response = await http.get(
                                Uri.parse(url),
                                headers: {
                                  if (token != null && token.isNotEmpty)
                                    "Authorization": "Bearer $token",
                                  "Accept": "application/json",
                                },
                              );

                              if (response.statusCode == 200) {
                                final dir =
                                    Directory("/storage/emulated/0/Download");
                                final filePath = "${dir.path}/report.docx";
                                final file = File(filePath);

                                await file.writeAsBytes(response.bodyBytes);

                                showTopSnackBar(
                                  Overlay.of(context),
                                  CustomSnackBar.info(
                                    message:
                                        '✅ Downloaded to: $filePath  successfuly',
                                  ),
                                );
                                await OpenFilex.open(filePath);
                              } else {
                                showTopSnackBar(
                                  Overlay.of(context),
                                  const CustomSnackBar.error(
                                    message:
                                        "Failed to download: Some thing Wrong",
                                  ),
                                );
                              }
                            } catch (e) {
                              showTopSnackBar(
                                Overlay.of(context),
                                CustomSnackBar.error(
                                  message: "Download failed: $e",
                                ),
                              );
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 32),
                            decoration: BoxDecoration(
                              gradient: ColorsClass.appGradient,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              " Download Documenation",
                              style: TextStyle(
                                color: ColorsClass.colorwhite,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}
