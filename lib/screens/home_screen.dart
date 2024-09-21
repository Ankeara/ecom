import 'package:ecom/screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0; // Define _selectedIndex to track the active tab

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.black,
            tabs: [
              Tab(text: 'New Arrivals'),
              Tab(text: 'Trending'),
              Tab(text: 'Brands'),
              Tab(text: 'Top Picks'),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildProductGrid(),
          Center(child: Text('Trending')),
          Center(child: Text('Brands')),
          Center(child: Text('Top Picks')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Use _selectedIndex to track active tab
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // Update _selectedIndex when a tab is selected
          });

          if (index == 2) { // Shopping cart icon is at index 2
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartPage(),
              ),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                color: _selectedIndex == 0 ? Colors.grey.shade200 : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Icon(Icons.home, color: Colors.black),
                  SizedBox(width: 8),
                  if (_selectedIndex == 0)
                    Text('Home', style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('images/man.jpeg'), // Add your image path
            ),
            label: '', // No label
          ),
        ],
        showSelectedLabels: false, // Hides the default labels
        showUnselectedLabels: false,
      ),
    );
  }

  Widget buildProductGrid() {
    final products = [
      {
        'title': 'Table Charter',
        'brand': 'Nicole Miller',
        'price': 110.00,
        'image': 'images/8.png'
      },
      {
        'title': 'Tablet Designer',
        'brand': 'WAYF',
        'price': 69.00,
        'image': 'images/9.png'
      },
      {
        'title': 'Hoodie Blue',
        'brand': 'Nicole Miller',
        'price': 110.00,
        'image': 'images/10.png'
      },
      {
        'title': 'ASUS TUF',
        'brand': 'Tiffany Rose',
        'price': 69.00,
        'image': 'images/11.png'
      },
      {
        'title': 'Monitorr ASUS',
        'brand': 'WAYF',
        'price': 69.00,
        'image': 'images/12.png'
      },
      {
        'title': 'Notebook History',
        'brand': 'Nicole Miller',
        'price': 110.00,
        'image': 'images/13.png'
      },
      {
        'title': 'XBOX Gaming',
        'brand': 'Tiffany Rose',
        'price': 69.00,
        'image': 'images/14.png'
      },
    ];

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          image: product['image'] as String,
          title: product['title'] as String,
          brand: product['brand'] as String,
          price: product['price'] as double,
        );
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String brand;
  final double price;

  const ProductCard({
    required this.image,
    required this.title,
    required this.brand,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  brand,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$$price',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    IconButton(
                      icon: Icon(Iconsax.heart, color: Colors.black),
                      onPressed: () {

                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
