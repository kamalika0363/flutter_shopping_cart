import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/components/grocery_item_tile.dart';
import 'package:shopping_cart/model/cart_model.dart';
import 'package:shopping_cart/pages/cart_page.dart';
// import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const CartPage();
        })),
        backgroundColor: Colors.black,
        child: const Icon(Icons.shopping_bag,
            color: Color.fromRGBO(199, 199, 199, 1)),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 48,
            ),

            // good morning
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Good Morning,",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),

            const SizedBox(
              height: 4,
            ),

            // Lets order fresh items

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Let's order some fresh items for you!",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // divider
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(
                thickness: 1,
                color: Color.fromRGBO(189, 189, 189, 1),
              ),
            ),

            const SizedBox(
              height: 24,
            ),

            // fresh items + grid

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Fresh Items",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Expanded(
              child: Consumer<CartModel>(
                builder: (context, value, child) {
                  return GridView.builder(
                    itemCount: value.shopItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.3,
                    ),
                    itemBuilder: (context, index) {
                      return GroceryItemTile(
                        itemName: value.shopItems[index][0],
                        itemPrice: value.shopItems[index][1],
                        itemPath: value.shopItems[index][2],
                        color: value.shopItems[index][3],
                        onPressed: () {
                          Provider.of<CartModel>(context, listen: false)
                              .addItemToCart(index);
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
