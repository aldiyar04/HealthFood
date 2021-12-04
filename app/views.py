from django.shortcuts import render

from .models import Product


def index(request):
    trending_products = Product.objects.all()[4:]
    return render(request, 'index.html', {'trending_product_groups': get_product_groups(trending_products)})

def faq(request):
    return render(request, 'faq.html')


def about(request):
    return render(request, 'about.html')


def contact(request):
    return render(request, 'contact.html')


def signin(request):
    return render(request, 'signin.html')


def register(request):
    return render(request, 'register.html')

def shop(request):
    products = Product.objects.all()
    return render(request, 'shop.html', {'product_groups': get_product_groups(products)})

def get_product_groups(products):
    product_groups = []
    i = 0
    for product in products:
        if i % 4 == 0:
            product_groups.append(list())
        product_groups[i // 4].append(product)
        i += 1
    return product_groups

# trending_product_groups = [
    #     [
    #         Product(id=1, name='Healthy Milk', price=5, img='products/product1.png'),
    #         Product(id=2, name='Green Beans', price=13, img='products/product2.png'),
    #         Product(id=3, name='Energy Food', price=11, img='products/product3.png'),
    #         Product(id=4, name='Refill Pack', price=6, img='products/product4.png'),
    #     ],

    #     [
    #         Product(id=5, name='Creamy Oak Spread', price=5, img='products/product5.jpeg'),
    #         Product(id=6, name='Vegan Cheese', price=7, img='products/product6.jpeg'),
    #         Product(id=7, name='Original Flavour', price=6, img='products/product7.jpeg'),
    #         Product(id=8, name='Coconut Oil', price=4, img='products/product8.jpeg'),
    #     ],

    #     [
    #         Product(id=9, name='Cocospread', price=5, img='products/product9.jpeg'),
    #         Product(id=10, name='Mozzarella Alternative', price=7, img='products/product10.jpeg'),
    #         Product(id=11, name='Cheddar Flavour', price=6, img='products/product11.jpeg'),
    #         Product(id=12, name='Light Spread', price=4, img='products/product12.jpeg'),
    #     ],
    # ]

# product_groups = [
#         [        
#         Product(id=13, name='Flora Battery Spread', price=5, img='products/product13.jpeg'),
#         Product(id=14, name='Alpro Almond Drink', price=6, img='products/product14.jpeg'),
#         Product(id=15, name='Hellman\'s Vegan Mayo', price=6, img='products/product15.jpeg'),
#         Product(id=16, name='Smooth Vanilla Glace', price=4, img='products/product16.jpeg'),
#         ],

#         [
#         Product(id=17, name='Tesco Dairy Drink', price=8, img='products/product17.jpeg'),
#         Product(id=18, name='Tesco Soya Drink', price=7, img='products/product18.jpeg'),
#         Product(id=19, name='Stork Pastry', price=3, img='products/product19.jpeg'),
#         Product(id=20, name='Tesco Unsweetened Soya', price=12, img='products/product20.jpeg'),
#         ],

#         [
#         Product(id=21, name='Koko Long Life Coconut', price=4, img='products/product21.jpeg'),
#         Product(id=22, name='Alpro Chocolate Soya', price=7, img='products/product22.jpeg'),
#         Product(id=23, name='Cathedral City Spread', price=5, img='products/product23.jpeg'),
#         Product(id=24, name='Oatly Chocolate Fudge', price=7, img='products/product24.jpeg'),
#         ],

#         [
#         Product(id=25, name='Chocolate Little Pots', price=7, img='products/product25.jpeg'),
#         Product(id=26, name='Heavenly Whipped Drink', price=6, img='products/product26.jpeg'),
#         Product(id=27, name='Tesco Coconut Oil', price=4, img='products/product27.jpeg'),
#         Product(id=28, name='Pure Battery Spread', price=4, img='products/product28.jpeg'),
#         ],

#         [
#         Product(id=29, name='Arla Soft Cheese', price=5, img='products/product29.jpeg'),
#         Product(id=30, name='Alpro Vanilla Spread', price=7, img='products/product30.jpeg'),
#         Product(id=31, name='Tesco Almond Milk', price=10, img='products/product31.jpeg'),
#         Product(id=32, name='Tesco Coconut Oil', price=11, img='products/product32.jpeg'),
#         ],

#         [
#         Product(id=33, name='Hazelnat Chocolate Cookie', price=15, img='products/product33.jpeg'),
#         Product(id=34, name='Chocolate Fudge Ice Cream', price=5, img='products/product34.jpeg'),
#         Product(id=35, name='Alpro Protein Drink', price=7, img='products/product35.jpeg'),
#         Product(id=36, name='Koko Mellow Drink', price=11, img='products/product36.jpeg'),
#         ],

#         [
#         Product(id=37, name='Mocha Almond Drink', price=7, img='products/product37.jpeg'),
#         Product(id=38, name='Oatly Strawberry Drink', price=8, img='products/product38.jpeg'),
#         Product(id=39, name='Violife Refill Pack', price=3, img='products/product39.jpeg'),
#         Product(id=40, name='Roar Ice Cream', price=9, img='products/product40.jpeg'),
#         ],

#         [
#         Product(id=41, name='Oatly Salted Caramel', price=10, img='products/product41.jpeg'),
#         Product(id=42, name='Califia Almond Coffee', price=6, img='products/product42.jpeg'),
#         Product(id=43, name='Alpro Protein Chocolate', price=4, img='products/product43.jpeg'),
#         Product(id=44, name='Califia Almond Drink', price=8, img='products/product44.jpeg'),
#         ],
#     ]
