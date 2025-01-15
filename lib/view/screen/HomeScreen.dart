import 'package:flutter/material.dart';
import 'package:food_app_demo/view/StaticData/StaticData.dart';
import 'package:food_app_demo/view/screen/OrderDetailScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int itemes = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueGrey,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const OrderDetailScreen(),
              ));
            },
            child: const Text("Add Cart",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: Colors.white))),
      ),
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        title: const Text(
          "Menu",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 6,
              ),
              shrinkWrap: true,
              itemCount: StaticData.food.length,
              itemBuilder: (context, index) {
                final data = StaticData.food[index];
                return Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      // spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 1),
                    ),
                  ], color: Colors.white),
                  child: ListTile(
                    leading: ClipOval(
                        // borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                      data["img"],
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                    )),
                    title: Text(data["food"]),
                    subtitle: Text("₹${data["price"]}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            if (itemes > 0) {
                              setState(() {
                                itemes--;
                              });
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black)),
                            child: const Text(
                              "-",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 9,
                        ),
                        Text(itemes.toString()),
                        const SizedBox(
                          width: 9,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              itemes++;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black)),
                            child: const Text(
                              "+",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      )),
    );
  }
}
