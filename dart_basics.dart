
// Student: Ahmed Abdelrahman Mohamed Salih
// Reg no: 26669/2024

const String regNo = '26669/2024';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// B2: Count vowels
// by AAMS
int countVowels(String text) {
  String lowerText = text.toLowerCase();
  int count = 0;
  int i = 0;

  while (i < lowerText.length) {
    if ('aeiou'.contains(lowerText[i])) {
      count++;
    }
    i++;
  }

  return count;
}

// B3: Generate initials
// by AAMS
String initials(String fullName) {
  String trimmedName = fullName.trim();

  if (trimmedName.isEmpty) {
    return '';
  }

  List<String> names = trimmedName.split(RegExp(r'\s+'));
  String result = '';

  int i = 0;
  while (i < names.length) {
    result += '${names[i][0].toUpperCase()}.';
    i++;
  }

  return result;
}

// C5: Draw a right-aligned triangle
// by AAMS
void drawTriangle(int height) {
  int row = 1;

  while (row <= height) {
    int spaces = height - row;
    String line = '';

    int s = 0;
    while (s < spaces) {
      line += ' ';
      s++;
    }

    String symbol = row.isOdd ? '*' : '#';

    int j = 0;
    while (j < row) {
      line += symbol;
      j++;
    }

    print(line);
    row++;
  }
}

// D2: Calculate MoMo transaction fee
// by AAMS
int momoFee(int amount) {
  if (amount <= 0) {
    return -1;
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

// D2: Mask phone number
// by AAMS
String maskPhone(String phone) {
  if (phone.length != 10) {
    return 'INVALID';
  }

  String result = phone.substring(0, 3);

  int i = 3;
  while (i < phone.length - 2) {
    result += '*';
    i++;
  }

  result += phone.substring(phone.length - 2);

  return result;
}

// Main function
// by AAMS
void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  // B2 tests
  String fullName = 'Ahmed Abdelrahman Mohamed Salih';
  print('$fullName has ${countVowels(fullName)} vowels');

  // B3 tests
  print(initials(fullName));
  print(initials(' ana uwase '));
  print(initials(' '));

  // C5 tests
  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  // D2 receipt printer
  String phone = maskPhone('0788123456');
  int totalFees = 0;
  int i = 1;

  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);

    print(
      'Receipt $i | $amount RWF | fee $fee RWF | to $phone',
    );

    totalFees += fee;
    i++;
  }

  print('Total fees: $totalFees RWF');
}
