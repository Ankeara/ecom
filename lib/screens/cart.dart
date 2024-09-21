import 'package:ecom/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CartPage(),
    );
  }
}

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<Map<String, dynamic>> _cartItems = [
    {
      'image': 'images/12.png',
      'title': 'Monitorr ASUS',
      'size': 'S',
      'color': Colors.lightGreenAccent,
      'price': 69.00,
      'quantity': 1,
    },
    {
      'image': 'images/13.png',
      'title': 'Notebook History',
      'size': 'S',
      'color': Colors.orange,
      'price': 77.00,
      'quantity': 1,
    },
    {
      'image': 'images/14.png',
      'title': 'XBOX Gaming',
      'size': 'S',
      'color': Colors.blue,
      'price': 69.00,
      'quantity': 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    double totalPrice = _cartItems.fold(
        0, (sum, item) => sum + (item['price'] * item['quantity']));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(), // Pass the destination page
              ),
            );
          },
        ),
        title: Text(
          'Your Cart',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final item = _cartItems[index];
                return CartItemCard(
                  image: item['image'],
                  title: item['title'],
                  size: item['size'],
                  color: item['color'],
                  price: item['price'],
                  quantity: item['quantity'],
                  onRemove: () {
                    setState(() {
                      _cartItems.removeAt(index);
                    });
                  },
                  onQuantityChange: (newQuantity) {
                    setState(() {
                      _cartItems[index]['quantity'] = newQuantity;
                    });
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Price',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF001F3F)),
                    ),
                    Text(
                      '\$ ${totalPrice.toStringAsFixed(2)}',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF001F3F),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text(
                    'Payment',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  final String image;
  final String title;
  final String size;
  final Color color;
  final double price;
  final int quantity;
  final Function() onRemove;
  final Function(int) onQuantityChange;

  const CartItemCard({
    required this.image,
    required this.title,
    required this.size,
    required this.color,
    required this.price,
    required this.quantity,
    required this.onRemove,
    required this.onQuantityChange,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  image,
                  height: 80,
                  width: 80,
                  fit: BoxFit.fill,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text('Size: $size'),
                          SizedBox(width: 10),
                          Text('Color: '),
                          CircleAvatar(
                            backgroundColor: color,
                            radius: 10,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              if (quantity > 1) {
                                onQuantityChange(quantity - 1);
                              }
                            },
                            icon: Icon(Icons.remove),
                          ),
                          Text(quantity.toString(),
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold)),
                          IconButton(
                            onPressed: () {
                              onQuantityChange(quantity + 1);
                            },
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$${price.toStringAsFixed(2)}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: onRemove,
                      icon: Icon(Icons.close, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
