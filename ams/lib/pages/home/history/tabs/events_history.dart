import 'dart:developer';

import 'package:ati_ams/pages/home/history/view/history_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class EventsHistory extends StatefulWidget {
  const EventsHistory({Key key}) : super(key: key);

  @override
  _EventsHistoryState createState() => _EventsHistoryState();
}

class _EventsHistoryState extends State<EventsHistory> {
  var currentDate = DateTime.now();
  String startDate = DateFormat('dd/MM/yyyy').format(DateTime.now()).toString();
  String endDate = DateFormat('dd/MM/yyyy').format(DateTime.now()).toString();
  bool _expanded = false;
  String selectionText = 'Select date range to see history';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          color: Colors.green,
          child: ExpansionPanelList(
            animationDuration: Duration(milliseconds: 1500),
            children: [
              ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    title: Text(
                      selectionText,
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                },
                body: SfDateRangePicker(
                  selectionMode: DateRangePickerSelectionMode.range,
                  view: DateRangePickerView.month,
                  // minDate: minDate,
                  maxDate: currentDate,
                  showActionButtons: true,
                  onCancel: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        'Selection Cancelled',
                      ),
                      duration: Duration(milliseconds: 500),
                    ));
                  },
                  onSelectionChanged:
                      (DateRangePickerSelectionChangedArgs args) {
                    setState(() {
                      startDate = DateFormat('dd/MM/yyyy')
                          .format(args.value.startDate)
                          .toString();
                      endDate = DateFormat('dd/MM/yyyy')
                          .format(args.value.endDate ?? args.value.startDate)
                          .toString();
                    });
                  },
                  onSubmit: (value) {
                    setState(() {
                      _expanded = false;
                      selectionText = '$startDate - $endDate';
                    });
                    print(value);
                    log('Start Date: $startDate, End Date: $endDate');
                  },
                ),
                isExpanded: _expanded,
                canTapOnHeader: true,
              ),
            ],
            dividerColor: Colors.grey,
            expansionCallback: (panelIndex, isExpanded) {
              _expanded = !_expanded;
              setState(() {});
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(top: 8.0),
            itemCount: 10,
            itemBuilder: (context, index) {
              return HistoryView(
                date: '18-10-2021',
                startTime: '10:10 AM',
                endTime: '11:40 AM',
              );
            },
          ),
        ),
      ],
    );
  }
}
