
// Student: Ahmed Abdelrahman Mohamed Salih
// Reg no: 26669/2024

const String regNo = '26669/2024';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// Calculate MoMo transaction fee
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

// Format money with commas
// by AAMS
String formatRwf(int amount) {
  bool isNegative = amount < 0;
  String digits = amount.abs().toString();
  String result = '';

  int i = 0;

  while (i < digits.length) {
    if (i > 0 && (digits.length - i) % 3 == 0) {
      result += ',';
    }

    result += digits[i];
    i++;
  }

  if (isNegative) {
    result = '-$result';
  }

  return '$result RWF';
}

// Check whether a PIN is valid
// by AAMS
bool isValidPin(String pin) {
  if (pin.length != 5) {
    return false;
  }

  int i = 0;

  while (i < pin.length) {
    if (pin[i].codeUnitAt(0) < 48 ||
        pin[i].codeUnitAt(0) > 57) {
      return false;
    }

    i++;
  }

  if (pin == '12345') {
    return false;
  }

  if (pin[0] == pin[1] &&
      pin[1] == pin[2] &&
      pin[2] == pin[3] &&
      pin[3] == pin[4]) {
    return false;
  }

  return true;
}

// Send money to another number
// by AAMS
int sendMoney(int balance, int amount) {
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

  print(
    'Sent ${formatRwf(amount)} '
    '(fee ${formatRwf(fee)}). '
    'New balance: ${formatRwf(newBalance)}',
  );

  return newBalance;
}

// Buy airtime
// by AAMS
int buyAirtime(int balance, int amount) {
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid airtime amount');
    return balance;
  }

  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount;

  print(
    'Airtime purchased: ${formatRwf(amount)}. '
    'New balance: ${formatRwf(newBalance)}',
  );

  return newBalance;
}

// Main function
// by AAMS
void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  // Test PIN validation
  print(isValidPin('12345'));
  print(isValidPin('77777'));
  print(isValidPin('4821'));
  print(isValidPin('48a21'));
  print(isValidPin('4821$d'));

  // Starting balance
  int balance = 20000 + t * 500;

  print('Starting balance: ${formatRwf(balance)}');

  // Send money three times
  int i = 0;

  while (i < 3) {
    balance = sendMoney(balance, (d + 1) * 3000);
    i++;
  }

  // Buy airtime
  balance = buyAirtime(balance, 1000);

  // Test invalid transaction
  balance = sendMoney(balance, 0);

  // Test insufficient balance
  balance = sendMoney(balance, 200000);

  // Final balance
  print('Final balance: ${formatRwf(balance)}');

  // Additional formatRwf tests
  print(formatRwf(0)); // Expected: 0 RWF
  print(formatRwf(999)); // Expected: 999 RWF
  print(formatRwf(1000)); // Expected: 1,000 RWF
  print(formatRwf(1250000)); // Expected: 1,250,000 RWF
  print(formatRwf(-5000)); // Expected: -5,000 RWF

  // Additional PIN tests
  print(isValidPin('12346')); // Expected: true
  print(isValidPin('11111')); // Expected: false
  print(isValidPin('1234')); // Expected: false
  print(isValidPin('12a45')); // Expected: false
  print(isValidPin('98765')); // Expected: true
}
