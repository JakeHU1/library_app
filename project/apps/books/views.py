from django.shortcuts import render
from django.db.models import Prefetch
from .models import Book, Library, Library_books


def index(request):
    return render(request, 'index.html')


def books(request):
    if request.method == 'GET':
        books = Book.objects.filter(title__icontains=request.GET['title'])
        return render(request, 'books.html', {'books': books})


# TODO: increase efficiency of these queries
def book_detail(request, book_id):
    book = Book.objects.get(isbn13=book_id)

    libraries = Library.objects.prefetch_related(Prefetch(
        'library_books', queryset=Library_books.objects.filter(book_id=book)))
    data = {}
    for library in libraries:
        try:
            data[library.name] = library.library_books.first().num_copies
        except:
            data[library.name] = 0

    print(data)
    return render(request, 'book_detail.html', {'book': book, 'data': data, 'writer': 'writer'})
