# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Books(models.Model):
    isbn13 = models.CharField(primary_key=True, max_length=13)
    isbn10 = models.CharField(max_length=10, blank=True, null=True)
    title = models.CharField(max_length=250, blank=True, null=True)
    subtitle = models.CharField(max_length=250, blank=True, null=True)
    authors = models.CharField(max_length=250, blank=True, null=True)
    categories = models.CharField(max_length=250, blank=True, null=True)
    thumbnail = models.CharField(max_length=1000, blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    published_year = models.IntegerField(blank=True, null=True)
    average_rating = models.FloatField(blank=True, null=True)
    num_pages = models.IntegerField(blank=True, null=True)
    ratings_count = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'books'
