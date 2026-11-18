// Student: Ahmed Abdelrahman Mohamed Salih
// Reg no: 26669
const String regNo = '26669';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// copied from D2
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

// 1) formatRwf: commas every 3 digits + " RWF"
String formatRwf(int amount) {
  // by AAMS
  String s = amount.toString();
  bool negative = s.startsWith('-');
  String digits = negative ? s.substring(1) : s; // work on digits only
  String out = '';
  int i = digits.length - 1;
  int counter = 0; // digits placed so far
  while (i >= 0) {
    if (counter > 0 && counter % 3 == 0) {
      out = ',' + out; // comma before every group of three (from the right)
    }
    out = digits[i] + out;
    counter++;
    i--;
  }
  if (negative) {
    out = '-' + out;
  }
  return '$out RWF';
}

// 2) isValidPin
bool isValidPin(String pin) {
  // by AAMS
  if (pin.length != 5) {
    return false;
  }
  int i = 0;
  while (i < pin.length) {
    int code = pin.codeUnitAt(i);
    if (code < 48 || code > 57) {
      return false; // not a digit 0-9
    }
    i++;
  }
  if (pin == '12345') {
    return false;
  }
  if (pin == pin[0] * 5) {
    return false; // same digit five times
  }
  return true;
}

// 3) sendMoney
int sendMoney(int balance, int amount) {
  // by AAMS
  int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - amount - fee;
  print('Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). '
      'New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

// 4) buyAirtime (no fee)
int buyAirtime(int balance, int amount) {
  // by AAMS
  if (amount < 100 || amount > 50000) {
    print('Failed: airtime must be from 100 to 50,000 RWF');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - amount;
  print('Airtime ${formatRwf(amount)} bought. '
      'New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

void main() {
  // by AAMS
  print('Reg no: $regNo | D = $d | T = $t');

  // 1) PIN checks
  print("isValidPin('12345')  -> ${isValidPin('12345')}");
  print("isValidPin('77777')  -> ${isValidPin('77777')}");
  print("isValidPin('4821')   -> ${isValidPin('4821')}");
  print("isValidPin('48a21')  -> ${isValidPin('48a21')}");
  print("isValidPin('4821$d') -> ${isValidPin('4821$d')}");

  // 2) starting balance
  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  // 3) transactions, in order
  balance = sendMoney(balance, (d + 1) * 3000);
  balance = sendMoney(balance, (d + 1) * 3000);
  balance = sendMoney(balance, (d + 1) * 3000);
  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  // 4) final balance
  print('Final balance: ${formatRwf(balance)}');

  // 5) my own tests (expected output in the comment)
  print(formatRwf(0)); // expect: 0 RWF
  print(formatRwf(999)); // expect: 999 RWF
  print(formatRwf(1000)); // expect: 1,000 RWF
  print(formatRwf(100000)); // expect: 100,000 RWF (6 digits: no comma at the front)
  print(formatRwf(-500)); // expect: -500 RWF <- might break (my first draft gave -,500 RWF)
  print(formatRwf(-1000)); // expect: -1,000 RWF <- might break (is the '-' counted as a digit?)
  print(isValidPin('00000')); // expect: false (same digit five times)
  print(isValidPin('54321')); // expect: true (5 digits, not 12345, not all the same)
  print(isValidPin('-1234')); // expect: false <- might break ('-' is not a digit; int.tryParse would wrongly accept it)
  print(isValidPin('12 45')); // expect: false (a space is not a digit)
}

