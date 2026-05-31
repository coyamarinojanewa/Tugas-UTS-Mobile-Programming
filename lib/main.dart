import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Iphone {
  final String name;
  final String image;
  final String price;
  final String description;

  Iphone({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });
}

List<Iphone> iphones = [
  Iphone(
    name: 'iPhone 15 Pro Max',
    image:
    'https://images.unsplash.com/photo-1695048133142-1a20484d2569?q=80&w=1000&auto=format&fit=crop',
    price: 'Rp 24.999.000',
    description: 'Chip A17 Pro dengan kamera terbaik Apple.',
  ),

  Iphone(
    name: 'iPhone 14 Pro',
    image:
    'https://cdsassets.apple.com/live/SZLF0YNV/images/sp/111846_sp875-sp876-iphone14-pro-promax.png',
    price: 'Rp 19.999.000',
    description: 'Dynamic Island dan performa super cepat.',
  ),

  Iphone(
    name: 'iPhone 13',
    image:
    'https://cdsassets.apple.com/live/SZLF0YNV/images/sp/111872_iphone13-colors-480.png',
    price: 'Rp 12.999.000',
    description: 'iPhone elegan dengan performa stabil.',
  ),
];

List<Iphone> cart = [];
List<String> paymentHistory = [];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iPhone Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController username =
  TextEditingController();

  final TextEditingController password =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),

        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.center,

              children: [
                Icon(
                  Icons.phone_iphone,
                  size: 100,
                  color: Colors.blue,
                ),

                SizedBox(height: 20),

                Text(
                  'iPhone Store',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 30),

                TextField(
                  controller: username,

                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 15),

                TextField(
                  controller: password,
                  obscureText: true,

                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,

                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => HomePage(),
                        ),
                      );
                    },

                    child: Text('Login'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() =>
      _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('iPhone Store'),

        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CartPage(),
                ),
              ).then((_) => setState(() {}));
            },
          ),

          IconButton(
            icon: Icon(Icons.history),

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HistoryPage(),
                ),
              );
            },
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: iphones.length,

        itemBuilder: (context, index) {
          final iphone = iphones[index];

          return Card(
            margin: EdgeInsets.all(10),
            elevation: 5,

            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(15),
            ),

            child: ListTile(
              contentPadding: EdgeInsets.all(10),

              leading: ClipRRect(
                borderRadius:
                BorderRadius.circular(10),

                child: Image.network(
                  iphone.image,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,

                  errorBuilder:
                      (
                      context,
                      error,
                      stackTrace,
                      ) {
                    return Icon(
                      Icons.image_not_supported,
                      size: 50,
                    );
                  },
                ),
              ),

              title: Text(
                iphone.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Text(
                iphone.price,
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),

              trailing: Icon(
                Icons.arrow_forward_ios,
              ),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => DetailPage(
                      iphone: iphone,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Iphone iphone;

  DetailPage({required this.iphone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(iphone.name),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [
              Center(
                child: ClipRRect(
                  borderRadius:
                  BorderRadius.circular(20),

                  child: Image.network(
                    iphone.image,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(height: 20),

              Text(
                iphone.name,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              Text(
                iphone.price,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20),

              Text(
                iphone.description,
                style: TextStyle(fontSize: 16),
              ),

              SizedBox(height: 30),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: () {
                    cart.add(iphone);

                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Produk ditambahkan ke keranjang',
                        ),
                      ),
                    );
                  },

                  child: Text(
                    'Tambah ke Keranjang',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() =>
      _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang'),
      ),

      body: cart.isEmpty
          ? Center(
        child: Text(
          'Keranjang kosong',
        ),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,

              itemBuilder:
                  (context, index) {
                final item = cart[index];

                return Card(
                  child: ListTile(
                    leading: Image.network(
                      item.image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),

                    title: Text(item.name),

                    subtitle:
                    Text(item.price),

                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                      ),

                      onPressed: () {
                        setState(() {
                          cart.removeAt(
                            index,
                          );
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.all(20),

            child: SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) =>
                          CheckoutPage(),
                    ),
                  ).then(
                        (_) => setState(() {}),
                  );
                },

                child: Text('Checkout'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CheckoutPage extends StatefulWidget {
  @override
  State<CheckoutPage> createState() =>
      _CheckoutPageState();
}

class _CheckoutPageState
    extends State<CheckoutPage> {
  String selectedPayment = 'QRIS';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [
            Text(
              'Pilih Metode Pembayaran',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 15),

            Card(
              child: RadioListTile(
                value: 'QRIS',
                groupValue: selectedPayment,
                title: Text('QRIS'),
                secondary: Icon(Icons.qr_code),

                onChanged: (value) {
                  setState(() {
                    selectedPayment =
                        value.toString();
                  });
                },
              ),
            ),

            Card(
              child: RadioListTile(
                value: 'E-Wallet',
                groupValue: selectedPayment,
                title: Text('E-Wallet'),
                secondary: Icon(Icons.wallet),

                onChanged: (value) {
                  setState(() {
                    selectedPayment =
                        value.toString();
                  });
                },
              ),
            ),

            Card(
              child: RadioListTile(
                value: 'COD',
                groupValue: selectedPayment,
                title: Text('COD'),
                secondary: Icon(Icons.money),

                onChanged: (value) {
                  setState(() {
                    selectedPayment =
                        value.toString();
                  });
                },
              ),
            ),

            SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: cart.length,

                itemBuilder:
                    (context, index) {
                  final item = cart[index];

                  return Card(
                    child: ListTile(
                      leading: Image.network(
                        item.image,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),

                      title: Text(item.name),

                      subtitle:
                      Text(item.price),
                    ),
                  );
                },
              ),
            ),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {
                  paymentHistory.add(
                    'Pembayaran $selectedPayment berhasil pada ${DateTime.now()}',
                  );

                  cart.clear();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) => PaymentPage(
                        paymentMethod:
                        selectedPayment,
                      ),
                    ),
                  );
                },

                child: Text(
                  'Bayar Sekarang',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PaymentPage extends StatelessWidget {
  final String paymentMethod;

  PaymentPage({
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pembayaran'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,

          children: [
            Icon(
              Icons.check_circle,
              size: 120,
              color: Colors.green,
            ),

            SizedBox(height: 20),

            Text(
              'Pembayaran Berhasil',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 15),

            Text(
              'Metode: $paymentMethod',
              style: TextStyle(
                fontSize: 20,
              ),
            ),

            SizedBox(height: 20),

            if (paymentMethod == 'QRIS')
              Column(
                children: [
                  Icon(
                    Icons.qr_code,
                    size: 120,
                  ),

                  SizedBox(height: 10),

                  Text(
                    'Silakan scan QRIS',
                  ),
                ],
              ),

            if (paymentMethod == 'E-Wallet')
              Column(
                children: [
                  Icon(
                    Icons.wallet,
                    size: 120,
                  ),

                  SizedBox(height: 10),

                  Text(
                    'Pembayaran via E-Wallet',
                  ),
                ],
              ),

            if (paymentMethod == 'COD')
              Column(
                children: [
                  Icon(
                    Icons.money,
                    size: 120,
                  ),

                  SizedBox(height: 10),

                  Text(
                    'Bayar di tempat (COD)',
                  ),
                ],
              ),

            SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HomePage(),
                  ),
                      (route) => false,
                );
              },

              child: Text(
                'Kembali ke Home',
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Histori Pembayaran',
        ),
      ),

      body: paymentHistory.isEmpty
          ? Center(
        child: Text(
          'Belum ada histori pembayaran',
        ),
      )
          : ListView.builder(
        itemCount:
        paymentHistory.length,

        itemBuilder:
            (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(
                Icons.receipt_long,
              ),

              title: Text(
                paymentHistory[index],
              ),
            ),
          );
        },
      ),
    );
  }
}