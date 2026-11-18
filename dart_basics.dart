// code for B2, B3, C5 and D2
// Student: Ahmed Abdelrahman Mohamed Salih
 // Reg no: 26669/2024
 const String regNo = '26669'; 
 final int d = int.parse(regNo[regNo.length - 1]); 
 final int t = int.parse(regNo.substring(regNo.length - 2));

 void main() {
  String city = 'Kigali';
  print(city.length);
  print(city[city.length - 1]);
  print(city.substring(2, 4));
  print(city.toUpperCase().indexOf('A'));
  print(city.contains('k'));
  print('$city.length');
  print('${city.length}');
  print(city * 2);
  city.toUpperCase();
  print(city);
  print(city.replaceAll('i', '!'));
  print('5' + 5.toString());
  print(int.parse('5') + 5);
}