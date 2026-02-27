import 'package:imei/Screen/exel/import_excel.dart';
import 'package:imei/library.dart';

class LostCreate extends StatefulWidget {
  const LostCreate({Key? key}) : super(key: key);

  @override
  State<LostCreate> createState() => _LostCreateState();
}

class _LostCreateState extends State<LostCreate> {
  String unvon = "";
  String nomlanish = "";
  String rusumi = "";
  String rangi = "";

  TextEditingController? imeiController;
  TextEditingController? seriaController;
  TextEditingController? soniController;
  TextEditingController? simController;
  TextEditingController? modelController;
  TextEditingController? zavodController;
  TextEditingController? shortInfoController;
  TextEditingController? fullnameController;
  TextEditingController? numberController;
  TextEditingController? jshshirController;
  TextEditingController? shakl1Controller;

  int page = 1;

  @override
  void initState() {
    seriaController = TextEditingController();
    soniController = TextEditingController(text: "1");
    imeiController = TextEditingController();
    simController = TextEditingController();
    modelController = TextEditingController();
    zavodController = TextEditingController();
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
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: EdgeInsets.only(left: 20, right: 20, top: 40),
        color: Color.fromRGBO(68, 68, 68, 1),
        child: SingleChildScrollView(
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
                      Container(
                        width: Get.width - 160.w,
                        child: Text(
                          "Yoqolgan buyumni xisobga qo'yish".toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Colors.grey.shade300,
                              letterSpacing: 1,
                              shadows: [
                                Shadow(
                                  offset: Offset(.5, .5),
                                  color: Colors.red,
                                )
                              ]),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        child: IconButton(onPressed: ()=>ImportExcel(), icon: Icon(Icons.cloud_download , color: Colors.white, size: 36,)),
                      ),
                    ],
                  ),
                  SizedBox(height: page == 2 ? 10.h : 0),
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
                                    // await ITSPost().itsPost(
                                    //   imei: imeiController!.text,
                                    //   model: modelController!.text,
                                    // );
                                    // if (dataService['status']) {
                                    //   Get.off(ListImImeiLost());
                                    // }
                                    Get.off(ListImImeiLost());
                                    // Get.snackbar(
                                    //   'Successful',
                                    //   "Ma'lumotlari kiritildi !!!",
                                    //   backgroundColor: Colors.green.shade800,
                                    //   maxWidth: double.infinity,
                                    //   margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0)
                                    // );

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Ma'lumotlar saqlandi.",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey.shade200,
                                          ),
                                        ),
                                        showCloseIcon: true,
                                        closeIconColor: Colors.teal.shade800,
                                        backgroundColor: Colors.teal.shade300,
                                      ),
                                    );
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
          "Seria:",
          style: TextStyle(color: Colors.grey.shade400),
        ),
        Container(
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: TextFormField(
            controller: seriaController,
            cursorColor: Colors.grey.shade200,
            cursorWidth: 1,
            keyboardType: TextInputType.text,
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
          "Gruhga oid:",
          style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        ),
        SizedBox(height: 2),
        Container(
          width: Get.width,
          child: DropdownButtonFormField(
            focusColor: Colors.transparent,
            hint: Text(
              "Aloqa vositalari".toUpperCase(),
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade400,
                letterSpacing: .5,
              ),
            ),
            iconEnabledColor: Colors.grey.shade400,
            dropdownColor: Color.fromRGBO(80, 80, 80, 1),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 14, right: 14),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
            items: [
              unvonIIB("Aloqa Vositalari"),
            ],
            onChanged: (e) {
              unvon = e!;
              setState(() {});
            },
          ),
        ),
        SizedBox(height: 12),
        Text(
          "Nomlanishi:",
          style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        ),
        SizedBox(height: 2),
        Container(
          width: Get.width,
          child: DropdownButtonFormField(
            focusColor: Colors.transparent,
            hint: Text(
              "Uyali telefon apparati".toUpperCase(),
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade400,
                letterSpacing: .5,
              ),
            ),
            iconEnabledColor: Colors.grey.shade400,
            dropdownColor: Color.fromRGBO(80, 80, 80, 1),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 14, right: 14),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
            items: [
              nomlanishi("Uyali telefon apparati"),
            ],
            onChanged: (e) {
              unvon = e!;
              setState(() {});
            },
          ),
        ),
        SizedBox(height: 12),
        Text(
          "Soni:",
          style: TextStyle(color: Colors.grey.shade400),
        ),
        Container(
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: TextFormField(
            controller: soniController,
            cursorColor: Colors.grey.shade200,
            cursorWidth: 1,
            keyboardType: TextInputType.phone,
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
          "Rusumi:",
          style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        ),
        SizedBox(height: 2),
        Container(
          width: Get.width,
          child: DropdownButtonFormField(
            focusColor: Colors.transparent,
            hint: Text(
              "Tanlang...",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
                letterSpacing: .5,
              ),
            ),
            iconEnabledColor: Colors.grey.shade400,
            dropdownColor: Color.fromRGBO(80, 80, 80, 1),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 14, right: 14),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
            items: [
              rusumiFunc("IPhone"),
              rusumiFunc("Samsung"),
              rusumiFunc("Redmi"),
              rusumiFunc("Huawie"),
              rusumiFunc("VIva"),
              rusumiFunc("Nokia"),
            ],
            onChanged: (e) {
              rusumi = e!;
              setState(() {});
            },
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
          "Zavod Firma:",
          style: TextStyle(color: Colors.grey),
        ),
        Container(
          height: 48,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r)),
          child: TextFormField(
            controller: zavodController,
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
          "Rangi:",
          style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        ),
        SizedBox(height: 2),
        Container(
          width: Get.width,
          child: DropdownButtonFormField(
            focusColor: Colors.transparent,
            hint: Text(
              "Tanlang...",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade600,
                letterSpacing: .8,
              ),
            ),
            iconEnabledColor: Colors.grey.shade400,
            dropdownColor: Color.fromRGBO(80, 80, 80, 1),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 14, right: 14),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
            items: [
              rangiFunc("Oq"),
              rangiFunc("Qora"),
            ],
            onChanged: (e) {
              rangi = e!;
              setState(() {});
            },
          ),
        ),
        SizedBox(height: 12),
        Text(
          "Tegishlilik:",
          style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        ),
        SizedBox(height: 2),
        Container(
          width: Get.width,
          child: DropdownButtonFormField(
            focusColor: Colors.transparent,
            hint: Text(
              "Tanlang...",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade600,
                letterSpacing: .8,
              ),
            ),
            iconEnabledColor: Colors.grey.shade400,
            dropdownColor: Color.fromRGBO(80, 80, 80, 1),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 14, right: 14),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
            items: [
              rangiFunc("Jismoniy shaxs"),
            ],
            onChanged: (e) {
              rangi = e!;
              setState(() {});
            },
          ),
        ),
        SizedBox(height: 12),
        Text(
          "Xususiyatlari:",
          style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        ),
        SizedBox(height: 2),
        Container(
          width: Get.width,
          child: DropdownButtonFormField(
            focusColor: Colors.transparent,
            hint: Text(
              "Tanlang...",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade600,
                letterSpacing: .8,
              ),
            ),
            iconEnabledColor: Colors.grey.shade400,
            dropdownColor: Color.fromRGBO(80, 80, 80, 1),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 14, right: 14),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
            items: [
              rangiFunc("Ekrani singan"),
            ],
            onChanged: (e) {
              rangi = e!;
              setState(() {});
            },
          ),
        ),
        SizedBox(height: 12),
        Text(
          "Ishlab chiqarilgan yili:",
          style: TextStyle(color: Colors.grey),
        ),
        Container(
          height: 48,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r)),
          child: TextFormField(
            controller: zavodController,
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
          "Buyum foto surati",
          style: TextStyle(color: Colors.grey),
        ),
        Container(
          height: 48,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r)),
          child: TextFormField(
            controller: zavodController,
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
      ],
    );
  }

  owner() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Xisobga qo'yish sababi:",
          style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        ),
        SizedBox(height: 2),
        Container(
          width: Get.width,
          child: DropdownButtonFormField(
            focusColor: Colors.transparent,
            hint: Text(
              "Tanlang...",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade600,
                letterSpacing: .8,
              ),
            ),
            iconEnabledColor: Colors.grey.shade400,
            dropdownColor: Color.fromRGBO(80, 80, 80, 1),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 14, right: 14),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
            items: [
              rangiFunc("Ekrani singan"),
            ],
            onChanged: (e) {
              rangi = e!;
              setState(() {});
            },
          ),
        ),
        SizedBox(height: 12),
        Text(
          "Xisob turi:",
          style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        ),
        SizedBox(height: 2),
        Container(
          width: Get.width,
          child: DropdownButtonFormField(
            focusColor: Colors.transparent,
            hint: Text(
              "Tanlang...",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade600,
                letterSpacing: .8,
              ),
            ),
            iconEnabledColor: Colors.grey.shade400,
            dropdownColor: Color.fromRGBO(80, 80, 80, 1),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 14, right: 14),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
            items: [
              rangiFunc("Ekrani singan"),
            ],
            onChanged: (e) {
              rangi = e!;
              setState(() {});
            },
          ),
        ),
        SizedBox(height: 12),
        Text(
          "Xujjat raqami (22387/2024):",
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
            keyboardType: TextInputType.phone,
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
        SizedBox(height: 12),
        Text(
          "Xujjat yurutilgan sanasi:",
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
            keyboardType: TextInputType.phone,
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
        SizedBox(height: 12),
        Text(
          "Tashkilot:",
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
        SizedBox(height: 12),
        Text(
          "Xudud:",
          style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        ),
        SizedBox(height: 2),
        Container(
          width: Get.width,
          child: DropdownButtonFormField(
            focusColor: Colors.transparent,
            hint: Text(
              "Tanlang...",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade600,
                letterSpacing: .8,
              ),
            ),
            iconEnabledColor: Colors.grey.shade400,
            dropdownColor: Color.fromRGBO(80, 80, 80, 1),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 14, right: 14),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
            items: [
              rangiFunc("Ekrani singan"),
            ],
            onChanged: (e) {
              rangi = e!;
              setState(() {});
            },
          ),
        ),
        SizedBox(height: 12),
        Text(
          "Organ:",
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
            keyboardType: TextInputType.name,
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
        SizedBox(height: 12),
        Text(
          "Modda:",
          style: TextStyle(color: Colors.grey.shade400),
        ),
        SizedBox(height: 2),
        Container(
          width: Get.width,
          child: DropdownButtonFormField(
            focusColor: Colors.transparent,
            hint: Text(
              "Tanlang...",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade600,
                letterSpacing: .8,
              ),
            ),
            iconEnabledColor: Colors.grey.shade400,
            dropdownColor: Color.fromRGBO(80, 80, 80, 1),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 14, right: 14),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
            items: [
              rangiFunc("168"),
            ],
            onChanged: (e) {
              rangi = e!;
              setState(() {});
            },
          ),
        ),
        SizedBox(height: 12),
        Text(
          "Qism:",
          style: TextStyle(color: Colors.grey.shade400),
        ),
        SizedBox(height: 2),
        Container(
          width: Get.width,
          child: DropdownButtonFormField(
            focusColor: Colors.transparent,
            hint: Text(
              "Tanlang...",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade600,
                letterSpacing: .8,
              ),
            ),
            iconEnabledColor: Colors.grey.shade400,
            dropdownColor: Color.fromRGBO(80, 80, 80, 1),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 14, right: 14),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
            items: [
              rangiFunc("3-qismi"),
            ],
            onChanged: (e) {
              rangi = e!;
              setState(() {});
            },
          ),
        ),
        SizedBox(height: 12),
        Text(
          "Band:",
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
            keyboardType: TextInputType.name,
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
        SizedBox(height: 16),
      ],
    );
  }

  DropdownMenuItem unvonIIB(unvon) => DropdownMenuItem(
        child: Text(
          unvon.toUpperCase(),
          style: TextStyle(fontSize: 13, color: Colors.grey.shade300),
        ),
        value: unvon,
        onTap: () {},
      );
  DropdownMenuItem nomlanishi(nomlanish) => DropdownMenuItem(
        child: Text(
          nomlanish.toUpperCase(),
          style: TextStyle(fontSize: 13, color: Colors.grey.shade300),
        ),
        value: nomlanish,
        onTap: () {},
      );
  DropdownMenuItem rusumiFunc(rusumi) => DropdownMenuItem(
        child: Text(
          rusumi.toUpperCase(),
          style: TextStyle(fontSize: 13, color: Colors.grey.shade300),
        ),
        value: rusumi,
        onTap: () {},
      );
  DropdownMenuItem rangiFunc(rangi) => DropdownMenuItem(
        child: Text(
          rangi.toUpperCase(),
          style: TextStyle(fontSize: 13, color: Colors.grey.shade300),
        ),
        value: rangi,
        onTap: () {},
      );
}
