import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ================= MODEL IPHONE =================

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

  // Getter harga integer
  int get priceValue {
    return int.parse(
      price
          .replaceAll('Rp ', '')
          .replaceAll('.', '')
          .replaceAll(',', ''),
    );
  }
}

// ================= OOP CART MANAGER =================

class CartManager {
  List<Iphone> items = [];

  void addItem(Iphone item) {
    items.add(item);
  }

  void removeItem(int index) {
    items.removeAt(index);
  }

  int get totalPrice {
    return items.fold(
      0,
          (total, item) => total + item.priceValue,
    );
  }

  double get averagePrice {
    if (items.isEmpty) return 0;

    return totalPrice / items.length;
  }

  Iphone? get highestPriceItem {
    if (items.isEmpty) return null;

    Iphone highest = items[0];

    for (var item in items) {
      if (item.priceValue > highest.priceValue) {
        highest = item;
      }
    }

    return highest;
  }

  Iphone? get lowestPriceItem {
    if (items.isEmpty) return null;

    Iphone lowest = items[0];

    for (var item in items) {
      if (item.priceValue < lowest.priceValue) {
        lowest = item;
      }
    }

    return lowest;
  }
}

// ================= DATA HP =================

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

CartManager cart = CartManager();

List<String> paymentHistory = [];

// ================= APP =================

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coys Phone Store',

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: LoginPage(),
    );
  }
}

// ================= LOGIN =================

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
                  'Coys Phone Store',
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

// ================= HOME =================

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
        title: Text('Coys Phone Store'),

        actions: [

          // ================= CART =================

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

          // ================= HISTORY =================

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

// ================= DETAIL =================

class DetailPage extends StatelessWidget {

  final Iphone iphone;

  DetailPage({
    required this.iphone,
  });

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

                    cart.addItem(iphone);

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

// ================= CART =================

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

      body: cart.items.isEmpty
          ? Center(
        child: Text(
          'Keranjang kosong',
        ),
      )

          : Column(
        children: [

          // ================= STATISTIK =================

          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(15),

            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius:
              BorderRadius.circular(15),
            ),

            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(
                  'Statistik Belanja',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  'Total Belanja: Rp ${cart.totalPrice}',
                ),

                Text(
                  'Rata-rata Harga: Rp ${cart.averagePrice.toStringAsFixed(0)}',
                ),

                Text(
                  'Barang Termahal: ${cart.highestPriceItem?.name ?? '-'}',
                ),

                Text(
                  'Barang Termurah: ${cart.lowestPriceItem?.name ?? '-'}',
                ),
              ],
            ),
          ),

          // ================= LIST CART =================

          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,

              itemBuilder:
                  (context, index) {

                final item =
                cart.items[index];

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
                          cart.removeItem(index);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),

          // ================= CHECKOUT =================

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

// ================= CHECKOUT =================

class CheckoutPage extends StatefulWidget {
  @override
  State<CheckoutPage> createState() =>
      _CheckoutPageState();
}

class _CheckoutPageState
    extends State<CheckoutPage> {

  String selectedPayment = 'QRIS';

  final TextEditingController namaController =
  TextEditingController();

  final TextEditingController hpController =
  TextEditingController();

  final TextEditingController alamatController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              // ================= ALAMAT =================

              Text(
                'Alamat Pengiriman',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 15),

              TextField(
                controller: namaController,

                decoration: InputDecoration(
                  labelText: 'Nama Penerima',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),

              SizedBox(height: 15),

              TextField(
                controller: hpController,
                keyboardType: TextInputType.phone,

                decoration: InputDecoration(
                  labelText: 'Nomor HP',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),

              SizedBox(height: 15),

              TextField(
                controller: alamatController,
                maxLines: 3,

                decoration: InputDecoration(
                  labelText: 'Alamat Lengkap',
                  border: OutlineInputBorder(),
                  prefixIcon:
                  Icon(Icons.location_on),
                ),
              ),

              SizedBox(height: 25),

              // ================= PEMBAYARAN =================

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

              // ================= LIST ITEM =================

              ListView.builder(
                itemCount: cart.items.length,
                shrinkWrap: true,
                physics:
                NeverScrollableScrollPhysics(),

                itemBuilder:
                    (context, index) {

                  final item =
                  cart.items[index];

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

              SizedBox(height: 20),

              Text(
                'Total Bayar: Rp ${cart.totalPrice}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),

              SizedBox(height: 20),

              // ================= BAYAR =================

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: () {

                    if (namaController.text.isEmpty ||
                        hpController.text.isEmpty ||
                        alamatController.text.isEmpty) {

                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        SnackBar(
                          content: Text(
                            'Lengkapi alamat pengiriman terlebih dahulu',
                          ),
                        ),
                      );

                      return;
                    }

                    paymentHistory.add(
                      'Pembayaran $selectedPayment berhasil - Total Rp ${cart.totalPrice}',
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => PaymentPage(
                          paymentMethod:
                          selectedPayment,

                          nama:
                          namaController.text,

                          hp:
                          hpController.text,

                          alamat:
                          alamatController.text,
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
      ),
    );
  }
}

// ================= PAYMENT =================

class PaymentPage extends StatelessWidget {

  final String paymentMethod;
  final String nama;
  final String hp;
  final String alamat;

  PaymentPage({
    required this.paymentMethod,
    required this.nama,
    required this.hp,
    required this.alamat,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Pembayaran'),
      ),

      body: Center(
        child: SingleChildScrollView(
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

              Padding(
                padding: EdgeInsets.all(20),

                child: Column(
                  children: [

                    Text(
                      'Penerima: $nama',
                    ),

                    SizedBox(height: 10),

                    Text(
                      'No HP: $hp',
                    ),

                    SizedBox(height: 10),

                    Text(
                      'Alamat: $alamat',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15),

              Text(
                'Total: Rp ${cart.totalPrice}',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
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

                  cart.items.clear();

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
      ),
    );
  }
}

// ================= HISTORY =================

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
