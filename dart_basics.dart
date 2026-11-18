// Student: Ahmed Abdelrahman Mohamed Salih
// Reg no: 26669
const String regNo = '26669';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));


// B2: count vowels (capital letters count too)

int countVowels(String text) {
  // by AAMS
  String lower = text.toLowerCase(); // <- THIS line makes capital letters count
  int count = 0;
  int i = 0;
  while (i < lower.length) {
    String ch = lower[i];
    if (ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u') {
      count++;
    }
    i++;
  }
  return count;
}


// B3: initials, safe with extra spaces and empty input

String initials(String fullName) {
  // by AAMS
  String cleaned = fullName.trim(); // removes leading/trailing spaces
  if (cleaned.isEmpty) {
    return ''; // empty string or only spaces
  }
  List<String> parts = cleaned.split(RegExp(r'\s+')); // 1+ spaces = one gap
  String result = '';
  int i = 0;
  while (i < parts.length) {
    result += parts[i][0].toUpperCase() + '.';
    i++;
  }
  return result;
}


// C5: right-aligned triangle, odd rows '*', even rows '#'

void drawTriangle(int height) {
  // by AAMS
  int row = 1;
  while (row <= height) {
    String symbol = row % 2 == 1 ? '*' : '#';
    // spaces on this row = height - row, then `row` symbols
    print(' ' * (height - row) + symbol * row);
    row++;
  }
}


// D2: MoMo receipt printer

int momoFee(int amount) {
  // by AAMS
  if (amount <= 0) {
    return -1; // invalid
  } else if (amount <= 1000) {
    return 20;
  } else if (amount <= 10000) {
    return 100;
  } else if (amount <= 150000) {
    return 250;
  } else {
    return 1500;
  }
}

String maskPhone(String phone) {
  // by AAMS
  if (phone.length != 10) {
    return 'INVALID';
  }
  String first3 = phone.substring(0, 3);
  String last2 = phone.substring(phone.length - 2);
  String stars = '*' * (phone.length - 5); // everything in between
  return first3 + stars + last2;
}

void main() {
  // by AAMS
  print('Reg no: $regNo | D = $d | T = $t');

  // ----- B2 -----
  String fullName = 'Ahmed Abdelrahman Mohamed Salih';
  print('$fullName has ${countVowels(fullName)} vowels');

  // ----- B3 -----
  print(initials(fullName));
  print(initials(' ana uwase '));
  print(initials(' ')); // prints an empty line

  // ----- C5 -----
  print('--- drawTriangle(${d + 3}) ---');
  drawTriangle(d + 3);
  print('--- drawTriangle(0): nothing should appear below ---');
  drawTriangle(0);
  print('--- drawTriangle(-2): nothing should appear below ---');
  drawTriangle(-2);
  print('--- end of triangles ---');

  // ----- D2 -----
  String phone = '0788123456';
  int i = 1;
  int totalFees = 0;
  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}');
    totalFees += fee;
    i++;
  }
  print('Total fees: $totalFees RWF');
}

