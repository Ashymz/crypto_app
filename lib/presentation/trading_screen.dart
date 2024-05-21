import 'package:crypto_app/widgets/buy_modal.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class TradingScreen extends StatefulWidget {
  @override
  State<TradingScreen> createState() => _TradingScreenState();
}

class _TradingScreenState extends State<TradingScreen> {
  dynamic mycolor = Color(0xFF1C2127);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Image.asset(
            'assets/images/logo.png',
          ),
          actions: [
            Image.asset('assets/images/avatar.png'),
            SizedBox(width: 8),
            Icon(
              Icons.language,
            ),
            SizedBox(width: 8),
            Image.asset('assets/images/menu.png'),
            SizedBox(width: 16),
          ],
        ),
        body: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/images/btci.png'),
                        SizedBox(width: 5),
                        Text(
                          '\$20,634',
                          style: TextStyle(
                            color: Colors.greenAccent,
                            fontSize: 19,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '24h high',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '520.80 +1.25%',
                              style: TextStyle(color: Colors.greenAccent),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '24h high',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '520.80 +1.25%',
                              style: TextStyle(color: Colors.greenAccent),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '24h low',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '520.80 +1.25%',
                              style: TextStyle(color: Colors.greenAccent),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: mycolor,
                  border: Border.all(color: mycolor, width: 1.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: TabBar(
                    tabs: [
                      Tab(text: 'Charts'),
                      Tab(text: 'Orderbook'),
                      Tab(text: 'Recent trades'),
                    ],
                    tabAlignment: TabAlignment.fill,
                    indicatorPadding: EdgeInsets.all(3),
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[700],
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white,
                    labelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: LineChart(
                        LineChartData(
                          titlesData: FlTitlesData(
                            leftTitles: SideTitles(showTitles: true),
                            bottomTitles: SideTitles(showTitles: true),
                          ),
                          gridData: FlGridData(show: true),
                          borderData: FlBorderData(show: true),
                          lineBarsData: [
                            LineChartBarData(
                              isCurved: true,
                              colors: [Colors.greenAccent],
                              barWidth: 4,
                              belowBarData: BarAreaData(show: false),
                              spots: [
                                FlSpot(0, 3),
                                FlSpot(1, 1),
                                FlSpot(2, 4),
                                FlSpot(3, 3),
                                FlSpot(4, 2),
                                FlSpot(5, 5),
                                FlSpot(6, 4),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    OrderbookTab(),
                    RecentTradesTab(),
                  ],
                ),
              ),

              // Container(
              //   height: 55,
              //   width: MediaQuery.of(context).size.width,
              //   decoration: BoxDecoration(
              //     color: mycolor,
              //     border: Border.all(color: mycolor, width: 1.0),
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.all(2),
              //     child: TabBar(
              //       tabs: [
              //         Tab(text: 'Open Orders'),
              //         Tab(text: 'Positions'),
              //         Tab(text: 'Option'),
              //       ],

              //       tabAlignment: TabAlignment.fill,
              //       indicatorPadding: EdgeInsets.all(3),
              //       dividerColor: Colors.transparent,
              //       indicator: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10),
              //         color: Colors.grey[700],
              //       ),
              //       indicatorSize: TabBarIndicatorSize.tab,
              //       labelColor: Colors.white,
              //       unselectedLabelColor: Colors.white,
              //       labelStyle: TextStyle(
              //         fontSize: 16,
              //         fontWeight: FontWeight.bold,
              //       ),
              //       unselectedLabelStyle: TextStyle(
              //         fontSize: 16,
              //         fontWeight: FontWeight.normal,
              //       ),
              //     ),
              //   ),
              // ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'No Open Orders',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id pulvinar nullam sit imperdiet pulvinar.',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => BuyModalSheet(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 72.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text('Buy',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 72.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text('Sell',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderbookTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Price\n(USDT)',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Text(
              'Amounts\n(BTC)',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Text(
              'Total',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Divider(color: Colors.white),
        OrderbookEntry(
          price: '36920.12',
          amount: '0.758965',
          total: '28,020.98',
          color: Colors.redAccent,
        ),
        OrderbookEntry(
          price: '36920.12',
          amount: '0.758965',
          total: '28,020.98',
          color: Colors.redAccent,
        ),
        OrderbookEntry(
          price: '36920.12',
          amount: '0.758965',
          total: '28,020.98',
          color: Colors.redAccent,
        ),
        OrderbookEntry(
          price: '36920.12',
          amount: '0.758965',
          total: '28,020.98',
          color: Colors.redAccent,
        ),
        OrderbookEntry(
          price: '36920.12',
          amount: '0.758965',
          total: '28,020.98',
          color: Colors.redAccent,
        ),
        Divider(color: Colors.white),
        OrderbookEntry(
          price: '36,641.20',
          amount: '0.758965',
          total: '28,020.98',
          color: Colors.greenAccent,
        ),
        OrderbookEntry(
          price: '36,641.20',
          amount: '0.758965',
          total: '28,020.98',
          color: Colors.greenAccent,
        ),
        OrderbookEntry(
          price: '36,641.20',
          amount: '0.758965',
          total: '28,020.98',
          color: Colors.greenAccent,
        ),
        OrderbookEntry(
          price: '36,641.20',
          amount: '0.758965',
          total: '28,020.98',
          color: Colors.greenAccent,
        ),
        OrderbookEntry(
          price: '36,641.20',
          amount: '0.758965',
          total: '28,020.98',
          color: Colors.greenAccent,
        ),
      ],
    );
  }
}

class OrderbookEntry extends StatelessWidget {
  final String price;
  final String amount;
  final String total;
  final Color color;

  OrderbookEntry({
    required this.price,
    required this.amount,
    required this.total,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            price,
            style: TextStyle(color: color),
          ),
          Text(
            amount,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            total,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class RecentTradesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Time',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Text(
              'Price (USDT)',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Text(
              'Amount (BTC)',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Divider(color: Colors.white),
        RecentTradeEntry(
          time: '12:01:02',
          price: '36,641.54',
          amount: '0.01',
        ),
        RecentTradeEntry(
          time: '12:02:45',
          price: '36,642.12',
          amount: '0.02',
        ),
        RecentTradeEntry(
          time: '12:03:10',
          price: '36,640.50',
          amount: '0.05',
        ),
        RecentTradeEntry(
          time: '12:04:33',
          price: '36,639.30',
          amount: '0.03',
        ),
        RecentTradeEntry(
          time: '12:05:22',
          price: '36,638.20',
          amount: '0.04',
        ),
      ],
    );
  }
}

class RecentTradeEntry extends StatelessWidget {
  final String time;
  final String price;
  final String amount;

  RecentTradeEntry({
    required this.time,
    required this.price,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            time,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            price,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            amount,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
