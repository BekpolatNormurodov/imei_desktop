import 'package:imei/library.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(68, 68, 68, 1),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _icon(),
            SizedBox(height: 48),
            Column(
              children: [
                Row(
                  children: [
                    _box(
                      "create-imei.png",
                      "YO'QOLGANLAR",
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: ListImImeiLost(),
                      ),
                      86.0,
                      0.0,
                    ),
                    SizedBox(width: 14),
                    _box(
                      "check-imei.png",
                      "TOPILGANLAR",
                      ListImImeiFound(),
                      60.0,
                      12.0,
                    ),
                  ],
                ),
                SizedBox(height: 14),
                Row(
                  children: [
                    _box(
                      "search.png",
                      "TEKSHIRISH",
                      ImeiInput(),
                      56.0,
                      12.0,
                    ),
                    SizedBox(width: 14),
                    _box("account.png", "ACCOUNT", AccountPage(), 60.0, 16.0),
                  ],
                ),
              ],
            )
          ],
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
        SizedBox(width: 10),
        Container(
          width: 150,
          alignment: Alignment.centerRight,
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

  Widget _box(icon, title, page, size, top) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        },
        child: Container(
          height: 120,
          padding: EdgeInsets.only(top: top, bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.teal,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/icons/$icon", width: size),
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey.shade200,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
