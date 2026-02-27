import 'package:imei/library.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  AccountProvider? provider;

  String phone = Hive.box('data').get('phone');
  String jeton = Hive.box('data').get('jeton');
  String fullname = "NORMURODOV BEKPOLAT ERGASH O'G'LI";
  String violat = "NAVOIY VILOYATI";
  String tuman = "XATIRCHI TUMANI IIB";
  String lavozim = "IIV TQD JQX TTIB YETAKCHI MUTAXASSISI";
  String unvon = "LEYTENANT";

  @override
  void initState() {
    provider = context.read<AccountProvider>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      provider!.getData();
    });
    provider?.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    // var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Color.fromRGBO(68, 68, 68, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(68, 68, 68, 1),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          "Account".toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: Colors.grey.shade300,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(left: 36, right: 14),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.teal, width: 1.4),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Text(
              jeton,
              style: TextStyle(
                  color: Colors.grey.shade300,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  letterSpacing: .5),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          height: Get.height - 84,
          padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              oper(),
              Container(
                width: Get.width,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    Get.off(SelectionPage());
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
                    "SAQLASH",
                    style: TextStyle(
                      color: Colors.grey.shade300,
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

  oper() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "F.I.SH:",
          style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        ),
        SizedBox(height: 2),
        Container(
          child: TextFormField(
            controller: TextEditingController(
              text: provider!.state == AccountState.success
                  ? "${provider!.data!.results![0].lastName} ${provider!.data!.results![0].firstName} ${provider!.data!.results![0].fatherName}"
                  : "?",
            ),
            cursorColor: Colors.grey.shade300,
            cursorWidth: 1,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            style: TextStyle(
                fontSize: 15, color: Colors.grey.shade300),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                right: 12,
              ),
              prefixIcon: Container(
                width: 50,
                margin: EdgeInsets.only(right: 14),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.1),
                  border: Border(right: BorderSide(color: Colors.grey)),
                ),
                child: Icon(
                  Icons.person,
                  size: 24,
                  color: Colors.grey.shade300,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
        SizedBox(height: 14),
        Text(
          "Tel:",
          style: TextStyle(color: Colors.grey.shade400, fontSize: 15),
        ),
        SizedBox(height: 2),
        Container(
          child: TextFormField(
            inputFormatters: [
              TextInputMask(
                mask: '\\ (99) 999-99-99',
                placeholder: '_ ',
                maxPlaceHolders: 9,
              )
            ],
            controller: TextEditingController(
              text: phone,
            ),
            cursorColor: Colors.grey.shade300,
            cursorWidth: 1,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            style: TextStyle(fontSize: 15, color: Colors.grey.shade300),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                right: 8,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey),
              ),
              prefixIcon: Container(
                width: 50,
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.1),
                  border: Border(right: BorderSide(color: Colors.grey)),
                ),
                child: Icon(
                  Icons.phone,
                  size: 24,
                  color: Colors.grey.shade300,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 14),
        Text(
          "Ish joyi:",
          style: TextStyle(color: Colors.grey.shade400),
        ),
        SizedBox(height: 2),
        Container(
          width: Get.width,
          child: DropdownButtonFormField(
            focusColor: Colors.transparent,
            hint: Text(
              provider!.state == AccountState.success
                  ? provider!.data!.results![0].boshqarma!.name!.toUpperCase()
                  : "?",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade300,
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
              viloyatIIB("IIV"),
              viloyatIIB("Toshkent shahar"),
              viloyatIIB("Toshkent viloyati"),
              viloyatIIB("Sirdaryo viloyati"),
              viloyatIIB("Jizzax viloyati"),
              viloyatIIB("Samarqand viloyati"),
              viloyatIIB("Farg'ona viloyati"),
              viloyatIIB("Namangan viloyati"),
              viloyatIIB("Andijon viloyati"),
              viloyatIIB("Qashqadaryo  viloyati"),
              viloyatIIB("Surxandaryo viloyati"),
              viloyatIIB("Buxoro viloyati"),
              viloyatIIB("Navoiy viloyati"),
              viloyatIIB("Xorazm viloyati"),
              viloyatIIB("Qoraqalpog'iston Res."),
            ],
            onChanged: (e) {
              violat = e!;
              setState(() {});
            },
          ),
        ),
        SizedBox(height: 14),
        Text(
          "Boshqarma",
          style: TextStyle(color: Colors.grey.shade400),
        ),
        SizedBox(height: 2),
        Container(
          width: Get.width,
          child: DropdownButtonFormField(
            focusColor: Colors.transparent,
            hint: Text(
              provider!.state == AccountState.success
                  ? provider!.data!.results![0].bolim!.name!.toUpperCase()
                  : "?",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade300,
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
              tumanIIB("Navoiy viloyati IIB"),
              tumanIIB("Navoiy shahar IIB"),
              tumanIIB("Karmana tumani IIB"),
              tumanIIB("Navbahor tumani IIB"),
              tumanIIB("Konimex tumani IIB"),
              tumanIIB("Qiziltepa tumani IIB"),
              tumanIIB("Xatirchi tumani IIB"),
              tumanIIB("Zarafshon shahar IIB"),
              tumanIIB("Uchquduq tumani IIB"),
              tumanIIB("Nurota tumani IIB"),
              tumanIIB("Tomdi tumani IIB"),
              tumanIIB("G'azg'on tumani IIB"),
            ],
            onChanged: (e) {
              tuman = e!;
              setState(() {});
            },
          ),
        ),
        SizedBox(height: 14),
        Text(
          "Lavozim:",
          style: TextStyle(color: Colors.grey.shade400),
        ),
        SizedBox(height: 2),
        Container(
          child: TextFormField(
            controller: TextEditingController(
                text: provider!.state == AccountState.success
                    ? provider!.data!.results![0].lavozimi 
                    : "?"),
            cursorColor: Colors.grey.shade300,
            cursorWidth: 1,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade300,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: 12,
                right: 8,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey),
              ),
              prefixIcon: Container(
                width: 50,
                margin: EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.1),
                  border: Border(right: BorderSide(color: Colors.grey)),
                ),
                child: Icon(
                  Icons.workspace_premium_outlined,
                  size: 24,
                  color: Colors.grey.shade300,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 14),
        Text(
          "Unvon:",
          style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        ),
        SizedBox(height: 2),
        Container(
          width: Get.width,
          child: DropdownButtonFormField(
            focusColor: Colors.transparent,
            hint: Text(
              provider!.state == AccountState.success
                  ? provider!.data!.results![0].unvon!.name!.toUpperCase()
                  : "?",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade300,
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
              unvonIIB("Safdor"),
              unvonIIB("Kichik serjant"),
              unvonIIB("Serjant"),
              unvonIIB("Katta serjant"),
              unvonIIB("Leytenant"),
              unvonIIB("Katta leytenant"),
              unvonIIB("Kapitan"),
              unvonIIB("Mayor"),
              unvonIIB("Podpolkovnik"),
              unvonIIB("Polkovnik"),
            ],
            onChanged: (e) {
              unvon = e!;
              setState(() {});
            },
          ),
        ),
      ],
    );
  }

  DropdownMenuItem viloyatIIB(viloyat) => DropdownMenuItem(
        child: Text(
          viloyat.toUpperCase(),
          style: TextStyle(fontSize: 13, color: Colors.grey.shade300),
        ),
        value: viloyat,
        onTap: () {},
      );
  DropdownMenuItem tumanIIB(tuman) => DropdownMenuItem(
        child: Text(
          tuman.toUpperCase(),
          style: TextStyle(fontSize: 13, color: Colors.grey.shade300),
        ),
        value: tuman,
        onTap: () {},
      );

  DropdownMenuItem unvonIIB(unvon) => DropdownMenuItem(
        child: Text(
          unvon.toUpperCase(),
          style: TextStyle(fontSize: 13, color: Colors.grey.shade300),
        ),
        value: unvon,
        onTap: () {},
      );
}
