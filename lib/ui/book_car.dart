import 'package:flutter/material.dart';
import 'package:car_rental/constants.dart';
import 'package:car_rental/data.dart';

class BookCar extends StatefulWidget {

  final Car car;

  BookCar({required this.car});

  @override
  _BookCarState createState() => _BookCarState();
}

class _BookCarState extends State<BookCar> {

  int _currentImage = 0;

  List<Widget> buildPageIndicator(){
    List<Widget> list = [];
    for (var i = 0; i < widget.car.images.length; i++) {
      list.add(buildIndicator(i == _currentImage));
    }
    return list;
  }

  Widget buildIndicator(bool isActive){
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 6),
      height: 8,
      width: isActive ? 20 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey[400],
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  border: Border.all(
                                    color: Colors.grey[300]!,
                                    width: 1,
                                  ),
                                ),
                                child: Icon(
                                  Icons.keyboard_arrow_left,
                                  color: Colors.black,
                                  size: 28,
                                )
                              ),
                            ),

                            Row(
                              children: [

                                Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.bookmark_border,
                                    color: Colors.white,
                                    size: 22,
                                  )
                                ),

                                SizedBox(
                                  width: 16,
                                ),

                                Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    border: Border.all(
                                      color: Colors.grey[300]!,
                                      width: 1,
                                    ),
                                  ),
                                  child: Tooltip(
                                    message: 'Bagikan',
                                    child: Icon(
                                      Icons.share,
                                      color: Colors.black,
                                      size: 22,
                                    ),
                                  )
                                ),

                              ],
                            ),

                          ],
                        ),
                      ),

                      SizedBox(
                        height: 16,
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          widget.car.model,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 8,
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          widget.car.brand,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 8,
                      ),

                      Expanded(
                        child: Container(
                          child: PageView(
                            physics: BouncingScrollPhysics(),
                            onPageChanged: (int page){
                              setState(() {
                                _currentImage = page;
                              });
                            },
                            children: widget.car.images.map((path) {
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 16,),
                                child: Hero(
                                  tag: widget.car.model,
                                  child: Image.asset(
                                    path,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),

                      widget.car.images.length > 1
                      ? Container(
                        margin: EdgeInsets.symmetric(vertical: 16),
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: buildPageIndicator(),
                        ),
                      )
                      : Container(),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          height: 120,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              buildPricePerPeriod(
                                "Kondisi",
                                widget.car.condition?'Baru':'Bekas',
                                widget.car.condition?'':'2000 KM',
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              buildPricePerPeriod(
                                "Tenor",
                                "36",
                                'Bulan',
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              buildPricePerPeriod(
                                "Asuransi",
                                "All Risk",
                                'by ASTRA',
                              ),

                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: Text(
                        "Spesifikasi",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),

                    Container(
                      height: 80,
                      padding: EdgeInsets.only(top: 8, left: 16,),
                      margin: EdgeInsets.only(bottom: 16),
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          buildSpecificationCar("Warna", "White"),
                          buildSpecificationCar("Transmisi", "Automatic"),
                          buildSpecificationCar("Kursi", "4 seat"),
                          buildSpecificationCar("Mesin", "v10 2.0"),
                          buildSpecificationCar("Acc (0-100)", "3.2/s"),
                          buildSpecificationCar("Top speed", "200 km/h"),
                        ],
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(
                  "12 Month",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),

                SizedBox(
                  height: 4,
                ),

                Row(
                  children: [

                    Text(
                      "USD 4,350",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    SizedBox(
                      width: 8,
                    ),

                    Text(
                      "per month",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),

                  ],
                ),

              ],
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "Book this car",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPricePerPeriod(String topString, String midString, String bottomString){
    return Expanded(
      child: Container(
        height: 110,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color:  Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          border: Border.all(
            color: Colors.grey[300]!,
            width:  1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              topString,
              style: TextStyle(
                color:  Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),

            Expanded(
              child: Container(),
            ),

            Text(
              midString,
              style: TextStyle(
                color:  bottomString=='2000 KM' ? Colors.red :Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              bottomString,
              style: TextStyle(
                color: bottomString=='2000 KM' ? Colors.red : Colors.black,
                fontSize: 14,
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget buildSpecificationCar(String title, String data){
    return Container(
      width: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16,),
      margin: EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            title,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),

          SizedBox(
            height: 8,
          ),

          Text(
            data,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

        ],
      ),
    );
  }

}