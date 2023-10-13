import 'package:flutter/material.dart';

class navigatorbar extends StatefulWidget {
  const navigatorbar({super.key});

  @override
  State<navigatorbar> createState() => _navigatorbarState();
}

class _navigatorbarState extends State<navigatorbar> {
  iconasset selectedBottomNav = bottonNavs.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
          child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.blueGrey[900],
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(
              bottonNavs.length,
              (index) => GestureDetector(
                onTap: () {
                  if (bottonNavs[index] != selectedBottomNav) {
                    setState(() {
                      selectedBottomNav = bottonNavs[index];
                    });
                  }
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 250),
                      margin: EdgeInsets.only(bottom: 2),
                      height: 4,
                      width: bottonNavs[index] == selectedBottomNav ? 20 : 0,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: Opacity(
                          opacity:
                              bottonNavs[index] == selectedBottomNav ? 1 : 0.5,
                          child: Image.asset(bottonNavs[index].src)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class iconasset {
  final String src;
  iconasset(
    this.src,
  );
}

List<iconasset> bottonNavs = [
  iconasset("lib/images/Map-2.png"),
  iconasset("lib/images/MapDb.png"),
  iconasset("lib/images/persondata.png")
];
