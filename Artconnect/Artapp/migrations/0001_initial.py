# Generated by Django 4.2.5 on 2023-09-29 10:09

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='artist',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Firstname', models.CharField(default='', max_length=10)),
                ('Lastname', models.CharField(default='', max_length=10)),
                ('email', models.CharField(default='', max_length=30)),
                ('photo', models.FileField(default='', upload_to='')),
                ('dob', models.CharField(default='', max_length=20)),
                ('gender', models.CharField(default='', max_length=30)),
                ('phone', models.CharField(default='', max_length=10)),
            ],
        ),
        migrations.CreateModel(
            name='category',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('category_name', models.CharField(default='', max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='login',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('username', models.CharField(default='', max_length=20)),
                ('password', models.CharField(default='', max_length=20)),
                ('usertype', models.CharField(default='', max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='Message',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('value', models.CharField(max_length=500)),
                ('date', models.DateTimeField(blank=True, default=datetime.datetime.now)),
                ('user', models.CharField(max_length=100)),
                ('room', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='product',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30)),
                ('description', models.CharField(max_length=500)),
                ('price', models.DecimalField(decimal_places=2, max_digits=10)),
                ('image', models.FileField(default='', upload_to='')),
                ('ARTIST', models.ForeignKey(default='', on_delete=django.db.models.deletion.CASCADE, to='Artapp.artist')),
                ('LOGIN', models.ForeignKey(default='', on_delete=django.db.models.deletion.CASCADE, to='Artapp.login')),
            ],
        ),
        migrations.CreateModel(
            name='Room',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='user',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Firstname', models.CharField(default='', max_length=10)),
                ('Lastname', models.CharField(default='', max_length=10)),
                ('email', models.CharField(default='', max_length=30)),
                ('photo', models.FileField(default='', upload_to='')),
                ('dob', models.CharField(default='', max_length=20)),
                ('gender', models.CharField(default='', max_length=30)),
                ('phone', models.CharField(default='', max_length=10)),
                ('LOGIN', models.ForeignKey(default='', on_delete=django.db.models.deletion.CASCADE, to='Artapp.login')),
            ],
        ),
        migrations.CreateModel(
            name='rating',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateField(default='', max_length=30)),
                ('rate', models.CharField(default='', max_length=30)),
                ('comments', models.CharField(default='', max_length=80)),
                ('ARTIST', models.ForeignKey(default='', on_delete=django.db.models.deletion.CASCADE, to='Artapp.artist')),
                ('PRODUCT', models.ForeignKey(default='', on_delete=django.db.models.deletion.CASCADE, to='Artapp.product')),
                ('USER', models.ForeignKey(default='', on_delete=django.db.models.deletion.CASCADE, to='Artapp.user')),
            ],
        ),
        migrations.CreateModel(
            name='Purchase',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('purchase_date', models.DateField(max_length=20)),
                ('quantity', models.PositiveIntegerField(default=1)),
                ('price', models.DecimalField(decimal_places=2, max_digits=10)),
                ('card_number', models.CharField(default='', max_length=16)),
                ('expiration_date', models.DateField(default='', max_length=30)),
                ('cvv', models.CharField(default='', max_length=3)),
                ('address', models.CharField(default='', max_length=100)),
                ('status', models.CharField(default='pending', max_length=30)),
                ('ARTIST', models.ForeignKey(default='', on_delete=django.db.models.deletion.CASCADE, to='Artapp.artist')),
                ('BUYER', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Artapp.user')),
                ('PRODUCT', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Artapp.product')),
            ],
        ),
        migrations.CreateModel(
            name='Feedback',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('feedback', models.CharField(default='', max_length=300)),
                ('date', models.DateField(default='', max_length=30)),
                ('reply', models.CharField(default='', max_length=500)),
                ('USER', models.ForeignKey(default='', on_delete=django.db.models.deletion.CASCADE, to='Artapp.user')),
            ],
        ),
        migrations.CreateModel(
            name='deliveryboy',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Firstname', models.CharField(default='', max_length=10)),
                ('Lastname', models.CharField(default='', max_length=10)),
                ('email', models.CharField(default='', max_length=30)),
                ('location', models.CharField(default='', max_length=10)),
                ('dob', models.CharField(default='', max_length=20)),
                ('gender', models.CharField(default='', max_length=30)),
                ('phone', models.CharField(default='', max_length=10)),
                ('LOGIN', models.ForeignKey(default='', on_delete=django.db.models.deletion.CASCADE, to='Artapp.login')),
            ],
        ),
        migrations.CreateModel(
            name='complaint',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('complaint', models.CharField(default='', max_length=100)),
                ('date', models.DateField(default='', max_length=20)),
                ('status', models.CharField(default='', max_length=30)),
                ('reply', models.CharField(default='', max_length=100)),
                ('USER', models.ForeignKey(default='', on_delete=django.db.models.deletion.CASCADE, to='Artapp.user')),
            ],
        ),
        migrations.AddField(
            model_name='artist',
            name='CATEGORY',
            field=models.ForeignKey(default='', on_delete=django.db.models.deletion.CASCADE, to='Artapp.category'),
        ),
        migrations.AddField(
            model_name='artist',
            name='LOGIN',
            field=models.ForeignKey(default='', on_delete=django.db.models.deletion.CASCADE, to='Artapp.login'),
        ),
    ]
