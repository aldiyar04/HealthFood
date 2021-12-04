from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
from django.utils.text import slugify 



class CustomerManager(BaseUserManager):
    def create_user(self, first_name, last_name, email, phone, address, password):
        error_msgs = []
        if not first_name:
            error_msgs.append('First name is required.')
        if not last_name:
            error_msgs.append('Last name is required.')
        if not email:
            error_msgs.append('Email is required.')
        if not phone:
            error_msgs.append('Phone is required.')
        if not address:
            error_msgs.append('Address is required.')
        if not password:
            error_msgs.append('Password is required.')

        if error_msgs:
            raise ValueError(' '.join(error_msgs))

        customer = self.model(
            first_name = first_name,
            last_name = last_name,
            email=self.normalize_email(email),
            phone=phone,
            address=address,
            password=password
        )

        customer.set_password(password)
        customer.save(using=self._db)
        return customer

    def create_superuser(self, first_name, last_name, email, phone, address, password):
        customer = self.create_user(
            first_name = first_name,
            last_name = last_name,
            email=self.normalize_email(email),
            phone=phone,
            address=address,
            password=password
        )
        customer.is_admin = True
        customer.is_staff = True
        customer.is_superuser = True

        customer.save(using=self._db)
        return customer


class Customer(AbstractBaseUser):
    first_name = models.CharField(max_length=32)
    last_name = models.CharField(max_length=32)
    email = models.CharField(max_length=64, unique=True)
    phone = models.CharField(max_length=16, unique=True)
    address = models.CharField(max_length = 255)
    password = models.CharField(max_length = 128)

    date_joined	= models.DateTimeField(verbose_name='date joined', auto_now_add=True)
    last_login = models.DateTimeField(verbose_name='last login', auto_now=True)
    is_admin = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['first_name', 'last_name', 'phone', 'address', 'password']

    objects = CustomerManager()


    def has_perm(self, perm, obj=None):
        return self.is_admin

    def has_module_perms(self, app_label):
        return True


class Product(models.Model):
    name = models.CharField(max_length=255, unique=True)
    image = models.ImageField(upload_to='products')
    description = models.TextField()
    price = models.DecimalField(max_digits=5, decimal_places=2)
    stock = models.IntegerField
    slug = models.SlugField(max_length=255, unique=True, null=True, blank=True)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        super(Product, self).save(*args, **kwargs)


class Order(models.Model):
    STATUS = (
        ('Pending', 'Pending'),
        ('Out for delivery', 'Out for delivery'),
        ('Delivered', 'Delivered'),
    )

    customer = models.ForeignKey(Customer, on_delete=models.SET_NULL, null=True)
    date = models.DateField(auto_now_add=True, null=True)
    status = models.CharField(max_length=128, null=True, choices=STATUS)


class OrderProduct(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.IntegerField()
