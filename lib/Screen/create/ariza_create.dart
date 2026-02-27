import 'package:imei/library.dart';

class ArizaCreate extends StatefulWidget {
  const ArizaCreate({Key? key}) : super(key: key);

  @override
  State<ArizaCreate> createState() => _ArizaCreateState();
}

class _ArizaCreateState extends State<ArizaCreate> {
  TextEditingController? imeiController;
  TextEditingController? simController;
  TextEditingController? modelController;
  TextEditingController? colorController;
  TextEditingController? shortInfoController;
  TextEditingController? fullnameController;
  TextEditingController? numberController;
  TextEditingController? jshshirController;
  TextEditingController? shakl1Controller;

  int page = 1;

  @override
  void initState() {
    imeiController = TextEditingController();
    simController = TextEditingController();
    modelController = TextEditingController();
    colorController = TextEditingController();
    shortInfoController = TextEditingController();
    fullnameController = TextEditingController();
    numberController = TextEditingController();
    jshshirController = TextEditingController();
    shakl1Controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          height: Get.height,
          padding: EdgeInsets.only(left: 20, right: 20, top: 40),
          color: Color.fromRGBO(68, 68, 68, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      Text(
                        "ARIZA",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Colors.grey.shade300,
                          letterSpacing: 1.5,
                        ),
                      ),
                      Container(width: 30),
                    ],
                  ),
                  SizedBox(height: page == 2 ? 10.h : 0),
                  page == 2
                      ? Text(
                          "* Qurilma egasining ma'lumotlari.",
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            color: Colors.teal.shade300,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.start,
                        )
                      : Container(),
                  SizedBox(height: 14.h),
                  page == 1 ? imei() : owner()
                ],
              ),
              page == 1
                  ? Container(
                      width: Get.width - 40,
                      margin: EdgeInsets.only(bottom: 30),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                alignment: Alignment.center,
                                child: Text(
                                  "1",
                                  style: TextStyle(
                                    color: Colors.grey.shade100,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              SizedBox(width: 14),
                              Container(
                                width: 26,
                                height: 26,
                                alignment: Alignment.center,
                                child: Text(
                                  "2",
                                  style: TextStyle(
                                    color: Colors.teal.shade900,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(.2),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: Get.width / 2 - 32,
                                height: 48,
                                child: ElevatedButton.icon(
                                  onPressed: () async {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.white.withOpacity(.1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  label: Text(
                                    "OLDINGI",
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: Get.width / 2 - 32,
                                height: 48,
                                child: ElevatedButton.icon(
                                  onPressed: () async {
                                    page = 2;
                                    setState(() {});
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.teal,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  label: Text(
                                    "KEYINGI",
                                    style: TextStyle(
                                      color: Colors.grey.shade200,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: .5,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : Container(
                      width: Get.width - 40,
                      margin: EdgeInsets.only(bottom: 30),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 26,
                                height: 26,
                                alignment: Alignment.center,
                                child: Text(
                                  "1",
                                  style: TextStyle(
                                    color: Colors.teal.shade900,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(.2),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              SizedBox(width: 14),
                              Container(
                                width: 30,
                                height: 30,
                                alignment: Alignment.center,
                                child: Text(
                                  "2",
                                  style: TextStyle(
                                    color: Colors.grey.shade200,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: Get.width / 2 - 32,
                                height: 48,
                                child: ElevatedButton.icon(
                                  onPressed: () async {
                                    page = 1;
                                    setState(() {});
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey.shade200,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: BorderSide(
                                            color: Colors.teal, width: 3)),
                                  ),
                                  label: Text(
                                    "OLDINGI",
                                    style: TextStyle(
                                      color: Colors.teal,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: Get.width / 2 - 32,
                                height: 48,
                                child: ElevatedButton.icon(
                                  onPressed: () async {
                                    // Validatsiya
                                    if (imeiController!.text.isEmpty ||
                                        simController!.text.isEmpty ||
                                        modelController!.text.isEmpty ||
                                        colorController!.text.isEmpty ||
                                        fullnameController!.text.isEmpty ||
                                        numberController!.text.isEmpty ||
                                        jshshirController!.text.isEmpty) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            "Barcha maydonlarni to'ldiring!",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                          backgroundColor: Colors.red.shade400,
                                        ),
                                      );
                                      return;
                                    }

                                    // Loading indicator
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (context) => Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.teal,
                                        ),
                                      ),
                                    );

                                    try {
                                      print('\n=== ARIZA YARATISH BOSHLANDI ===');
                                      
                                      // Telefon raqamlarni formatlash
                                      String simNumber = simController!.text.replaceAll(RegExp(r'[^0-9]'), '');
                                      String phoneNumber = numberController!.text.replaceAll(RegExp(r'[^0-9]'), '');
                                      
                                      // 998 prefiksini qo'shish (agar yo'q bo'lsa)
                                      if (simNumber.isNotEmpty && !simNumber.startsWith('998')) {
                                        simNumber = '998' + simNumber;
                                      }
                                      if (phoneNumber.isNotEmpty && !phoneNumber.startsWith('998')) {
                                        phoneNumber = '998' + phoneNumber;
                                      }
                                      
                                      print('Formatted simNumber: $simNumber');
                                      print('Formatted phoneNumber: $phoneNumber');
                                      
                                      var result = await ArizaPost().arizaPost(
                                        imei: imeiController!.text.replaceAll(' ', ''),
                                        last_simcard: simNumber,
                                        model: modelController!.text,
                                        color: colorController!.text,
                                        jshir: jshshirController!.text.replaceAll(' ', ''),
                                        phone_number: phoneNumber,
                                        fish: fullnameController!.text,
                                      );
                                      print('Result: $result');

                                      // Close loading
                                      Navigator.pop(context);

                                      if (result['success'] == true) {
                                        print('✅ Success! Updating provider...');
                                        // Kichik kutish - serverga vaqt berish
                                        await Future.delayed(Duration(milliseconds: 500));
                                        // Provider ni yangilash
                                        await context.read<ArizaProvider>().getData();
                                        print('Provider updated');
                                        
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              result['message'] ?? "Ma'lumotlar saqlandi",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                              ),
                                            ),
                                            backgroundColor: Colors.green.shade600,
                                          ),
                                        );
                                        
                                        // Orqaga qaytish
                                        Get.off(ListImImeiLost());
                                      } else {
                                        print('❌ Error result: ${result}');
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              result['message'] ?? "Xatolik yuz berdi",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                              ),
                                            ),
                                            backgroundColor: Colors.red.shade600,
                                          ),
                                        );
                                      }
                                    } catch (e, stackTrace) {
                                      // Close loading if open
                                      try {
                                        Navigator.of(context, rootNavigator: true).pop();
                                      } catch (_) {}
                                      print('❌ EXCEPTION in UI: $e');
                                      print('Stack trace: $stackTrace');
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            "Xatolik: $e",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                          backgroundColor: Colors.red.shade600,
                                          duration: Duration(seconds: 5),
                                        ),
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.teal,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  label: Text(
                                    "SAQLASH",
                                    style: TextStyle(
                                      color: Colors.grey.shade200,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: .5,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  imei() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "IMEI:",
          style: TextStyle(color: Colors.grey.shade400),
        ),
        Container(
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: TextFormField(
            controller: imeiController,
            cursorColor: Colors.grey.shade200,
            cursorWidth: 1,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade200),
            inputFormatters: [
              TextInputMask(
                mask: '\\ 999999999999999',
                placeholder: '_ ',
                maxPlaceHolders: 15,
              )
            ],
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey),
              ),
              contentPadding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 12,
              ),
              border: InputBorder.none,
              suffixIcon: Icon(
                Icons.qr_code_scanner_outlined,
                size: 26,
                color: Colors.grey.shade400,
              ),
            ),
          ),
        ),
        SizedBox(height: 12),
        Text(
          "Oxirgi ishlagan SIM:",
          style: TextStyle(color: Colors.grey.shade400),
        ),
        Container(
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: TextFormField(
            inputFormatters: [
              TextInputMask(
                mask: '\\ (99) 999-99-99',
                placeholder: '_ ',
                maxPlaceHolders: 9,
              )
            ],
            controller: simController,
            cursorColor: Colors.grey.shade200,
            cursorWidth: 1,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade200),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey),
              ),
              contentPadding: EdgeInsets.only(
                left: 4,
                right: 10,
                top: 12,
              ),
              border: InputBorder.none,
              suffixIcon: Icon(
                Icons.sim_card_sharp,
                size: 24,
                color: Colors.grey.shade400,
              ),
            ),
          ),
        ),
        SizedBox(height: 12),
        Text(
          "Modeli:",
          style: TextStyle(color: Colors.grey.shade400),
        ),
        Container(
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: TextFormField(
            controller: modelController,
            cursorColor: Colors.grey.shade200,
            cursorWidth: 1,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade200),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey),
              ),
              contentPadding: EdgeInsets.only(
                left: 12,
                right: 10,
                top: 12,
              ),
              border: InputBorder.none,
              suffixIcon: Icon(
                Icons.smartphone,
                size: 24,
                color: Colors.grey.shade400,
              ),
            ),
          ),
        ),
        SizedBox(height: 12),
        Text(
          "Rangi:",
          style: TextStyle(color: Colors.grey),
        ),
        Container(
          height: 48,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r)),
          child: TextFormField(
            controller: colorController,
            cursorColor: Colors.grey.shade200,
            cursorWidth: 1,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade200),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey),
              ),
              contentPadding: EdgeInsets.only(
                left: 12,
                right: 10,
                top: 12,
              ),
              border: InputBorder.none,
              suffixIcon: Icon(
                Icons.color_lens_outlined,
                size: 24,
                color: Colors.grey.shade400,
              ),
            ),
          ),
        ),
        SizedBox(height: 12),
        Text(
          "Holat haqida ma'lumot:",
          style: TextStyle(color: Colors.grey.shade400),
        ),
        Container(
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: TextFormField(
            controller: shortInfoController,
            cursorColor: Colors.grey.shade200,
            cursorWidth: 1,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade200),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey),
              ),
              contentPadding: EdgeInsets.only(
                left: 12,
                right: 10,
                top: 12,
              ),
              border: InputBorder.none,
              suffixIcon: Icon(
                Icons.info_outline,
                size: 24,
                color: Colors.grey.shade400,
              ),
            ),
          ),
        ),
      ],
    );
  }

  owner() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "F.I.SH:",
          style: TextStyle(color: Colors.grey.shade400, fontSize: 13),
        ),
        Container(
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: TextFormField(
            controller: fullnameController,
            cursorColor: Colors.grey.shade200,
            cursorWidth: 1,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade200),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey),
              ),
              contentPadding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 12,
              ),
              border: InputBorder.none,
              suffixIcon: Icon(
                Icons.person,
                size: 24,
                color: Colors.grey.shade400,
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
        Text(
          "Tel:",
          style: TextStyle(color: Colors.grey.shade400),
        ),
        Container(
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: TextFormField(
            inputFormatters: [
              TextInputMask(
                mask: '\\ (99) 999-99-99',
                placeholder: '_ ',
                maxPlaceHolders: 9,
              )
            ],
            controller: numberController,
            cursorColor: Colors.grey.shade200,
            cursorWidth: 1,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade200),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey),
              ),
              contentPadding: EdgeInsets.only(
                left: 4,
                right: 10,
                top: 12,
              ),
              border: InputBorder.none,
              suffixIcon: Icon(
                Icons.phone,
                size: 24,
                color: Colors.grey.shade400,
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
        Text(
          "JSHSHIR:",
          style: TextStyle(color: Colors.grey.shade400, fontSize: 13),
        ),
        Container(
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: TextFormField(
            inputFormatters: [
              TextInputMask(
                mask: '\\ 99999999999999',
                placeholder: '_ ',
                maxPlaceHolders: 14,
              )
            ],
            controller: jshshirController,
            cursorColor: Colors.grey.shade200,
            cursorWidth: 1,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade200),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey),
              ),
              contentPadding: EdgeInsets.only(
                left: 4,
                right: 10,
                top: 12,
              ),
              border: InputBorder.none,
              suffixIcon: Icon(
                Icons.document_scanner,
                size: 22,
                color: Colors.grey.shade400,
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
        Text(
          "Shakl1 №:",
          style: TextStyle(color: Colors.grey.shade400),
        ),
        Container(
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: TextFormField(
            controller: shakl1Controller,
            cursorColor: Colors.grey.shade200,
            cursorWidth: 1,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade200,
            ),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey),
              ),
              contentPadding: EdgeInsets.only(
                left: 12,
                right: 10,
                top: 12,
              ),
              border: InputBorder.none,
              suffixIcon: Icon(
                Icons.discount,
                size: 22,
                color: Colors.grey.shade400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
