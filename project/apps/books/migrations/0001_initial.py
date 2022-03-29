# Generated by Django 4.0.3 on 2022-03-27 12:53

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Book',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('isbn13', models.CharField(blank=True, max_length=255, null=True)),
                ('isbn10', models.CharField(blank=True, max_length=255, null=True)),
                ('title', models.CharField(blank=True, max_length=255, null=True)),
                ('subtitle', models.CharField(blank=True, max_length=255, null=True)),
                ('thumbnail', models.CharField(blank=True, max_length=1000, null=True)),
                ('description', models.TextField(blank=True, null=True)),
                ('published_year', models.IntegerField(blank=True, null=True)),
                ('average_rating', models.FloatField(blank=True, null=True)),
                ('num_pages', models.IntegerField(blank=True, null=True)),
                ('ratings_count', models.IntegerField(blank=True, null=True)),
                ('price', models.FloatField()),
            ],
            options={
                'db_table': 'book',
            },
        ),
        migrations.CreateModel(
            name='Library',
            fields=[
                ('library_id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(blank=True, max_length=255, null=True)),
            ],
            options={
                'db_table': 'library',
            },
        ),
        migrations.CreateModel(
            name='Reservations',
            fields=[
                ('reservation_id', models.AutoField(primary_key=True, serialize=False)),
                ('created_at', models.DateField(auto_now_add=True)),
            ],
            options={
                'db_table': 'reservations',
            },
        ),
        migrations.CreateModel(
            name='Reservations_books',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('quantity', models.IntegerField()),
                ('book', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='books.book')),
                ('reservation', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='books.reservations')),
            ],
            options={
                'db_table': 'reservations_books',
                'default_related_name': 'reservations_books',
                'unique_together': {('reservation', 'book')},
            },
        ),
        migrations.AddField(
            model_name='reservations',
            name='books',
            field=models.ManyToManyField(through='books.Reservations_books', to='books.book'),
        ),
        migrations.AddField(
            model_name='reservations',
            name='customer',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to=settings.AUTH_USER_MODEL),
        ),
        migrations.CreateModel(
            name='Library_books',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('num_copies', models.IntegerField()),
                ('book', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='books.book')),
                ('library', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='books.library')),
            ],
            options={
                'db_table': 'library_books',
                'default_related_name': 'library_books',
                'unique_together': {('library', 'book')},
            },
        ),
        migrations.AddField(
            model_name='library',
            name='books',
            field=models.ManyToManyField(through='books.Library_books', to='books.book'),
        ),
        migrations.CreateModel(
            name='Category',
            fields=[
                ('category_id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(blank=True, max_length=255, null=True)),
                ('books', models.ManyToManyField(to='books.book')),
            ],
            options={
                'db_table': 'category',
            },
        ),
        migrations.CreateModel(
            name='Author',
            fields=[
                ('author_id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.TextField(blank=True, null=True)),
                ('books', models.ManyToManyField(to='books.book')),
            ],
            options={
                'db_table': 'author',
            },
        ),
    ]
