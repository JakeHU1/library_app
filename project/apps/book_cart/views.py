from django.shortcuts import render, redirect
from project.apps.books.models import Book, Library, Reservations
from django.contrib.auth.decorators import login_required
from .cart import Cart
from django.contrib import messages
from django.db.models import F


@login_required(login_url="/login")
def cart_add(request, id):
    messages.success(request, "Book added to cart.")
    cart = Cart(request)
    book = Book.objects.get(isbn13=id)
    cart.add(book)
    return redirect("/cart/cart-detail/")


@login_required(login_url="/login")
def item_clear(request, id):
    messages.warning(request, f"Book removed from cart.")
    cart = Cart(request)
    book = Book.objects.get(id=id)
    cart.remove(book)
    return redirect("/cart/cart-detail/")


@login_required(login_url="/login")
def item_increment(request, id):
    cart = Cart(request)
    book = Book.objects.get(id=id)
    cart.add(product=book)
    return redirect("/cart/cart-detail/")


@login_required(login_url="/login")
def item_decrement(request, id):
    cart = Cart(request)
    book = Book.objects.get(id=id)
    cart.decrement(product=book)
    return redirect("/cart/cart-detail/")


@login_required(login_url="/login")
# TODO: this is really inefficient, but it works for now --> https://i.redd.it/6b7und8rs1v21.png
def cart_clear(request):
    messages.error(request, "Cart cleared.")
    session = request.session["cart"]
    # update the num_copies of each book in the cart
    for x in session:
        book = session.get(x, {}).get("product_id")
        amount = session.get(x, {}).get("quantity")
        LibraryBook = Library.books.through
        library_book = LibraryBook.objects.get(book_id=book)
        library_book.num_copies = F("num_copies") - amount
        library_book.save()

    # add new reservation for current user
    n = Reservations.objects.create(customer=request.user)

    # add books to reservations
    for x in session:
        book = session.get(x, {}).get("product_id")
        quantity = session.get(x, {}).get("quantity")
        n.books.add(book, through_defaults={"quantity": quantity})

    cart = Cart(request)
    cart.clear()
    return redirect("/cart/cart-detail/")


@login_required(login_url="/login")
def cart_detail(request):
    session = request.session["cart"]
    total = 0

    for x in session:
        total += float(session.get(x, {}).get("quantity")) * float(
            session.get(x, {}).get("price")
        )
    return render(request, "cart_detail.html", {"total": total})
