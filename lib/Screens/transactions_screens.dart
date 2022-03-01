import 'package:flutter/material.dart';

class TransactionsHistoryPage extends StatefulWidget {
  const TransactionsHistoryPage({Key? key}) : super(key: key);

  @override
  _TransactionsHistoryPageState createState() =>
      _TransactionsHistoryPageState();
}

class _TransactionsHistoryPageState extends State<TransactionsHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.red),
                          padding: const EdgeInsets.all(12),
                          child: const Icon(
                              Icons.account_balance_wallet_outlined)),
                      Column(
                        children: const [
                          Text('My Wallet'),
                          Text('\$34000'),
                        ],
                      )
                    ],
                  ),
                  const CircleAvatar(
                    child: Icon(Icons.person),
                  )
                ],
              ),
            ),
            Row(
              children: [
                const Text(
                  'All Transactions',
                  style: TextStyle(fontSize: 30),
                ),
                OutlinedButton(
                  onPressed: null,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(const CircleBorder()),
                  ),
                  child: const Icon(Icons.search),
                ),
                OutlinedButton(
                  onPressed: null,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(const CircleBorder()),
                  ),
                  child: const Icon(Icons.calendar_month),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red),
                    child: Row(
                      children: [
                        const Icon(Icons.keyboard_arrow_up_outlined),
                        const Text('Income')
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red),
                    child: Row(
                      children: const [
                        Icon(Icons.keyboard_arrow_down_sharp),
                        Text('Spend')
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              'Transactions',
              style: TextStyle(fontSize: 30),
            ),
            const ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.transform_sharp),
              ),
              title: Text('No. of neighbours Helped'),
              trailing: Text("5"),
            ),
            const ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.transform_sharp),
              ),
              title: Text('Shared with me'),
              trailing: Text("\$655"),
            ),
            const ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.transform_sharp),
              ),
              title: Text('Shared with neighbours'),
              trailing: Text("\$5"),
            ),
            const ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.transform_sharp),
              ),
              title: Text('No of times helped'),
              trailing: Text("5"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Badge',
                  style: TextStyle(fontSize: 30),
                ),
                OutlinedButton(
                  onPressed: null,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder()),
                  ),
                  child: const Text('Super High'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
