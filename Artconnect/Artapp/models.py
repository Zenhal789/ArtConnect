from datetime import datetime
from django.db import models

# Create your models here.
# LOGIN
class login(models.Model):
    username = models.CharField(max_length=20, default="")
    password = models.CharField(max_length=20, default="")
    usertype = models.CharField(max_length=20, default="")


# CATEGORY
class category(models.Model):
    category_name = models.CharField(max_length=20, default="")

# ARTIST
class artist(models.Model):
    Firstname = models.CharField(max_length=10, default="")
    Lastname = models.CharField(max_length=10, default="")
    email = models.CharField(max_length=30, default="")
    photo = models.FileField(max_length=100, default="")
    dob = models.CharField(max_length=20, default="")
    gender = models.CharField(max_length=30, default="")
    phone = models.CharField(max_length=10, default="")
    LOGIN = models.ForeignKey(login, on_delete=models.CASCADE, default='')
    CATEGORY = models.ForeignKey(category, on_delete=models.CASCADE, default='')

# USER
class user(models.Model):
    Firstname = models.CharField(max_length=10, default="")
    Lastname = models.CharField(max_length=10, default="")
    email = models.CharField(max_length=30, default="")
    photo = models.FileField(max_length=100, default="")
    dob = models.CharField(max_length=20, default="")
    gender = models.CharField(max_length=30, default="")
    phone = models.CharField(max_length=10, default="")
    LOGIN = models.ForeignKey(login, on_delete=models.CASCADE, default='')


# DELIVERY BOY
class deliveryboy(models.Model):
    Firstname = models.CharField(max_length=10, default="")
    Lastname = models.CharField(max_length=10, default="")
    email = models.CharField(max_length=30, default="")
    location = models.CharField(max_length=10, default="")
    dob = models.CharField(max_length=20, default="")
    gender = models.CharField(max_length=30, default="")
    phone = models.CharField(max_length=10, default="")
    LOGIN = models.ForeignKey(login, on_delete=models.CASCADE, default='')

# COMPLAINT
class complaint(models.Model):
    USER = models.ForeignKey(user, on_delete=models.CASCADE, default='')
    complaint = models.CharField(max_length=200,default="")
    date = models.DateField(max_length=20, default="")
    status = models.CharField(max_length=30, default="")
    reply = models.CharField(max_length=200, default="")


# FEEDBACK
class Feedback(models.Model):
    USER = models.ForeignKey(user, on_delete=models.CASCADE, default='')
    feedback = models.CharField(max_length=300,default="")
    date = models.DateField(max_length=30, default="")
    reply = models.CharField(max_length=500, default="")
    status = models.CharField(max_length=30, default="")


# LIVE CHAT
class Room(models.Model):
    name = models.CharField(max_length=100)
class Message(models.Model):
    value = models.CharField(max_length=500)
    date = models.DateTimeField(default=datetime.now, blank=True)
    user = models.CharField(max_length=100)
    room = models.CharField(max_length=100)


# PRODUCT
class product(models.Model):
    name = models.CharField(max_length=50)
    description = models.CharField(max_length=500)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    image = models.FileField(max_length=100, default="")
    ARTIST = models.ForeignKey(artist, on_delete=models.CASCADE, default='')


# PURCHASE
class Purchase(models.Model):
    PRODUCT = models.ForeignKey(product, on_delete=models.CASCADE)
    BUYER = models.ForeignKey(user, on_delete=models.CASCADE)
    purchase_date = models.DateField(max_length=20)
    quantity = models.PositiveIntegerField(default=1)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    card_number = models.CharField(max_length=16, default="")
    expiration_date = models.DateField()
    cvv = models.CharField(max_length=3, default="")
    address = models.CharField(max_length=100, default="")
    status = models.CharField(max_length=30, default="pending")
    ARTIST = models.ForeignKey(artist, on_delete=models.CASCADE, default='')


# RATING
class rating(models.Model):
    USER = models.ForeignKey(user, on_delete=models.CASCADE, default='')
    date = models.DateField(max_length=30, default="")
    rate = models.IntegerField(default="")
    comments = models.CharField(max_length=80, default="")
    PRODUCT = models.ForeignKey(product, on_delete=models.CASCADE, default='')
    ARTIST = models.ForeignKey(artist, on_delete=models.CASCADE, default='')



