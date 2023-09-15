import 'dart:math';

import 'package:animation/model.dart';
import 'package:flutter/material.dart';

class detail extends StatefulWidget {
  detail({Key? key}) : super(key: key);

  @override
  State<detail> createState() => _detailState();
}

class _detailState extends State<detail> {
  @override
  Widget build(BuildContext context) {
    JsonDecodeModel jsss =
        ModalRoute.of(context)!.settings.arguments as JsonDecodeModel;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 300,
                        ),
                        Text(
                          jsss.name,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 56, fontWeight: FontWeight.w900),
                        ),
                        Text(
                          jsss.type,
                          style: TextStyle(
                            fontSize: 31,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Divider(
                          color: Colors.black38,
                        ),
                        Text(jsss.description),
                        Divider(
                          color: Colors.black38,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 32.0),
                          child: Text(
                            'Gallery',
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 25,
                              color: const Color(0xff47455f),
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          height: 250,
                          padding: const EdgeInsets.only(left: 32.0),
                          child: ListView.builder(
                              itemCount: 1,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Card(
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: AspectRatio(
                                      aspectRatio: 1,
                                      child: Image.asset(
                                        jsss.image,
                                        fit: BoxFit.cover,
                                      )),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Positioned(
            //   right: -280,
            //   bottom: 300,
            //   child: Hero(tag: jsss.position, child: Image.asset(jsss.image)),
            // ),
            Positioned(
              right: -264,
              bottom: 300,
              child: TweenAnimationBuilder(
                tween: Tween<double>(
                  begin: 0,
                  end: 2 * pi,
                ),
                duration: const Duration(seconds: 16),
                child: Hero(tag: jsss.position, child: Image.asset(jsss.image)),
                builder: (context, value, widget) {
                  return Transform.rotate(
                    angle: value,
                    child: widget,
                  );
                },
              ),
            ),
            Positioned(
              top: 60,
              left: 32,
              child: Text(
                jsss.position.toString(),
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 247,
                  color: Colors.black.withOpacity(0.08),
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
