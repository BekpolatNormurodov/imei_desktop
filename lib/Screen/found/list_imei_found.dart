import 'package:imei/library.dart';

class ListImImeiFound extends StatefulWidget {
  ListImImeiFound({super.key});

  @override
  State<ListImImeiFound> createState() => _ListImImeiFoundState();
}

class _ListImImeiFoundState extends State<ListImImeiFound> {
  final options = LiveOptions(
    delay: Duration(milliseconds: 30),
    showItemInterval: Duration(milliseconds: 40),
    showItemDuration: Duration(milliseconds: 300),
    visibleFraction: 0.05,
    reAnimateOnVisibility: false,
  );

  // SignedProvider? provider;
  // Timer? _timer;

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    // provider = context.read<SignedProvider>();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   provider!.getData();
    //   _timer = Timer.periodic(Duration(seconds: 10), (timer) {
    //     provider!.getData();
    //   });
    // });
    // provider?.addListener(() {
    //   setState(() {});
    // });
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _timer?.cancel();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(68, 68, 68, 1),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
          onPressed: () => Get.offAll(SelectionPage()),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey.shade200,
          ),
        ),
        title: AnimatedSearchBar(
            label: "TOPILGAN QURILMALAR",
            controller: TextEditingController(),
            closeIcon: Icon(
              Icons.close,
              color: Colors.grey.shade200,
              key: ValueKey('close'),
            ),
            searchIcon: Icon(
              Icons.search,
              color: Colors.grey.shade200,
              key: ValueKey('search'),
            ),
            labelStyle: TextStyle(
              color: Colors.grey.shade200,
              fontSize: 15,
              wordSpacing: 2,
              letterSpacing: .5,
              fontWeight: FontWeight.w600,
              shadows: [
                BoxShadow(
                  offset: Offset(1, 1),
                  color: Colors.black,
                  blurRadius: 8,
                )
              ],
            ),
            searchStyle: const TextStyle(color: Colors.white, letterSpacing: 1),
            cursorColor: Colors.white,
            textInputAction: TextInputAction.done,
            searchDecoration: const InputDecoration(
              hintText: 'Search',
              alignLabelWithHint: true,
              fillColor: Colors.white,
              focusColor: Colors.white,
              hintStyle: TextStyle(color: Colors.white70),
              border: InputBorder.none,
            ),
            onChanged: (value) {
              debugPrint('value on Change');
              setState(() {
                // searchText = value;
              });
            },
            onFieldSubmitted: (value) {
              debugPrint('value on Field Submitted');
              setState(() {
                // searchText = value;
              });
            }),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: LiveList.options(
          options: options,
          // itemCount: provider!.data.length,
          itemCount: 3,
          padding: EdgeInsets.only(top: 20, bottom: 10),
          itemBuilder: (
            BuildContext context,
            int index,
            Animation<double> animation,
          ) =>
              FadeTransition(
            opacity: Tween<double>(
              begin: 0,
              end: 1,
            ).animate(animation),
            child: SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0, -0.1),
                end: Offset.zero,
              ).animate(animation),
              child: GestureDetector(
                onTap: () {},
                child: Stack(
                  children: [
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                      color: Colors.tealAccent.shade700,
                      child: ListTile(
                        leading:
                            Image.asset("assets/icons/check-imei.png", width: 34),
                        title: Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Text(
                            "12345678901234",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 22,
                      bottom: 9,
                      child: Text(
                        "22:19",
                        style: TextStyle(fontSize: 11, color: Colors.black54),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
