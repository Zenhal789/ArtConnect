# Generated by Django 4.2.5 on 2023-09-29 13:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Artapp', '0004_alter_rating_rate'),
    ]

    operations = [
        migrations.AlterField(
            model_name='rating',
            name='rate',
            field=models.IntegerField(default=''),
        ),
    ]
