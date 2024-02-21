import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_one/pages/basket.dart';
import 'package:test_one/pages/product_details.dart';

class ViewWatchesState extends StatefulWidget {
  const ViewWatchesState({super.key});

  @override
  State<ViewWatchesState> createState() => _ViewWatchesStateState();
}

class _ViewWatchesStateState extends State<ViewWatchesState> {
  List<String> cartItems = [];

  void addToCart(String product) {
    setState(() {
      cartItems.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.withOpacity(0.6),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('A list product'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cartItems),
                ),
              );
            },
          ),
        ],
      ),
      body: ProductList(cartItems, addToCart),
      
    );
  }
}

class ProductList extends StatelessWidget {
  final List<String> cartItems;
  final Function addToCart;

  ProductList(this.cartItems, this.addToCart, {super.key});

  final List<String> products = [
    'Цифровой фитнес-трекер',
    'Беспроводные наушники с шумоподавлением',
    'Умный домашний ассистент',
    'Портативная зарядка для смартфона',
    'Электрическая зубная щетка',
    'Ароматические свечи натурального воска',
    'Складной карманный нож',
    'Чайный набор для ценителей чая',
    'Ультразвуковой увлажнитель воздуха',
    'Складной стул для пикника',
    'Керамический набор посуды',
    'Электрический чайник с термостатом',
    'Профессиональный массажный стол',
    'Стильный рюкзак для ноутбука',
    'Умные лампочки с поддержкой Wi-Fi',
  ];

  final List<String> productImages = [
    'assets/svg/smart-watch-heart-svgrepo-com.svg',
    'assets/svg/airbuds-charge-svgrepo-com.svg',
    'assets/svg/smart-home-svgrepo-com.svg',
    'assets/svg/charging-treasure-svgrepo-com.svg',
    'assets/svg/electric-toothbrush-svgrepo-com.svg',
    'assets/svg/candles-candle-svgrepo-com.svg',
    'assets/svg/knife-svgrepo-com.svg',
    'assets/svg/tea-svgrepo-com.svg',
    'assets/svg/condicioner-svgrepo-com.svg',
    'assets/svg/folding-chair-svgrepo-com.svg',
    'assets/svg/dishes-svgrepo-com.svg',
    'assets/svg/kettle-svgrepo-com.svg',
    'assets/svg/massage-table-svgrepo-com.svg',
    'assets/svg/backpack-svgrepo-com.svg',
    'assets/svg/smart-gadget-smartlamp-svgrepo-com.svg',
  ];

  final List<String> descriptionProduct = [
    'Отслеживайте свою активность и здоровье с этим современным фитнес-трекером',
    'Наслаждайтесь качественным звуком без помех с этими стильными беспроводными наушниками',
    'Получите помощь в управлении домашними задачами с этим умным ассистентом',
    'Будьте всегда на связи с этой компактной портативной зарядкой для вашего смартфона',
    'Обеспечьте своим зубам идеальный уход с этой электрической зубной щеткой',
    'Создайте уютную атмосферу в вашем доме с ароматическими свечами из натурального воска',
    'Будьте готовы к любым приключениям с этим удобным складным карманным ножом',
    'Погрузитесь в мир разнообразных чаев с этим изысканным чайным набором',
    'Обеспечьте комфортный воздух в вашем доме с помощью ультразвукового увлажнителя',
    'Насладитесь отдыхом на свежем воздухе с этим компактным складным стулом для пикника',
    'Приготовьте вкусные блюда с этим красивым керамическим набором посуды',
    'Быстро нагревайте воду до нужной температуры с этим электрическим чайником',
    'Расслабьтесь и освежите свое тело с помощью этого профессионального массажного стола',
    'Переносите свой ноутбук и другие вещи с комфортом и стилем в этом модном рюкзаке',
    'Создайте атмосферу освещения по вашему настроению с помощью этих умных лампочек, поддерживающих Wi-FI',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(products[index]),
            subtitle: Text(descriptionProduct[index]),
            leading: SvgPicture.asset(
              productImages[index],
              width: 50,
              height: 50,
            ),
            trailing: IconButton(
              icon: Icon(cartItems.contains(products[index])
                  ? Icons.shopping_cart
                  : Icons.favorite_border),
              onPressed: () {
                if (!cartItems.contains(products[index])) {
                  addToCart(products[index]);
                }
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetails(
                    productName: products[index],
                    productDescription: descriptionProduct[index],
                    productImage: productImages[index],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}