// import 'package:imei/library.dart';

// class ImeiOutput extends StatefulWidget {
//   Data? data;
//   ImeiOutput(this.data);

//   @override
//   State<ImeiOutput> createState() => _ImeiOutputState();
// }

// class _ImeiOutputState extends State<ImeiOutput> {
//   late final SmsRetriever smsRetriever;
//   late final TextEditingController pinController;
//   late final FocusNode focusNode;
//   late final GlobalKey<FormState> formKey;

//   bool? enableButton;
//   Timer? _timer;
//   int _secoundCount = 60;
//   int _minutCount = 2;

//   bool codeSend = false;

//   @override
//   void initState() {
//     if (kIsWeb) {
//       BrowserContextMenu.disableContextMenu();
//     }
//     formKey = GlobalKey<FormState>();
//     pinController = TextEditingController();
//     focusNode = FocusNode();

//     /// In case you need an SMS autofill feature
//     smsRetriever = SmsRetrieverImpl(
//       SmartAuth(),
//     );
//     super.initState();
//   }

//   @override
//   void dispose() {
//     if (kIsWeb) {
//       BrowserContextMenu.enableContextMenu();
//     }
//     pinController.dispose();
//     focusNode.dispose();
//     _timer!.cancel();
//     setState(() {});
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Color focusedBorderColor = Colors.deepPurpleAccent.shade700;
//     const fillColor = Color.fromRGBO(243, 246, 249, 0);
//     Color borderColor = Colors.deepPurpleAccent.withOpacity(.4);

//     final defaultPinTheme = PinTheme(
//       width: 40,
//       height: 40,
//       textStyle: const TextStyle(
//         fontSize: 16,
//         color: Color.fromARGB(255, 24, 10, 63),
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: borderColor),
//       ),
//     );
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(68, 68, 68, 1),
//       appBar: AppBar(
//         backgroundColor: Color.fromRGBO(68, 68, 68, 1),
//         leading: IconButton(
//             onPressed: () => Get.back(),
//             icon: Icon(
//               Icons.arrow_back,
//               color: Colors.grey.shade300,
//             )),
//         title: Text(
//           "Qurilma Ma'lumotlari".toUpperCase(),
//           style: TextStyle(
//             color: Colors.grey.shade200,
//             fontSize: 15,
//             wordSpacing: 2,
//             letterSpacing: .5,
//             fontWeight: FontWeight.w600,
//             shadows: [
//               BoxShadow(
//                 offset: Offset(1, 1),
//                 color: Colors.black,
//                 blurRadius: 8,
//               )
//             ],
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               // Get.off(ImeiEdit());
//             },
//             icon: Container(
//               padding: EdgeInsets.all(4),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.tealAccent.shade700),
//                 borderRadius: BorderRadius.circular(4),
//               ),
//               child: Icon(
//                 Icons.comment,
//                 color: Colors.tealAccent.shade700,
//                 size: 22,
//               ),
//             ),
//           ),
//           SizedBox(width: 8),
//         ],
//         centerTitle: true,
//       ),
//       body: Container(
//         child: Container(
//           width: double.infinity,
//           height: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Material(
//                 color: Color.fromRGBO(68, 68, 68, 1),
//                 borderRadius: BorderRadius.circular(8),
//                 elevation: 2,
//                 child: Container(
//                   width: Get.width - 28,
//                   height: Get.height - 210,
//                   margin: EdgeInsets.only(top: 10),
//                   padding: EdgeInsets.only(left: 20, right: 10, top: 12),
//                   decoration: BoxDecoration(
//                     color: Color.fromRGBO(80, 80, 80, 1),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         _box("IMEI:", widget.data!.imei),
//                         _box("Oxirgi ishlagan SIM:", widget.data!.lastSimcard),
//                         _box("Modeli:", widget.data!.model),
//                         _box("Rangi:", widget.data!.color),
//                         _box("Holat haqida ma'lumot:",
//                             widget.data!.status),
//                         Container(
//                           margin: EdgeInsets.only(top: 40),
//                           child: Text(
//                             "* Qurilma egasining ma'lumotlari.",
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontStyle: FontStyle.italic,
//                               color: Colors.tealAccent.shade700,
//                               letterSpacing: 1,
//                               fontWeight: FontWeight.w500,
//                             ),
//                             textAlign: TextAlign.start,
//                           ),
//                         ),
//                         _box("F.I.SH:", "${widget.data!.owner!.lastName} ${widget.data!.owner!.firstName} ${widget.data!.owner!.fatherName}"),
//                         _box("Tel:", widget.data!.owner!.phoneNumber),
//                         _box("JSHSHIR:",widget.data!.owner!.jshir),
//                         _box("Shakl1 №:", widget.data!.owner!.jshir),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 width: Get.width - 32,
//                 height: 48,
//                 margin: EdgeInsets.only(bottom: 16),
//                 child: ElevatedButton.icon(
//                   onPressed: () async {
//                     enableButton = false;
//                     pinController.clear();
//                     // _timer!.cancel();
//                     _secoundCount = 60;
//                     _minutCount = 2;
//                     codeSend = false;
//                     showDialog(
//                       barrierColor: Colors.black.withOpacity(.8),
//                       context: context,
//                       builder: (
//                         context,
//                       ) {
//                         return StatefulBuilder(
//                           builder: (context, StateSetter setState) {
//                             return AlertDialog(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(10))),
//                               scrollable: true,
//                               elevation: 10,
//                               iconPadding: EdgeInsets.zero,
//                               icon: Container(
//                                 margin: EdgeInsets.only(top: 18),
//                                 child: Text(
//                                   "SMS kodi",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 20),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                               titlePadding: EdgeInsets.symmetric(
//                                   vertical: 10, horizontal: 16),
//                               title: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     '* Tasdiqlash kodini kiriting.',
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       color: Colors.black.withOpacity(.6),
//                                     ),
//                                     textAlign: TextAlign.left,
//                                   ),
//                                   Text(
//                                     "   +998 (94) 679-22-20",
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                     textAlign: TextAlign.left,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Container(),
//                                       codeSend
//                                           ? Container(
//                                               margin: EdgeInsets.only(top: 20),
//                                               child: Row(
//                                                 children: [
//                                                   Icon(
//                                                     Icons.timer_outlined,
//                                                     color: Colors
//                                                         .deepPurple.shade900,
//                                                   ),
//                                                   SizedBox(width: 8),
//                                                   Text(
//                                                     _minutCount > -1
//                                                         ? (_secoundCount > 9
//                                                             ? "0$_minutCount:$_secoundCount"
//                                                             : "0$_minutCount:0$_secoundCount")
//                                                         : '',
//                                                     style: TextStyle(
//                                                         fontSize: 16,
//                                                         letterSpacing: .6,
//                                                         color: Colors.deepPurple
//                                                             .shade900),
//                                                   )
//                                                 ],
//                                               ),
//                                             )
//                                           : Container(
//                                               margin: EdgeInsets.only(top: 20),
//                                             ),
//                                       codeSend
//                                           ? Container(
//                                               margin: EdgeInsets.only(
//                                                   top: 20, bottom: 2),
//                                               padding: EdgeInsets.symmetric(
//                                                   horizontal: 24, vertical: 12),
//                                               decoration: BoxDecoration(
//                                                   border: Border.all(
//                                                     color: Colors.black
//                                                         .withOpacity(.2),
//                                                   ),
//                                                   borderRadius:
//                                                       BorderRadius.circular(6)),
//                                               child: Text(
//                                                 "YUBORISH",
//                                                 style: TextStyle(
//                                                   fontSize: 12,
//                                                   color: Colors.black
//                                                       .withOpacity(.2),
//                                                   letterSpacing: .5,
//                                                 ),
//                                               ),
//                                             )
//                                           : Container(
//                                               margin: EdgeInsets.only(top: 18),
//                                               child: OutlinedButton(
//                                                 onPressed: () {
//                                                   codeSend = true;
//                                                   _timer = Timer.periodic(
//                                                     Duration(seconds: 1),
//                                                     (timer) {
//                                                       this._secoundCount -= 1;
//                                                       setState(
//                                                         () {
//                                                           if (_secoundCount ==
//                                                               -1) {
//                                                             _secoundCount = 59;
//                                                             _minutCount -= 1;
//                                                             setState(() {});
//                                                           }
//                                                           if (_minutCount < 0) {
//                                                             codeSend = false;
//                                                             _secoundCount = 60;
//                                                             _minutCount = 2;
//                                                             _timer!.cancel();
//                                                           }
//                                                         },
//                                                       );
//                                                     },
//                                                   );
//                                                 },
//                                                 child: Text(
//                                                   "YUBORISH",
//                                                   style: TextStyle(
//                                                     fontSize: 12,
//                                                     color: Colors
//                                                         .deepPurpleAccent
//                                                         .shade700,
//                                                     letterSpacing: .5,
//                                                   ),
//                                                 ),
//                                                 style: OutlinedButton.styleFrom(
//                                                   side: BorderSide(
//                                                     color:
//                                                         Colors.deepPurpleAccent,
//                                                     width: 1,
//                                                   ),
//                                                   shape: RoundedRectangleBorder(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               6)),
//                                                 ),
//                                               ),
//                                             ),
//                                     ],
//                                   ),
//                                   Container(
//                                     margin:
//                                         EdgeInsets.only(top: 50, bottom: 30),
//                                     alignment: Alignment.center,
//                                     child: Form(
//                                       key: formKey,
//                                       child: Directionality(
//                                         // Specify
//                                         // direction if desired
//                                         textDirection: TextDirection.ltr,
//                                         child: Pinput(
//                                           // You can pass your own SmsRetriever implementation based on any package
//                                           // in this example we are using the SmartAuth
//                                           smsRetriever: smsRetriever,
//                                           controller: pinController,
//                                           focusNode: focusNode,
//                                           defaultPinTheme: defaultPinTheme,
//                                           separatorBuilder: (index) =>
//                                               const SizedBox(width: 10),
//                                           validator: (value) {
//                                             enableButton =
//                                                 value! == '2222' ? true : false;
//                                             setState(() {});
//                                             print(enableButton);
//                                             return value == '2222'
//                                                 ? null
//                                                 : 'Kod xato!';
//                                           },
//                                           hapticFeedbackType:
//                                               HapticFeedbackType.lightImpact,
//                                           onCompleted: (pin) {
//                                             debugPrint('onCompleted: $pin');
//                                           },
//                                           onChanged: (value) {
//                                             debugPrint('onChanged: $value');
//                                           },
//                                           cursor: Column(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.end,
//                                             children: [
//                                               Container(
//                                                 margin: const EdgeInsets.only(
//                                                     bottom: 9),
//                                                 width: 16,
//                                                 height: 1,
//                                                 color: focusedBorderColor,
//                                               ),
//                                             ],
//                                           ),
//                                           focusedPinTheme:
//                                               defaultPinTheme.copyWith(
//                                             decoration: defaultPinTheme
//                                                 .decoration!
//                                                 .copyWith(
//                                               borderRadius:
//                                                   BorderRadius.circular(8),
//                                               border: Border.all(
//                                                   color: focusedBorderColor,
//                                                   width: .8),
//                                             ),
//                                           ),
//                                           submittedPinTheme:
//                                               defaultPinTheme.copyWith(
//                                             decoration: defaultPinTheme
//                                                 .decoration!
//                                                 .copyWith(
//                                               color: fillColor,
//                                               borderRadius:
//                                                   BorderRadius.circular(8),
//                                               border: Border.all(
//                                                   color: focusedBorderColor),
//                                             ),
//                                           ),
//                                           errorPinTheme:
//                                               defaultPinTheme.copyBorderWith(
//                                             border: Border.all(
//                                                 color: Colors.redAccent),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               content: OutlinedButton.icon(
//                                 onPressed: () {
//                                   if (enableButton!) {
//                                     _timer!.cancel();
//                                     Get.off(ListImImeiFound());
//                                     Navigator.of(Get.overlayContext!,
//                                             rootNavigator: true)
//                                         .pop();
//                                     Get.snackbar("12345678901234",
//                                         "Topilganlar ro'yxatiga qo'shildi.",
//                                         backgroundColor: Colors.green);
//                                   }
//                                 },
//                                 icon: Icon(Icons.check_circle,
//                                     color: enableButton!
//                                         ? Colors.white
//                                         : Colors.black.withOpacity(.1)),
//                                 label: Text(
//                                   "TASDIQLASH",
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w600,
//                                     color: enableButton!
//                                         ? Colors.grey.shade100
//                                         : Colors.black.withOpacity(.1),
//                                     letterSpacing: .6,
//                                   ),
//                                 ),
//                                 style: OutlinedButton.styleFrom(
//                                   // shadowColor: enableButton! ? Colors.deepPurpleAccent : Colors.transparent,
//                                   overlayColor: enableButton!
//                                       ? Colors.red.shade900
//                                       : Colors.transparent,
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 40, vertical: 10),
//                                   backgroundColor: enableButton!
//                                       ? Colors.deepPurpleAccent
//                                       : Colors.black.withOpacity(.1),
//                                   elevation: 8,
//                                   side: BorderSide(
//                                     color: Colors.transparent,
//                                     width: 1,
//                                   ),
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(6)),
//                                 ),
//                               ),
//                             );
//                           },
//                         );
//                       },
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.teal,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   label: Text(
//                     "TOPILDI",
//                     style: TextStyle(
//                       color: Colors.grey.shade300,
//                       fontSize: 15,
//                       fontWeight: FontWeight.w600,
//                       letterSpacing: .5,
//                     ),
//                   ),
//                   icon: Icon(Icons.check_circle, color: Colors.grey.shade200),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _box(request, response) {
//     return Container(
//       margin: EdgeInsets.only(top: 8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             request,
//             style: TextStyle(
//                 color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500),
//           ),
//           Text(
//             response,
//             style: TextStyle(
//                 color: Colors.grey.shade300,
//                 fontSize: 15,
//                 fontWeight: FontWeight.w500),
//           ),
//         ],
//       ),
//     );
//   }
// }
