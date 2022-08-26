import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  double position = 0;
  ScrollController scrollController = ScrollController();
  //final GlobalKey _keyRed = GlobalKey();
  double showButtons = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(((timeStamp) {
      setState(() {
        showButtons = scrollController.position.extentAfter;
      });
    }));

    // listen when scrolling, position take offset (current position in scroll) value
    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.removeListener(_scrollListener);
  }

  void _scrollListener() {
    setState(() {
      position = scrollController.offset;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return LayoutBuilder(builder: (context, BoxConstraints constraint) {
    // WidgetsBinding.instance.addPostFrameCallback(((timeStamp) {
    //   print("en movimiento ${scrollController.positions.length}");
    // }));
    return Container(
      color: Colors.lightBlueAccent,
      //key: _keyRed,
      child: Stack(children: [
        if (showButtons > 0)
          Positioned(
            left: 0,
            top: 0,
            child: InkWell(
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: const Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 16.0,
                ),
              ),
              onTap: () {
                setState(() {
                  if (scrollController.offset != 0) {
                    position -= 100;
                    scrollController.animateTo(position,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn);
                  }
                });
              },
            ),
          ),
        if (showButtons > 0)
          Positioned(
            right: 0,
            top: 0,
            child: InkWell(
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16.0,
                ),
              ),
              onTap: () {
                setState(() {
                  if (scrollController.offset !=
                      scrollController.position.maxScrollExtent) {
                    position += 100;
                    scrollController.animateTo(position,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn);
                  }
                });
              },
            ),
          ),
        Container(
            color: Colors.orangeAccent,
            margin: (showButtons > 0)
                ? const EdgeInsets.symmetric(horizontal: 20.0)
                : const EdgeInsets.all(0.0),
            child: SingleChildScrollView(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  tagFilter("Mujeres"),
                  tagFilter("Hombres"),
                  tagFilter("Niños"),
                  tagFilter("Niñas"),
                  tagFilter("Zapatillas"),
                  tagFilter("Ropa"),
                  tagFilter("Juguetes"),
                  tagFilter("Electrónica"),
                  tagFilter("Cocina"),
                ],
              ),
            )),
      ]),
    );
    // });
  }

  Widget tagFilter(String label) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(children: [
        Text(
          label,
          style: const TextStyle(fontSize: 10),
        ),
        const Icon(
          Icons.close_rounded,
          size: 16.0,
        ),
      ]),
    );
  }
}
