// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/riders/rider_earning_view/view/rider_transaction_details_screen.dart';
import 'package:discount_me_app/view/vendors/vendor_earning_view/view/vendor_transaction_details_screen.dart';

class BrokerTransactionTableWidget extends StatelessWidget {
  BrokerTransactionTableWidget({super.key});

  final List<Map<String, String>> transactions = List.generate(
    8,
        (index) => {
      'name': 'Robert Fox',
      'account': '(516) 831-1111',
      'date': '02-24-2024',
      'amount': '\$200',
    },
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            headingRowColor: MaterialStateProperty.all(AppColors.secondaryColor),
            headingTextStyle: TextStyle(color: Colors.white),
            columns: <DataColumn>[
              DataColumn(label: Text('#SI')),
              DataColumn(label: Text('Full Name')),
              DataColumn(label: Text('Acc Number')),
              DataColumn(
                label: Row(
                  children: [
                    Text('Date'),
                    Icon(Icons.arrow_upward, size: 16),
                  ],
                ),
              ),
              DataColumn(label: Text('Amount')),
            ],
            rows: transactions.asMap().entries.map(
                  (entry) {
                return DataRow(

                  onSelectChanged: (isSelected) {
                    debugPrint(isSelected.toString());
                  },

                  cells: [
                    DataCell(Text((entry.key + 1).toString().padLeft(2, '0'))),

                    DataCell(
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(AppImages.homeProfileAvatar),
                            radius: 15,
                          ),
                          SizedBox(width: 10),
                          // Instead of Flexible, use Expanded inside the Row
                          Expanded(
                            child: Text(
                              entry.value['name']!,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),

                    DataCell(Text(entry.value['account']!)),
                    DataCell(Text(entry.value['date']!)),
                    DataCell(Text(entry.value['amount']!)),
                  ],
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
