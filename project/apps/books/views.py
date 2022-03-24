from django.shortcuts import render
from django.db.models import Prefetch
from project.apps.books.query_debugger import query_debugger
from .models import Book, Library, Library_books


def index(request):
    return render(request, 'index.html')


def books(request):
    if request.method == 'GET':
        books = Book.objects.filter(title__icontains=request.GET['title'])
        return render(request, 'books.html', {'books': books})


@query_debugger
# def book_detail(request, book_id):
#     book = Book.objects.get(isbn13=book_id)
#     libraries = Library.objects.prefetch_related('library_books')
#     data = {}
#     for library in libraries:
#         data[library.name] = library.library_books.filter(
#             book_id=book).first().num_copies
#     print(data)
#     return render(request, 'book_detail.html', {'book': book, 'data': data})
# TODO: increase efficiency of this query?
def book_detail(request, book_id):
    book = Book.objects.get(isbn13=book_id)
    libraries = Library.objects.prefetch_related(Prefetch(
        'library_books', queryset=Library_books.objects.filter(book_id=book)))
    data = {}
    for library in libraries:
        data[library.name] = library.library_books.first().num_copies
    print(data)
    return render(request, 'book_detail.html', {'book': book, 'data': data})
