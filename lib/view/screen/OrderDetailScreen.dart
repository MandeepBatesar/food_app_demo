import 'package:flutter/material.dart';
import 'package:food_app_demo/view/StaticData/StaticData.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({super.key});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  int _itemes = 0;
  int _members = 0;
  List<bool> isSelectedList =
      List<bool>.filled(StaticData.tableNo.length, false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        title: const Text(
          "Cart",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
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
                            if (_itemes > 0) {
                              setState(() {
                                _itemes--;
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
                        Text(_itemes.toString()),
                        const SizedBox(
                          width: 9,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _itemes++;
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
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 1),
                  ),
                ],
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total People"),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            if (_members > 0) {
                              setState(() {
                                _members--;
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
                        Text(_members.toString()),
                        const SizedBox(
                          width: 9,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _members++;
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
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(),
                const SizedBox(
                  height: 15,
                ),
                const Text("Total"),
                const Text(
                  "₹1200",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: Colors.red),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(22)),
                                side: BorderSide(color: Colors.red))),
                        child: const Text("Canncel",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.w400))),
                    const SizedBox(
                      width: 15,
                    ),
                    /************************** Oder  */
                    Expanded(
                      child: TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  // insetPadding: const EdgeInsets.all(12),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Please Select Your Table",
                                          style: TextStyle(
                                              fontSize: 18, color: Colors.red),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        GridView.builder(
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 6,
                                                  crossAxisSpacing: 6,
                                                  mainAxisSpacing: 6),
                                          shrinkWrap: true,
                                          itemCount: StaticData.tableNo.length,
                                          itemBuilder: (context, index) {
                                            final data =
                                                StaticData.tableNo[index];
                                            return GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isSelectedList[index] =
                                                      !isSelectedList[index];
                                                });
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                // padding: consconstt EdgeInsets.all(6),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color: isSelectedList[
                                                                index]
                                                            ? Colors.black
                                                            : Colors.red)),
                                                child: Text(
                                                  data.toString(),
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color:
                                                          isSelectedList[index]
                                                              ? Colors.black
                                                              : Colors.red),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: TextButton(
                                              onPressed: () {},
                                              style: TextButton.styleFrom(
                                                  backgroundColor: Colors.red),
                                              child: const Text("Save",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400))),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          style:
                              TextButton.styleFrom(backgroundColor: Colors.red),
                          child: const Text("Order",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400))),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
