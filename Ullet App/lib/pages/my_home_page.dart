import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platzi_trip_flutter/component/colors.dart';
import 'package:platzi_trip_flutter/pages/payment_page.dart';
import 'package:platzi_trip_flutter/widgets/buttons.dart';
import 'package:platzi_trip_flutter/widgets/large_buttons.dart';
import 'package:platzi_trip_flutter/widgets/text_size.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: Container(
        height: h,
        child: Stack(
          children: [
            _headSection(),
            _listBills(),
            _payButton(),
          ],
        )
      )
    );
  }
  _headSection(){
    return Container(
      height: 310,
      child: Stack(
        children: [
          _mainBackground(),
          _curveImageContainer(),
          _buttonContainer(),
          _textContainer(),
        ],
      ),
    );
  }
  
  _buttonContainer(){
    return Positioned(
        right: 50,
        bottom: 12,
        child: GestureDetector(
          onTap: (){
            showModalBottomSheet<dynamic>(
              isScrollControlled:true,
              barrierColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                context: context, builder: (BuildContext bc){
              return Container(
                height: MediaQuery.of(context).size.height-240,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                        child: Container(
                      color: Color(0xFFeef1f4).withOpacity(0.7),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height-300,
                    )),
                    Positioned(
                      top: 0,
                      right: 50,
                        child: Container(
                          padding: const EdgeInsets.only(top: 5,bottom: 25),
                          width: 60,
                          height: 250,
                          decoration: BoxDecoration(
                            color: AppColor.mainColor,
                            borderRadius: BorderRadius.circular(29)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppButtons(icon: Icons.cancel,
                                iconColor:AppColor.mainColor ,
                              textColor: Colors.white,
                              backgroundColor: Colors.white,
                              onTap: (){Navigator.pop(context);},),
                              AppButtons(icon: Icons.add,
                                iconColor:AppColor.mainColor ,
                                textColor: Colors.white,
                                backgroundColor: Colors.white,
                                onTap: (){},
                                text: 'Add Bill',
                              ),
                              AppButtons(icon: Icons.history,
                                iconColor:AppColor.mainColor ,
                                textColor: Colors.white,
                                backgroundColor: Colors.white,
                                onTap: (){},
                                text: 'History',
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              );
            });
          },
          child: Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'images/lines.png'
            )
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              offset: Offset(0,1),
              color: Color(0xFF11324d).withOpacity(0.2)
            )
          ]
      ),
    ),
        ));
  }
  _mainBackground(){
    return Positioned(
      bottom: 10,
        left: 0,
        child: Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "images/background.png"
              )
            )
          ),
        )
    );
  }
  _curveImageContainer(){
    return Positioned(
        left:0,
        right: -2,
        bottom: 10,
        child:
      Container(
        height: MediaQuery.of(context).size.height*0.1,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      "images/curve.png"
                  )
              )
          )
      )
    );
  }
  _textContainer(){
    return Stack(
      children: [
        Positioned(
            left: 10,
            top: 80,
            child: Text(
              'Ullet',
              style: TextStyle(
                fontSize: 90,
                fontWeight: FontWeight.bold,
                color: Color(0xFF293952),
              ),
            )),
        Positioned(
            left: 50,
            top: 70,
            child: Text(
              'Ullet',
              style: TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            )),
      ],
    );
  }
  
  _listBills(){
    return Positioned(
        top: 305,
        left: 0,
        right: 10,
        bottom: 0,
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (_,index){
              return Container(
                margin: const EdgeInsets.only(top: 15),
                height: 110,
                width: MediaQuery.of(context).size.width-20,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30)
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFFd8dbe0),
                          offset: Offset(1,1),
                          blurRadius: 20.0,
                          spreadRadius: 10
                      )
                    ]
                ),
                child:Container(
                  margin: const EdgeInsets.only(top:10,left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 3,
                                      color: Colors.grey,
                                    ),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            "images/brand1.png"
                                        )
                                    )
                                ),
                              ),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Dunord: Cafe',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColor.mainColor
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                    'ID: 23423423',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColor.mainColor
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),

                          SizedText(text: 'AutoPay on 24th Dec 22', color: AppColor.green),
                          SizedBox(height: 5,)
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 80,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: AppColor.selectBackground
                                ),
                                child: Center(
                                  child: Text(
                                    'Select',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: AppColor.selectColor
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(child: Container()),
                              Text(
                                '\$124.000',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: AppColor.mainColor
                                ),
                              ),
                              Text(
                                'Due in 3 Days',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.idColor
                                ),
                              ),
                              SizedBox(height: 10,)
                            ],
                          ),
                          SizedBox(width: 5,),
                          Container(
                            width: 5,
                            height: 35,
                            decoration: BoxDecoration(
                                color: AppColor.halfOval,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30)
                                )
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
    );
  }
  _payButton(){
    return Positioned(
      bottom: 20,
        child: AppLargeButton(text:'Pay All',textColor: Colors.white,onTap: (){Get.to(()=>PaymentPage());},)
    );
  }
}
