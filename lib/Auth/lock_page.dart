import 'package:imei/library.dart';

class LockPage extends StatefulWidget {
  const LockPage({super.key});

  @override
  State<LockPage> createState() => _LockPageState();
}

class _LockPageState extends State<LockPage> with TickerProviderStateMixin {
  AnimationController? _controller;
  bool isFinished = false;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        lowerBound: 0.0,
        upperBound: 1.0,
        duration: Duration(seconds: 1));

    _controller!.forward();
    _controller!.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration(seconds: 2), () {
    //   Get.offAll(LockPage());
    // });
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        color: Color.fromRGBO(68, 68, 68, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Container(
              width: Get.width - 80,
              height: Get.width - 80,
              margin: EdgeInsets.only(top: 40),
              alignment: Alignment.center,
              child: Container(
                width: Get.width,
                height: MediaQuery.of(context).size.width * _controller!.value,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/IIV-logo.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0 +  ( 120 - 120 * _controller!.value), vertical: 40),
              child: SwipeableButtonView(
                buttonText:_controller!.value == 1 ?  "  O'nga suring..." : '',
                buttontextstyle: TextStyle(
                  color: Colors.grey.shade300,
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500,
                ),
                buttonWidget: Container(
                  child: Icon(
                    Icons.lock_outlined,
                    color: Colors.deepPurpleAccent.shade700,
                    size: 30,
                  ),
                ),
                activeColor: Colors.black.withOpacity(.2),
                isFinished: isFinished,
                onWaitingProcess: () {
                  Future.delayed(Duration(milliseconds: 1), () {
                    setState(() {
                      isFinished = true;
                    });
                  });
                },
                onFinish: () async {
                  screenLock(
                    onUnlocked:() => Get.off(Hive.box('data').get('lock').isNotEmpty ? SelectionPage() : LoginPage()),
                    title: Text("Iltimos Pin-kodni kiriting."),
                    context: context,
                    correctString: Hive.box('data').get('lock'),
                    maxRetries: 3,
                    retryDelay: const Duration(seconds: 10),
                    delayBuilder: (context, delay) => Text(
                      "${(delay.inMilliseconds / 1000).ceil()} soniyadan keyin urinib ko'ring",
                    ),
                  );
                  setState(() {
                    isFinished = false;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
