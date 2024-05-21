import 'package:flutter/material.dart';

class BuyModalSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Tab bar
            TabBar(
              labelColor: Colors.green,
              unselectedLabelColor: Colors.white,
              indicatorColor: Colors.green,
              tabs: [
                Tab(text: 'Buy'),
                Tab(text: 'Sell'),
              ],
            ),
            SizedBox(height: 20),
            // Tab bar view
            Expanded(
              child: TabBarView(
                children: [
                  // Buy tab content
                  _buildBuyContent(),
                  // Sell tab content
                  _buildSellContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBuyContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Limit, Market, Stop-Limit tabs
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ChoiceChip(
                label: Text('Limit', style: TextStyle(color: Colors.white)),
                selected: true,
                onSelected: (selected) {},
                backgroundColor: Colors.grey[800],
                selectedColor: Colors.grey[700],
              ),
              ChoiceChip(
                label: Text('Market', style: TextStyle(color: Colors.white)),
                selected: false,
                onSelected: (selected) {},
                backgroundColor: Colors.grey[800],
                selectedColor: Colors.grey[700],
              ),
              ChoiceChip(
                label:
                    Text('Stop-Limit', style: TextStyle(color: Colors.white)),
                selected: false,
                onSelected: (selected) {},
                backgroundColor: Colors.grey[800],
                selectedColor: Colors.grey[700],
              ),
            ],
          ),
          SizedBox(height: 20),
          // Input fields
          _buildInputField('Limit price', '0.00 USD'),
          _buildInputField('Amount', '0.00 USD'),
          _buildDropdown('Type', 'Good till cancelled'),
          // Post Only checkbox
          Row(
            children: [
              Checkbox(
                value: false,
                onChanged: (bool? newValue) {},
              ),
              Text('Post Only', style: TextStyle(color: Colors.white)),
            ],
          ),
          SizedBox(height: 20),
          // Total
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total', style: TextStyle(color: Colors.white)),
              Text('0.00', style: TextStyle(color: Colors.white)),
            ],
          ),
          SizedBox(height: 20),
          // Buy button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 100.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            child: Text('Buy BTC', style: TextStyle(color: Colors.white)),
          ),
          SizedBox(height: 20),
          // Total account value
          _buildAccountInfo('Total account value', '0.00 NGN'),
          _buildAccountInfo('Open Orders', '0.00'),
          _buildAccountInfo('Available', '0.00'),
          SizedBox(height: 20),
          // Deposit button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 100.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            child: Text('Deposit', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildSellContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildInputField('Limit price', '0.00 USD'),
          _buildInputField('Amount', '0.00 USD'),
          _buildDropdown('Type', 'Good till cancelled'),

          Row(
            children: [
              Checkbox(
                value: false,
                onChanged: (bool? newValue) {},
              ),
              Text('Post Only', style: TextStyle(color: Colors.white)),
            ],
          ),
          SizedBox(height: 20),
          // Total
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total', style: TextStyle(color: Colors.white)),
              Text('0.00', style: TextStyle(color: Colors.white)),
            ],
          ),
          SizedBox(height: 20),
          // Sell button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 100.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            child: Text('Sell BTC', style: TextStyle(color: Colors.white)),
          ),
          SizedBox(height: 20),
          // Total account value
          _buildAccountInfo('Total account value', '0.00 NGN'),
          _buildAccountInfo('Open Orders', '0.00'),
          _buildAccountInfo('Available', '0.00'),
          SizedBox(height: 20),
          // Deposit button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 100.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            child: Text('Deposit', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: Colors.white)),
          TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.grey[800],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: Colors.white)),
          DropdownButton<String>(
            value: value,
            items: <String>['Good till cancelled', 'Option 2', 'Option 3']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {},
            dropdownColor: Colors.grey[800],
            style: TextStyle(color: Colors.white),
            isExpanded: true,
          ),
        ],
      ),
    );
  }

  Widget _buildAccountInfo(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(color: Colors.white)),
        Text(value, style: TextStyle(color: Colors.white)),
      ],
    );
  }
}
