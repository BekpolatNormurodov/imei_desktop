import 'package:imei/library.dart';

class ImeiInput extends StatefulWidget {
  const ImeiInput({super.key});

  @override
  State<ImeiInput> createState() => _ImeiInputState();
}

class _ImeiInputState extends State<ImeiInput> {
  TextEditingController? imeiController;

  @override
  void initState() {
    imeiController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(68, 68, 68, 1),
      body: Container(
        child: Container(
              margin: EdgeInsets.symmetric(horizontal: 14),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Container(
                margin: EdgeInsets.only(top: 160, bottom: 60),
                child: TextFormField(
                  controller: imeiController,
                  cursorColor: Colors.grey.shade200,
                  cursorWidth: 1,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade200, letterSpacing: .8),
                  
                  inputFormatters: [
                    TextInputMask(
                      mask: '\\ 999999999999999',
                      placeholder: '_ ',
                      maxPlaceHolders: 15,
                    )
                  ],
                  decoration: InputDecoration(
                    label: Text(" IMEI", style: TextStyle(color: Colors.grey.shade400),),
                    contentPadding: EdgeInsets.only(
                      left: 8,
                      right: 10,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.grey.shade300)
                    ),
                    suffixIcon: Icon(
                      Icons.qr_code_scanner_outlined,
                      size: 26,
                      color: Colors.grey.shade200,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 24),
                  width: Get.width,
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      // Get.off(ImeiOutput());
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Ma'lumotlar saqlandi.",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade300,
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
                      "TEKSHIRISH",
                      style: TextStyle(
                        color: Colors.grey.shade300,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        letterSpacing: .5,
                      ),
                    ),
                    icon: Icon(Icons.search, color: Colors.grey.shade200),
                  ),
                ),
              
            ],
          ),
        ),
      ),
    );
  }
}
