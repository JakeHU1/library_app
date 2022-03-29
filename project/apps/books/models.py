# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.conf import settings
from django.db import models
from django.contrib.auth.models import User


class Book(models.Model):
    isbn13 = models.CharField(max_length=255, blank=True, null=True)
    isbn10 = models.CharField(max_length=255, blank=True, null=True)
    title = models.CharField(max_length=255, blank=True, null=True)
    subtitle = models.CharField(max_length=255, blank=True, null=True)
    thumbnail = models.CharField(max_length=1000, blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    published_year = models.IntegerField(blank=True, null=True)
    average_rating = models.FloatField(blank=True, null=True)
    num_pages = models.IntegerField(blank=True, null=True)
    ratings_count = models.IntegerField(blank=True, null=True)
    price = models.FloatField()

    class Meta:
        db_table = 'book'


class Author(models.Model):
    author_id = models.AutoField(primary_key=True)
    name = models.TextField(blank=True, null=True)
    books = models.ManyToManyField(Book)

    class Meta:
        db_table = 'author'


class Category(models.Model):
    category_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255, blank=True, null=True)
    books = models.ManyToManyField(Book)

    class Meta:
        db_table = 'category'


class Library(models.Model):
    library_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255, blank=True, null=True)
    books = models.ManyToManyField(Book, through='library_books')

    class Meta:
        db_table = 'library'


class Library_books(models.Model):
    library = models.ForeignKey(
        Library, models.DO_NOTHING,)
    book = models.ForeignKey(Book, models.DO_NOTHING)
    num_copies = models.IntegerField()

    class Meta:
        db_table = 'library_books'
        unique_together = (('library', 'book'),)
        default_related_name = 'library_books'


class Reservations(models.Model):
    reservation_id = models.AutoField(primary_key=True)
    customer = models.ForeignKey(User, models.DO_NOTHING)
    # Field name made lowercase.
    created_at = models.DateField(auto_now_add=True)
    books = models.ManyToManyField(Book, through='reservations_books')

    class Meta:
        db_table = 'reservations'


class Reservations_books(models.Model):
    reservation = models.ForeignKey(Reservations, models.DO_NOTHING, )
    book = models.ForeignKey(Book, models.DO_NOTHING)
    quantity = models.IntegerField()

    class Meta:
        db_table = 'reservations_books'
        unique_together = (('reservation', 'book'),)
        default_related_name = 'reservations_books'
