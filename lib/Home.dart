import 'dart:convert';
import 'package:animation/themeprovider.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'model.dart';

bool Isios = true;

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        body: FutureBuilder(
            future: rootBundle.loadString("lib/vinas.json"),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "${snapshot.error}",
                  ),
                );
              } else if (snapshot.hasData) {
                String JsonData = snapshot.data;
                List myData = jsonDecode(JsonData);
                List Data =
                    myData.map((e) => JsonDecodeModel.map(data: e)).toList();
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 48.0, left: 30),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Explore",
                              style:
                                  TextStyle(fontSize: 44, color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 48.0),
                          child: Switch(
                            value: Isios,
                            onChanged: (val) {
                              Provider.of<themeprovider>(context, listen: false)
                                  .changetheme();
                            },
                            activeColor: Colors.white,
                            focusColor: Colors.black,
                            activeTrackColor: Colors.grey,
                            inactiveThumbColor: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      height: 500,
                      padding: EdgeInsets.all(32),
                      child: Swiper(
                        itemCount: Data.length,
                        itemWidth: MediaQuery.of(context).size.width - 2 * 55,
                        layout: SwiperLayout.STACK,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 100,
                                  ),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16 * 2)),
                                    elevation: 8,
                                    child: Padding(
                                      padding: const EdgeInsets.all(32.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 100,
                                          ),
                                          Text(
                                            Data[index].name,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 34,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            Data[index].type,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 23,
                                                color: Colors.grey),
                                          ),
                                          SizedBox(
                                            height: 32,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              JsonDecodeModel jss =
                                                  JsonDecodeModel(
                                                      position: Data[index]
                                                          .position,
                                                      name: Data[index].name,
                                                      type: Data[index].type,
                                                      radius: Data[index]
                                                          .radius,
                                                      orbital_period:
                                                          Data[index]
                                                              .orbital_period,
                                                      gravity: Data[index]
                                                          .gravity,
                                                      velocity:
                                                          Data[index].velocity,
                                                      distance:
                                                          Data[index].distance,
                                                      description: Data[index]
                                                          .description,
                                                      image: Data[index].image);
                                              Navigator.pushNamed(
                                                  context, 'detail',
                                                  arguments: jss);
                                            },
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Know More",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 18,
                                                      color: Colors.red[300]),
                                                ),
                                                Icon(
                                                    Icons
                                                        .arrow_forward_outlined,
                                                    color: Colors.red[300])
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Image.asset(Data[index].image)
                            ],
                          );
                        },
                      ),
                    )
                  ],
                );
              }
              return Container(
                height: MediaQuery.of(context).size.height / 1,
                child: Image.network(
                  'https://w0.peakpx.com/wallpaper/532/1/HD-wallpaper-shree-krishna-bhagavad-gita-lord-shiva-mahabharata-ramayan.jpg',
                  fit: BoxFit.cover,
                ),
              );
            }));
  }
}
