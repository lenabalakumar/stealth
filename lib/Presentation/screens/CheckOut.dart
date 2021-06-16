import 'package:flutter/material.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<int, String> hintTextMap = {
      1: "Mobile number",
      2: "Name",
      3: "Address line 1",
      4: "Address line 2",
      5: "Landmark",
      6: "Pincode"
    };
    return Scaffold(
      appBar: AppBar(
        title: Text('Check out'),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Column(
                children: hintTextMap.entries
                    .map((e) => hintTextCard(e.key, e.value))
                    .toList(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      'OrderSummary',
                    );
                  },
                  child: Container(
                    height: 60,
                    width: 160,
                    child: Center(
                      child: Text(
                        'Place your order',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget hintTextCard(int key, String value) {
  return Container(
    width: 300,
    child: TextField(
      decoration: InputDecoration(
        hintText: value,
        hintStyle: TextStyle(fontStyle: FontStyle.italic),
      ),
      keyboardType: TextInputType.streetAddress,
    ),
  );
}
