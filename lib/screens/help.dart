import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.045,
                right: MediaQuery.of(context).size.width * 0.045,
                top: MediaQuery.of(context).size.height * 0.04,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Support',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01,
                      ),
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.width * 0.35,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Call Us Now: ',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text('\t01 2435796283'),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text(
                      'Write to Us: ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      ' support@homeiconhealth.ca',
                    ),
                  ]),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Address:',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              'ABC Society, XYZ Apartment, India, 251436 IN',
                              textAlign: TextAlign.right,
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Text(
                    'FAQ\'s',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) => DataPopUp(data[index]),
              itemCount: data.length,
            ),
          ],
        ),
      ),
    );
  }
}

final List<DataList> data = <DataList>[
  DataList(
    'Questions 1',
    <DataList>[
      /* DataList(
        'MI',
        <DataList>[
          DataList('Redmi Note 9'),
          DataList('Redmi Note 10'),
          DataList('Mi 10i 5G'),
        ],
      ),*/
      DataList('Answer 1'),
      // DataList('Apple'),
    ],
  ),
  DataList(
    'Questions 2',
    <DataList>[
      DataList('Answer 2'),
      //DataList('HP'),
    ],
  ),
  DataList(
    'Questions 3',
    <DataList>[
      DataList('Answer 3'),
      /*DataList('AC'),
      DataList(
        'Home Appliances',
        <DataList>[
          DataList('Water Purifier'),
          DataList('Inverter'),
          DataList('Vacuum Cleaner'),
        ],
      ),*/
    ],
  ),
];

class DataList {
  DataList(this.title, [this.children = const <DataList>[]]);

  final String title;
  final List<DataList> children;
}

class DataPopUp extends StatelessWidget {
  const DataPopUp(this.popup);

  final DataList popup;

  Widget _buildTiles(DataList root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<DataList>(root),
      title: Text(
        root.title,
      ),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(popup);
  }
}
