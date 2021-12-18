import json
from django.core import serializers

from django.shortcuts import render, redirect
from django.contrib.auth.models import auth
from django.contrib import messages
from django.http import JsonResponse

from .models import Product, Customer, Order, OrderProduct


def index(request):
    products = Product.objects.all()
    trending_products = products[4:16]
    context = {
        'products': serializers.serialize('json', products),
        'trending_product_groups': get_product_groups(trending_products),
    }
    return render(request, 'index.html', context)

def faq(request):
    return render(request, 'faq.html')


def about(request):
    return render(request, 'about.html')


def contact(request):
    return render(request, 'contact.html')


def signin(request):
    if request.method == 'POST':
        email = request.POST['email']
        password = request.POST['password']

        customer = auth.authenticate(email=email, password=password)

        if customer:
            auth.login(request, customer)
            return redirect('/shop')
        else:
            messages.error(request, 'Invalid email or password.')

    return render(request, 'signin.html')


def signout(request):
    auth.logout(request)
    return redirect('/')


def register(request):
    if request.method == 'POST':
        first_name = request.POST['firstname']
        last_name = request.POST['lastname']
        email = request.POST['email']
        phone = request.POST['phone']
        address = request.POST['address']
        password = request.POST['password']
        password2 = request.POST['password2']

        valid = True

        if Customer.objects.filter(email=email):
            messages.add_message(request, messages.ERROR, 'Email ' + email + ' is already taken.')
            valid = False
        if Customer.objects.filter(phone=phone):
            messages.add_message(request, messages.ERROR, 'Phone ' + phone + ' is already taken.')
            valid = False
        if password != password2:
            messages.add_message(request, messages.ERROR, 'Provided passwords do not match.')
            valid = False

        if valid:
            customer = Customer.objects.create_user(first_name=first_name, last_name=last_name, 
                                                email=email, phone=phone, address=address, password=password)
            customer.save()
            messages.success(request, 'You registered successfully!')

    return render(request, 'register.html')


def account(request):
    return render(request, 'account.html')


def edit_account(request):
    if request.method == 'POST':
        first_name = request.POST['firstname']
        last_name = request.POST['lastname']
        email = request.POST['email']
        phone = request.POST['phone']
        address = request.POST['address']

        old_email = request.POST['old_email']
        old_phone = request.POST['old_phone']

        valid = True

        if Customer.objects.filter(email=email) and email != old_email:
            messages.add_message(request, messages.ERROR, 'Email ' + email + ' is already taken.')
            valid = False
        if Customer.objects.filter(phone=phone) and phone != old_phone:
            messages.add_message(request, messages.ERROR, 'Phone ' + phone + ' is already taken.')
            valid = False

        if valid:
            customer = Customer.objects.get(email=old_email)

            # Update customer
            customer.first_name = first_name
            customer.last_name = last_name
            customer.email = email
            customer.phone = phone
            customer.address = address

            customer.save()
            messages.success(request, 'Edited successfully')

    return render(request, 'account.html')


def delete_account(request):
    if request.method == 'POST':
        email = request.POST['email']
        customer = Customer.objects.get(email=email)
        customer.delete()
        messages.info(request, 'Your account has been deleted.')
    
    return render(request, 'signin.html')

def cart(request):
    context = {
        'cart_items': []
    }

    items_total = 0
    price_total = 0
    if 'cart' in request.session:
        for product_id, quantity in request.session['cart'].items():
            product = Product.objects.get(id=product_id)
            item_price_total = product.price * quantity
            context['cart_items'].append({'product': product, 'quantity': quantity, 'price_total': item_price_total})
            items_total += quantity
            price_total += item_price_total

    context['total'] = {
        'items': items_total,
        'price': price_total,
    }

    return render(request, 'cart.html', context)


def cart_item_count(request):
    cart_item_count = 0 if 'cart' not in request.session else len(request.session['cart'])
    return JsonResponse({'cart_item_count': cart_item_count})


def update_cart(request):
    data = json.loads(request.body)
    product_id = data['product_id']
    action = data['action']

    if 'cart' not in request.session:
        request.session['cart'] = {}

    print('Cart Before:', request.session['cart'])

    if action == 'add' and product_id not in request.session['cart']:
        request.session['cart'][product_id] = 1     # 1 is product quantity
        request.session.modified = True
        print('Added to cart')
    elif action == 'delete' and product_id in request.session['cart']:
        del request.session['cart'][product_id]
        request.session.modified = True
        print('Deleted from cart')

    print('Cart After:', request.session['cart'])

    return JsonResponse({'message': 'Updated cart. Action: ' + action + ', product ID: ' + product_id,})


def place_order(request):
    if 'cart' not in request.session:
        messages.error(request, 'The shopping cart is empty.')
    else:
        customer = request.user
        order = Order.objects.create(customer = customer)
        for product_id, quantity in request.session['cart'].items():
            product = Product.objects.get(id=product_id)
            OrderProduct.objects.create(order=order, product=product, quantity=quantity)

    return render(request, 'cart.html')
        

def shop(request):
    products = Product.objects.all()
    return render(request, 'shop.html', {'product_groups': get_product_groups(products)})


def product(request, slug=None):
    product = None

    if slug is not None:
        product = Product.objects.get(slug=slug)
        if product:
            # product_description_paras = product.description.split(r'\s{2,}')
            # product_description_paras = [paragraph.strip() for paragraph in product_description_paras]
            product_description_paras = product.description.split('\r\n')
            product_description_paras = [paragraph.strip() for paragraph in product_description_paras if paragraph]
            product_short_description = product_description_paras[0]
            for paragraph in product_description_paras:
                if len(paragraph) > 50:
                    product_short_description = paragraph
                    break

            context = {
                'product': product, 
                'product_description_paras': product_description_paras,
                'product_short_description': product_short_description,
            }

        return render(request, 'product.html', context)

    return render(request, 'index.html')
    


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
