import 'package:flutter/material.dart';
import 'package:reactable/reactable.dart';
import 'package:three_d_card/utils/breakpoints.dart';
import 'package:three_d_card/utils/custom_colors.dart';
import 'package:three_d_card/widgets/three_d_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    double widthOfScreen = MediaQuery.of(context).size.width;
    List children = [
      ThreeDCard(
          isHover: false.asReactable,
          background: 'assets/images/best/1.png',
          foreground: 'assets/images/best/10.png',
          shadowColor: Colors.blue),
      ThreeDCard(
          isHover: false.asReactable,
          background: 'assets/images/best/2.png',
          foreground: 'assets/images/best/20.png',
          shadowColor: Colors.red),
      ThreeDCard(
          isHover: false.asReactable,
          background: 'assets/images/best/3.png',
          foreground: 'assets/images/best/30.png',
          shadowColor: Colors.redAccent)
    ];
    return Scaffold(
      backgroundColor: CustomColors.darkBackground,
      body: Stack(
        children: [
          Positioned(
              top: 200,
              right: 300,
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                    color: CustomColors.primary,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              )),
          Positioned(
              top: 290,
              left: 400,
              child: Container(
                width: 15,
                height: 15,
                decoration: const BoxDecoration(
                    color: CustomColors.purple,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              )),
          Positioned(
              bottom: 100,
              right: 500,
              child: Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                    color: CustomColors.secondary,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: widthOfScreen,
                height: 3,
                decoration: const BoxDecoration(
                    color: CustomColors.primary,
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 0,
                          blurRadius: 8,
                          color: CustomColors.primary)
                    ]),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Flex(
                    direction: widthOfScreen >= Breakpoints.xlg
                        ? Axis.horizontal
                        : Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(flex: 3, child: children[0]),
                      const Flexible(flex: 1, child: SizedBox()),
                      Flexible(flex: 3, child: children[1]),
                      const Flexible(flex: 1, child: SizedBox()),
                      Flexible(flex: 3, child: children[2])
                    ],
                  ),
                ),
              ),
             Container(
                width: widthOfScreen,
                height: 3,
                decoration: const BoxDecoration(
                    color: CustomColors.secondary,
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 0,
                          blurRadius: 8,
                          color: CustomColors.secondary)
                    ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
