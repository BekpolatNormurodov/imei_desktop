import 'package:imei/library.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = InputController();
  TextEditingController telController = TextEditingController();
  TextEditingController jetonController = TextEditingController();
  bool enabletel = false;
  bool enableJeton = false;
  bool showJeton = true;
  bool hasToken = false;

// Gmail code
  late final SmsRetriever smsRetriever;
  late final TextEditingController pinController;
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;

  bool? enableButton;
  Timer? _timer;
  int _secoundCount = 60;
  int _minutCount = 2;
  bool codeSend = false;

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      BrowserContextMenu.disableContextMenu();
    }
    formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    focusNode = FocusNode();

    /// In case you need an SMS autofill feature
    smsRetriever = SmsRetrieverImpl(
      SmartAuth(),
    );
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();

    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color focusedBorderColor = Colors.deepPurple.shade800;
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    Color borderColor = Colors.deepPurpleAccent.withOpacity(.4);

    final defaultPinTheme = PinTheme(
      width: 39,
      height: 39,
      textStyle: const TextStyle(
        fontSize: 18,
        color: Color.fromARGB(255, 24, 10, 63),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(68, 68, 68, 1),
      body: _page(defaultPinTheme, focusedBorderColor, fillColor),
    );
  }

  Widget _page(defaultPinTheme, focusedBorderColor, fillColor) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _icon(),
              SizedBox(height: 100),
              _inputField("Tel", telController),
              SizedBox(height: 20),
              _inputField("Jeton raqam", jetonController),
              SizedBox(height: 40),
              _loginBtn(defaultPinTheme, focusedBorderColor, fillColor),
            ],
          ),
        ),
      ),
    );
  }

  Widget _icon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Hero(
          tag: 'intro',
          child: Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/IIV-logo.png"),
                // fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(width: 26),
        Container(
          width: 150,
          child: Text(
            "IMEI - 102",
            style: TextStyle(
              color: Colors.grey.shade300,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }

  Widget _inputField(String label, TextEditingController controller) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey),
    );
    var focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey.shade200),
    );

    return TextFormField(
      onChanged: (e) {
        setState(() {
          if (e.isNotEmpty)
            enableJeton = true;
          else
            enableJeton = false;
        });
      },
      cursorColor: Colors.deepPurpleAccent,
      style: TextStyle(color: Colors.grey.shade200),
      controller: controller,
      textInputAction: TextInputAction.next,
      keyboardType: ((label == "Jeton raqam") && jetonController.text.isEmpty)
          ? TextInputType.name
          : TextInputType.phone,
      textCapitalization: label == "Jeton raqam"
          ? TextCapitalization.characters
          : TextCapitalization.none,
      inputFormatters: label == "Jeton raqam"
          ? [
              TextInputMask(
                mask: 'A-999999',
                placeholder: '_ ',
                maxPlaceHolders: 9,
              )
            ]
          : [
              TextInputMask(
                mask: '\\ (99) 999-99-99',
                placeholder: '_ ',
                maxPlaceHolders: 9,
              )
            ],
      decoration: InputDecoration(
        label: Text(
          label,
          style: TextStyle(color: Colors.grey.shade300),
        ),
        enabledBorder: border,
        focusedBorder: focusedBorder,
        suffixIcon: label != "Jeton raqam"
            ? Icon(
                Icons.phone,
                size: 26,
                color: Colors.grey.shade400,
              )
            : Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset("assets/icons/jeton.png", width: 20),
              ),
      ),
    );
  }

  Widget _loginBtn(defaultPinTheme, focusedBorderColor, fillColor) {
    return ElevatedButton(
      onPressed: () async {
        print("object");
        var dataService = await AuthorizationPost().authorizationPost(
            phone: telController.text
                .split('-')
                .join()
                .split('(')
                .join()
                .split(')')
                .join()
                .split(' ')
                .join()
                .toString(),
            jton: jetonController.text.toString());
        if (dataService['access'] == Hive.box("token").get("token")) {
          await Hive.box('data').put('phone', telController.text);
          await Hive.box('data').put('jeton', jetonController.text);
          // if (telController.text.split(' ').join() == tel) {

          // await Hive.box('data').put('phone', telController.text);
          // await Hive.box('data').put('jeton', jetonController.text);
          enableButton = false;
          pinController.clear();
          _secoundCount = 60;
          _minutCount = 2;
          codeSend = false;
          showDialog(
            barrierColor: Colors.black.withOpacity(.8),
            context: context,
            builder: (
              context,
            ) {
              return StatefulBuilder(
                builder: (context, StateSetter setState) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    scrollable: true,
                    elevation: 10,
                    iconPadding: EdgeInsets.zero,
                    icon: Container(
                      height: 80,
                      margin: EdgeInsets.only(top: 12, bottom: 10),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(10))),
                      child: Image.asset("assets/icons/check-account.png"),
                    ),
                    titlePadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '* Tasdiqlash kodni kiriting.',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withOpacity(.6),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          Hive.box('data').get('phone'),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          alignment: Alignment.center,
                          child: Form(
                            key: formKey,
                            child: Directionality(
                              textDirection: TextDirection.ltr,
                              child: Pinput(
                                length: 5,
                                smsRetriever: smsRetriever,
                                controller: pinController,
                                focusNode: focusNode,
                                defaultPinTheme: defaultPinTheme,
                                separatorBuilder: (index) =>
                                    const SizedBox(width: 10),
                                validator: (value) {
                                  enableButton =
                                      value! == '22222' ? true : false;
                                  setState(() {});
                                  // print(enableButton);
                                  return value == '22222' ? null : 'Kod xato!';
                                },
                                hapticFeedbackType:
                                    HapticFeedbackType.lightImpact,
                                onCompleted: (pin) {
                                  debugPrint('onCompleted: $pin');
                                },
                                onChanged: (value) {
                                  debugPrint('onChanged: $value');
                                },
                                cursor: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 9),
                                      width: 16,
                                      height: 1,
                                      color: focusedBorderColor,
                                    ),
                                  ],
                                ),
                                focusedPinTheme: defaultPinTheme.copyWith(
                                  decoration:
                                      defaultPinTheme.decoration!.copyWith(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: focusedBorderColor, width: .8),
                                  ),
                                ),
                                submittedPinTheme: defaultPinTheme.copyWith(
                                  decoration:
                                      defaultPinTheme.decoration!.copyWith(
                                    color: fillColor,
                                    borderRadius: BorderRadius.circular(8),
                                    border:
                                        Border.all(color: focusedBorderColor),
                                  ),
                                ),
                                errorPinTheme: defaultPinTheme.copyBorderWith(
                                  border: Border.all(color: Colors.redAccent),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: Get.width,
                          height: 60,
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              codeSend
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.timer_outlined,
                                          color: Colors.deepPurple.shade900,
                                          size: 20,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          _minutCount > -1
                                              ? (_secoundCount > 9
                                                  ? "0$_minutCount:$_secoundCount"
                                                  : "0$_minutCount:0$_secoundCount")
                                              : '',
                                          style: TextStyle(
                                            fontSize: 14,
                                            letterSpacing: .6,
                                            color: Colors.deepPurple.shade900,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    )
                                  : Container(),
                              codeSend
                                  ? Container()
                                  : TextButton.icon(
                                      onPressed: () {
                                        codeSend = true;
                                        _timer = Timer.periodic(
                                          Duration(seconds: 1),
                                          (timer) {
                                            this._secoundCount -= 1;
                                            setState(
                                              () {
                                                if (_secoundCount == -1) {
                                                  _secoundCount = 59;
                                                  _minutCount -= 1;
                                                  setState(() {});
                                                }
                                                if (_minutCount < 0) {
                                                  codeSend = false;
                                                  _secoundCount = 60;
                                                  _minutCount = 2;
                                                  _timer!.cancel();
                                                }
                                              },
                                            );
                                          },
                                        );
                                      },
                                      icon: Icon(Icons.double_arrow,
                                          color: Colors.deepPurple.shade700,
                                          size: 22),
                                      label: Text(
                                        "Kod yuborish ",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.deepPurple.shade700,
                                          letterSpacing: .5,
                                          decoration: TextDecoration.underline,
                                          decorationColor:
                                              Colors.deepPurple.shade700,
                                          decorationThickness: 2,
                                        ),
                                      ),
                                      style: OutlinedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4, vertical: 4),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    content: Container(
                      height: 46,
                      margin: EdgeInsets.only(top: 20),
                      child: OutlinedButton.icon(
                        onPressed: () {
                          if (enableButton!) {
                            _timer!.cancel();
                            Navigator.of(Get.overlayContext!,
                                    rootNavigator: true)
                                .pop();
                            Get.offAll(AccountCreate());
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
                          }
                        },
                        icon: Icon(Icons.check_circle,
                            color: enableButton!
                                ? Colors.white
                                : Colors.black.withOpacity(.1)),
                        label: Text(
                          "Tasdiqlash".toUpperCase(),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: enableButton!
                                ? Colors.grey.shade100
                                : Colors.black.withOpacity(.1),
                            letterSpacing: .6,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          // shadowColor: enableButton! ? Colors.deepPurpleAccent : Colors.transparent,
                          overlayColor: enableButton!
                              ? Colors.red.shade900
                              : Colors.transparent,
                          backgroundColor: enableButton!
                              ? Colors.deepPurpleAccent
                              : Colors.black.withOpacity(.1),
                          elevation: 8,
                          side: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        }
        // else {
        //   Get.snackbar('Faild...', "Jeton raqami xato",
        //       backgroundColor: Colors.red.withOpacity(.8));
        // }
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor:
            enableJeton ? Colors.teal : Colors.white.withOpacity(.2),
        padding: EdgeInsets.only(top: 16, bottom: 12),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          "KIRISH",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: enableJeton ? Colors.grey.shade200 : Colors.grey,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
