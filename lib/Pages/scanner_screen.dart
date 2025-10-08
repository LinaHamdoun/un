import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:untitled/Colors/colors_screens.dart';

import '../Component/container_icon.dart';
import '../Component/corner_painter.dart';
import 'home_screen.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({super.key});

  @override
  State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  final MobileScannerController controller = MobileScannerController();
  TextEditingController textEditingController = TextEditingController();
  String? scannedCode;
  String? capturedCode;

  @override
  void dispose() {
    controller.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                MobileScanner(
                  controller: controller,
                  onDetect: (capture) {
                    final List<Barcode> barcodes = capture.barcodes;
                    if (barcodes.isNotEmpty) {
                      setState(() {
                        scannedCode = barcodes.first.rawValue;
                        textEditingController.text = scannedCode ?? '';
                      });
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 60.h, left: 12.w, right: 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ContainerIcon(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        },
                        valueRadius: 300.r,
                        icon: Icon(
                          Icons.close,
                          size: 20.h,
                          color: Colors.white,
                        ),
                        color: Colors.grey,
                      ),
                      ContainerIcon(
                        onTap: () {},
                        valueRadius: 300.r,
                        icon: Icon(
                          Icons.arrow_forward_outlined,
                          color: Colors.white,
                          size: 20.h,
                        ),
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),

                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: 80.h,
                      right: 30.w,
                      left: 30.w,
                    ),
                    child: CustomPaint(
                      size: Size(346.w, 372.h),
                      painter: RoundedCornerPainter(),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Spacer(flex: 1),
                      Text(
                        'أو أدخل الكود يدوياً',
                        style: TextStyle(color: ColorsScreens.grey),
                      ),

                      TextFormField(
                        controller: textEditingController,
                        style: const TextStyle(color: ColorsScreens.grey),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),

                      Row(
                        children: [
                          ContainerIcon(
                            onTap: () {
                              controller.toggleTorch();
                            },
                            valueRadius: 300,
                            icon: Icon(
                              Icons.flash_on,
                              size: 20.h,
                              color: ColorsScreens.amber,
                            ),
                            color: Colors.white,
                          ),
                          Spacer(flex: 2),

                          IconButton(
                            icon: Icon(
                              Icons.radio_button_on_rounded,
                              color: Colors.white,
                              size: 80.h,
                            ),
                            onPressed: () {
                              setState(() {
                                capturedCode = scannedCode;

                                // sent code to api
                              });
                            },
                          ),
                          Spacer(flex: 3),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).padding.bottom + 30.h,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
