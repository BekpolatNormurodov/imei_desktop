// import 'package:imei/Api/its/its_service.dart';
// import 'package:imei/library.dart';

// enum ITSState { intial, waiting, success, error }

// class ITSProvider extends ChangeNotifier {
//   ITSState state = ITSState.intial;
//   set(ITSState value) {
//     state = value;
//     notifyListeners();
//   }

//   ITSModel? data;

//   Future getData() async {
//     set(ITSState.waiting);
//     try {
//       data = (await ITSService().itsService());
//       set(ITSState.success);
//     } catch (e) {
//       set(ITSState.error);
//     }
//   }
// }
