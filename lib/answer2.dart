import 'package:flutter/material.dart';

class answer2 extends StatefulWidget {
  const answer2({super.key});

  @override
  _answer2 createState() => _answer2();
}

class _answer2 extends State<answer2> {
   final TextEditingController _principalController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  String _result = '';
  String? _selectedItrm;
  List<String> _categories = ['ในเมือง', 'ต่างจังหวัด','ต่างประเทศ'];
  
  bool _isChecked = false;
  bool _isChecked2 = false;
  String? __car;

  void _calculateInterest() {
    double principal = double.tryParse(_principalController.text) ?? 0;
    double rate = double.tryParse(_rateController.text) ?? 0;
    int time = int.tryParse(_timeController.text) ?? 0;
    int _isCheckedmoney2 = 0;
    int _isCheckedmoney1 = 0;
    int __carmoney = 0;
    int _moneycat = 0;

    if(_isChecked == true){_isCheckedmoney1 = 20;}
    if(_isChecked2 == true){_isCheckedmoney2 = 50;}
    double interest = (principal * rate * time) / 100;

    if(__car == 'ปกติ'){__carmoney = 0;}
    else if(__car == 'ด่วน'){__carmoney = 30;}
    else if(__car == 'ด่วนพิเศษ'){__carmoney = 20;}

    if(_selectedItrm == 'ในเมือง'){_moneycat = 10;}
    else if(_selectedItrm == 'ต่างจังหวัด'){_moneycat = 15;}
    else if(_selectedItrm == 'ต่างประเทศ'){_moneycat = 50;}
    double totalAmount = (_moneycat*principal) + interest+ _isCheckedmoney2 +_isCheckedmoney1+__carmoney;
    
    setState(() {
      _result = 
          'ค่าจัดส่งทั้งหมด(บาท): ${totalAmount.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('คำนวณค่าจัดส่ง'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
              
            TextField(
             controller: _principalController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'น้ำหนักสินค้า (กิโลกรัม) :',
              border: OutlineInputBorder(),),
              
              ),
              const SizedBox(height: 15),
              DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'เลือกระยะทาง',
                    border: OutlineInputBorder(),
                  ),
                  value: _selectedItrm,
                  items: _categories.map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedItrm = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณาเลือกระยะทาง';
                    }
                    return null;
                  },
                ),

            const Text('บริการเสริม :',textAlign: TextAlign.left),
            const SizedBox(height: 10),

            CheckboxListTile(
              title: const Text('แพ็คกิ้งพิเศษ: +20 บาท'),
              value: _isChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value!;
                });
              },
            ),
            
          const SizedBox(height: 10),    
            CheckboxListTile(
              title: const Text('ประกันพัสดุ: +50 บาท'),
              value: _isChecked2,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked2 = value!;
                });
              },
            ),
          const SizedBox(height: 15),  
          const Text('เลือกความเร่งด่วน :'),
  Column(children: [
    RadioListTile(
      title: const Text('ปกติ'),
      value: 'ปกติ',
      groupValue: __car,
      onChanged: (String? value) {
        setState(() {
          __car = value;
        });
      },
    ),

    RadioListTile(
      title: const Text('ด่วน'),
      value: 'ด่วน',
      groupValue: __car,
      onChanged: (String? value) {
        setState(() {
          __car = value;
        });
      },
    ),
    RadioListTile(
      title: const Text('ด่วนพิเศษ'),
      value: 'ด่วนพิเศษ',
      groupValue: __car,
      onChanged: (String? value) {
        setState(() {
          __car = value;
        });
      },
    ),

  ],
  
  ),

            

            
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateInterest,
              child: const Text('คำนวณราคา'),
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}