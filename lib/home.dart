import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 209, 235),
        body: SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 65, right: 10, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Vintage Blooms',
                  style: TextStyle(
                      // color: Colors.pink,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/profile.png'),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 17, 131, 26),
                      blurRadius: 5.0,
                      offset: Offset(0, 5)),
                  BoxShadow(
                      color: Color.fromARGB(255, 52, 132, 179),
                      blurRadius: 5.0,
                      offset: Offset(-5, 5))
                ],
              ),
              height: 60,
              child: TextFormField(
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  labelText: 'search',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 10),
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.pink,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 150,
                  width: 200,
                  child: Image.asset(
                    'assets/promo1.jpg',
                    fit: BoxFit.fill,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 17, 131, 26),
                          blurRadius: 5.0,
                          offset: Offset(0, 5)),
                      BoxShadow(
                          color: Color.fromARGB(255, 52, 132, 179),
                          blurRadius: 5.0,
                          offset: Offset(-5, 5))
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 150,
                  width: 200,
                  child: Image.asset(
                    'assets/promo.jpg',
                    fit: BoxFit.fill,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 17, 131, 26),
                          blurRadius: 5.0,
                          offset: Offset(0, 5)),
                      BoxShadow(
                          color: Color.fromARGB(255, 52, 132, 179),
                          blurRadius: 5.0,
                          offset: Offset(-5, 5))
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 10),
            child: Text(
              'Catgeories',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 17, 131, 26),
                            blurRadius: 5.0,
                            offset: Offset(0, 5)),
                        BoxShadow(
                            color: Color.fromARGB(255, 52, 132, 179),
                            blurRadius: 5.0,
                            offset: Offset(-5, 5))
                      ],
                    ),
                    height: 80,
                    width: 80,
                    child: Image.asset(
                      'assets/cat1.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Flowers',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 17, 131, 26),
                            blurRadius: 5.0,
                            offset: Offset(0, 5)),
                        BoxShadow(
                            color: Color.fromARGB(255, 52, 132, 179),
                            blurRadius: 5.0,
                            offset: Offset(-5, 5))
                      ],
                    ),
                    height: 80,
                    width: 80,
                    child: Image.asset(
                      'assets/cat2.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Vase',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 17, 131, 26),
                            blurRadius: 5.0,
                            offset: Offset(0, 5)),
                        BoxShadow(
                            color: Color.fromARGB(255, 52, 132, 179),
                            blurRadius: 5.0,
                            offset: Offset(-5, 5))
                      ],
                    ),
                    height: 80,
                    width: 80,
                    child: Image.asset(
                      'assets/cat3.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Gifts',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 17, 131, 26),
                            blurRadius: 5.0,
                            offset: Offset(0, 5)),
                        BoxShadow(
                            color: Color.fromARGB(255, 52, 132, 179),
                            blurRadius: 5.0,
                            offset: Offset(-5, 5))
                      ],
                    ),
                    height: 80,
                    width: 80,
                    child: Image.asset(
                      'assets/cat4.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Events',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 10),
            child: Text(
              'Popular Items',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    height: 180,
                    width: 180,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/pop.jpg',
                          fit: BoxFit.fill,
                        )),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                  
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    'Sunflowers',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                ],
                
              ),

              Column(
                children: [
                  Container(
                    height: 180,
                    width: 180,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/pop1.jpg',
                          fit: BoxFit.fill,
                        )),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    'Roses',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                ],
                
              ),
            ],
          )
        ],
      ),
    ));
  }
}
