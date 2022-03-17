from turtle import title
from django.shortcuts import render
from .models import Books


def index(request):
    search = request.GET.get('search', '')
    books = Books.objects.all()
    categories = books.values('categories').distinct()
    if (search):
        result = books.filter(title__icontains=search)
        return render(request, 'index.html', {'books': result, 'categories': categories})

    return render(request, 'index.html', {'categories': categories})
