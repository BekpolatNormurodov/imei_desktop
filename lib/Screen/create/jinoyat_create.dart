import 'package:imei/library.dart';

class JinoyatCreate extends StatefulWidget {
  const JinoyatCreate({Key? key}) : super(key: key);

  @override
  State<JinoyatCreate> createState() => _JinoyatCreateState();
}

class _JinoyatCreateState extends State<JinoyatCreate> {
  TextEditingController? shortInfoController;
  TextEditingController? fullnameController;
  TextEditingController? jshshirController;
  TextEditingController? shakl1Controller;
  TextEditingController? imeiController1;
  TextEditingController? imeiController2;
  TextEditingController? imeiController3;
  TextEditingController? imeiController4;

  String nomer1 = '?';
  String nomer2 = '?';
  String nomer3 = '?';
  String nomer4 = '?';
  int indexAdd = 1;

  @override
  void initState() {
    shortInfoController = TextEditingController();
    fullnameController = TextEditingController();
    jshshirController = TextEditingController();
    shakl1Controller = TextEditingController();
    imeiController1 = TextEditingController();
    imeiController2 = TextEditingController();
    imeiController3 = TextEditingController();
    imeiController4 = TextEditingController();
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
                          color: Colors.grey.shade200,
                        ),
                      ),
                      Text(
                        "Jinoyat ishi".toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.grey.shade300,
                          letterSpacing: 1.5,
                        ),
                      ),
                      Container(width: 30),
                    ],
                  ),
                  SizedBox(height: 30),
                  imei(),
                ],
              ),
              Container(
                width: Get.width,
                height: 50,
                margin: EdgeInsets.only(bottom: 24),
                child: ElevatedButton.icon(
                  onPressed: () async {
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
        ),
      ),
    );
  }

  imei() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              letterSpacing: 1,
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
              border: InputBorder.none,
              hintText: "Jinoyat raqami",
              hintStyle: TextStyle(color: Colors.grey),
              contentPadding: EdgeInsets.only(
                left: 12,
                right: 10,
              ),
              // suffixIcon: Icon(
              //   Icons.discount,
              //   size: 22,
              //   color: Colors.grey.shade200,
              // ),
            ),
          ),
        ),
        SizedBox(height: 14),
        Container(
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: TextFormField(
            controller: fullnameController,
            cursorColor: Colors.grey.shade200,
            cursorWidth: 1,
            textCapitalization: TextCapitalization.words,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade200),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: 12,
                right: 10,
              ),
              border: InputBorder.none,
              hintText: "F.I.SH",
              hintStyle: TextStyle(color: Colors.grey),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey),
              ),
              // suffixIcon: Icon(
              //   Icons.person,
              //   size: 24,
              //   color: Colors.grey.shade200,
              // ),
            ),
          ),
        ),
        SizedBox(height: 14),
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
              contentPadding: EdgeInsets.only(
                left: 6,
                right: 10,
              ),
              border: InputBorder.none,
              hintText: "JSHSHIR",
              hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey),
              ),
              // suffixIcon: Icon(
              //   Icons.document_scanner,
              //   size: 22,
              //   color: Colors.grey.shade200,
              // ),
            ),
          ),
        ),
        SizedBox(height: 14),
        Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: TextFormField(
            maxLines: 3,
            controller: shortInfoController,
            cursorColor: Colors.grey.shade200,
            cursorWidth: 1,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.none,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade200),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: 12,
                right: 10,
                top: 12,
                bottom: 8,
              ),
              border: InputBorder.none,
              hintText: "Qisqacha ma'lumot",
              hintStyle: TextStyle(color: Colors.grey),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey),
              ),
              // suffixIcon: Icon(
              //   Icons.info_outline,
              //   size: 24,
              //   color: Colors.grey.shade200,
              // ),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(top: 14),
                width: Get.width,
                height: 44,
                child: DropdownButtonFormField(
                  focusColor: Colors.transparent,
                  hint: Text(
                    "Tel:",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
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
                    number("Tel:"),
                    number("IMEI:"),
                  ],
                  onChanged: (e) {
                    nomer1 = e!;
                    imeiController1!.clear();
                    setState(() {});
                  },
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.only(top: 14),
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: TextFormField(
                  controller: imeiController1,
                  cursorColor: Colors.grey.shade200,
                  cursorWidth: 1,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade200,
                      letterSpacing: 1),
                  inputFormatters: [
                    nomer1 == 'IMEI:'
                        ? TextInputMask(
                            mask: '\\ 999999999999999',
                            placeholder: '_ ',
                            maxPlaceHolders: 15,
                          )
                        : TextInputMask(
                            mask: '\\ (99) 999-99-99',
                            placeholder: '_ ',
                            maxPlaceHolders: 9,
                          ),
                  ],
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      left: 0,
                      right: 0,
                      top: 0,
                    ),
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    // suffixIcon: Icon(
                    //   Icons.qr_code_scanner_outlined,
                    //   size: 26,
                    //   color: Colors.grey.shade200,
                    // ),
                  ),
                ),
              ),
            ),
          ],
        ),
        indexAdd >= 2
            ? Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(top: 14),
                      width: Get.width,
                      height: 44,
                      child: DropdownButtonFormField(
                        focusColor: Colors.transparent,
                        hint: Text(
                          "Tel:",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
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
                          number("Tel:"),
                          number("IMEI:"),
                        ],
                        onChanged: (e) {
                          nomer2 = e!;
                          imeiController2!.clear();
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: 44,
                      margin: EdgeInsets.only(top: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: TextFormField(
                        controller: imeiController2,
                        cursorColor: Colors.grey.shade200,
                        cursorWidth: 1,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade200,
                            letterSpacing: 1),
                        inputFormatters: [
                          nomer2 == 'IMEI:'
                              ? TextInputMask(
                                  mask: '\\ 999999999999999',
                                  placeholder: '_ ',
                                  maxPlaceHolders: 15,
                                )
                              : TextInputMask(
                                  mask: '\\ (99) 999-99-99',
                                  placeholder: '_ ',
                                  maxPlaceHolders: 9,
                                ),
                        ],
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 0,
                            right: 0,
                            top: 0,
                          ),
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          // suffixIcon: Icon(
                          //   Icons.qr_code_scanner_outlined,
                          //   size: 26,
                          //   color: Colors.grey.shade200,
                          // ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Container(),
        indexAdd >= 3
            ? Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(top: 14),
                      width: Get.width,
                      height: 44,
                      child: DropdownButtonFormField(
                        focusColor: Colors.transparent,
                        hint: Text(
                          "Tel:",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
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
                          number("Tel:"),
                          number("IMEI:"),
                        ],
                        onChanged: (e) {
                          nomer3 = e!;
                          imeiController3!.clear();
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: 44,
                      margin: EdgeInsets.only(top: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: TextFormField(
                        controller: imeiController3,
                        cursorColor: Colors.grey.shade200,
                        cursorWidth: 1,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade200,
                            letterSpacing: 1),
                        inputFormatters: [
                          nomer3 == 'IMEI:'
                              ? TextInputMask(
                                  mask: '\\ 999999999999999',
                                  placeholder: '_ ',
                                  maxPlaceHolders: 15,
                                )
                              : TextInputMask(
                                  mask: '\\ (99) 999-99-99',
                                  placeholder: '_ ',
                                  maxPlaceHolders: 9,
                                ),
                        ],
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 0,
                            right: 0,
                            top: 0,
                          ),
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          // suffixIcon: Icon(
                          //   Icons.qr_code_scanner_outlined,
                          //   size: 26,
                          //   color: Colors.grey.shade200,
                          // ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Container(),
        indexAdd >= 4
            ? Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(top: 14),
                      width: Get.width,
                      height: 44,
                      child: DropdownButtonFormField(
                        focusColor: Colors.transparent,
                        hint: Text(
                          "Tel:",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
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
                          number("Tel:"),
                          number("IMEI:"),
                        ],
                        onChanged: (e) {
                          nomer4 = e!;
                          imeiController4!.clear();
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: 44,
                      margin: EdgeInsets.only(top: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: TextFormField(
                        controller: imeiController4,
                        cursorColor: Colors.grey.shade200,
                        cursorWidth: 1,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade200,
                            letterSpacing: 1),
                        inputFormatters: [
                          nomer4 == 'IMEI:'
                              ? TextInputMask(
                                  mask: '\\ 999999999999999',
                                  placeholder: '_ ',
                                  maxPlaceHolders: 15,
                                )
                              : TextInputMask(
                                  mask: '\\ (99) 999-99-99',
                                  placeholder: '_ ',
                                  maxPlaceHolders: 9,
                                ),
                        ],
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 0,
                            right: 0,
                            top: 0,
                          ),
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          // suffixIcon: Icon(
                          //   Icons.qr_code_scanner_outlined,
                          //   size: 26,
                          //   color: Colors.grey.shade200,
                          // ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Container(
                margin: EdgeInsets.only(top: 14),
                width: double.infinity,
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      indexAdd++;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.teal),
                        borderRadius: BorderRadius.circular(4)),
                    child: Icon(Icons.add, color: Colors.teal, size: 32),
                  ),
                ),
              ),
      ],
    );
  }

  DropdownMenuItem number(number) => DropdownMenuItem(
        child: Text(
          number,
          style: TextStyle(fontSize: 14, color: Colors.grey.shade300),
        ),
        value: number,
        onTap: () {},
      );
}
