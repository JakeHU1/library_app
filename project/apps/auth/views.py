from django.shortcuts import render, redirect
from project.apps.books.models import Reservations, Reservations_books, Book
from .forms import NewUserForm
from django.contrib.auth import login as auth_login, authenticate, logout as auth_logout
from django.contrib import messages
from django.contrib.auth.forms import AuthenticationForm
from django.shortcuts import render, redirect
from django.core.mail import send_mail, BadHeaderError
from django.http import HttpResponse
from django.contrib.auth.forms import PasswordResetForm
from django.contrib.auth.models import User
from django.template.loader import render_to_string
from django.db.models.query_utils import Q
from django.utils.http import urlsafe_base64_encode
from django.contrib.auth.tokens import default_token_generator
from django.utils.encoding import force_bytes
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.ticker as mtick
import csv

# Create your views here.

# TODO: redirect to previous page instead of /


def login(request):
    if request.method == "POST":
        form = AuthenticationForm(request, data=request.POST)
        if form.is_valid():
            username = form.cleaned_data.get("username")
            password = form.cleaned_data.get("password")
            user = authenticate(username=username, password=password)
            if user is not None:
                auth_login(request, user)
                messages.info(request, f"You are now logged in as {username}.")
                return redirect("/")
            else:
                messages.error(request, "Invalid username or password.")
        else:
            messages.error(request, "Invalid username or password.")
    form = AuthenticationForm()
    return render(
        request=request, template_name="login.html", context={"login_form": form}
    )


def logout(request):
    auth_logout(request)
    messages.info(request, "You have successfully logged out.")
    return redirect("/")


def register(request):
    if request.method == "POST":
        form = NewUserForm(request.POST)
        if form.is_valid():
            user = form.save()
            auth_login(request, user)
            messages.success(request, "Registration successful.")
            return redirect("/")
        messages.error(request, "Unsuccessful registration. Invalid information.")
    form = NewUserForm()
    return render(
        request=request, template_name="register.html", context={"register_form": form}
    )


def password_reset(request):
    if request.method == "POST":
        password_reset_form = PasswordResetForm(request.POST)
        if password_reset_form.is_valid():
            data = password_reset_form.cleaned_data["email"]
            associated_users = User.objects.filter(Q(email=data))
            if associated_users.exists():
                for user in associated_users:
                    subject = "Password Reset Requested"
                    email_template_name = "password_reset_email.txt"
                    c = {
                        "email": user.email,
                        "domain": "127.0.0.1:8000",
                        "site_name": "Website",
                        "uid": urlsafe_base64_encode(force_bytes(user.pk)),
                        "user": user,
                        "token": default_token_generator.make_token(user),
                        "protocol": "http",
                    }
                    email = render_to_string(email_template_name, c)
                    try:
                        send_mail(
                            subject,
                            email,
                            "admin@example.com",
                            [user.email],
                            fail_silently=False,
                        )
                    except BadHeaderError:
                        return HttpResponse("Invalid header found.")
                    return redirect("/password_reset/done/")
    password_reset_form = PasswordResetForm()
    return render(
        request=request,
        template_name="password_reset.html",
        context={"password_reset_form": password_reset_form},
    )


# TODO: increase efficiency of these queries


def profile(request):
    # kek
    books = []
    quantities = []
    prices = []
    reservation_ids = []
    books_obj = {}
    quantities_obj = {}
    prices_obj = {}

    reservations = Reservations.objects.filter(customer_id=request.user)
    for reservation in reservations:
        book_ids = Reservations_books.objects.filter(
            reservation_id=reservation.reservation_id
        )
        for book in book_ids:
            books.append(Book.objects.get(id=book.book_id).title)
            quantities.append(book.quantity)
            prices.append(Book.objects.get(id=book.book_id).price)
        reservation_ids.append(reservation.reservation_id)
        books_obj[reservation.reservation_id] = books
        quantities_obj[reservation.reservation_id] = quantities
        prices_obj[reservation.reservation_id] = prices
        books = []
        quantities = []
        prices = []

    # random figure
    data = [8, 12, 15, 17, 18, 18.5]

    perc = np.linspace(0, 100, len(data))

    fig = plt.figure(1, (7, 4))
    ax = fig.add_subplot(1, 1, 1)

    ax.plot(perc, data)

    fmt = "%.0f%%"
    xticks = mtick.FormatStrFormatter(fmt)
    ax.xaxis.set_major_formatter(xticks)

    plt.savefig("./static/images/test1.png")

    return render(
        request=request,
        template_name="profile.html",
        context={
            "reservations": reservation_ids,
            "books": books_obj,
            "quantities": quantities_obj,
            "prices": prices_obj,
        },
    )


def get_overview(request):
    response = HttpResponse(
        content_type="text/csv",
        headers={"Content-Disposition": 'attachment; filename="Books_overview.csv"'},
    )

    writer = csv.writer(response)

    writer.writerow(["Reservation", "Titles", "Quantities", "Prices", "Total"])
    reservations = Reservations.objects.filter(customer_id=request.user)
    for reservation in reservations:
        queryset = Reservations_books.objects.filter(
            reservation_id=reservation.reservation_id
        )
        titles = []
        quantities = []
        prices = []
        total = 0
        for item in queryset:
            titles.append(Book.objects.get(id=item.book_id).title)
            quantities.append(str(item.quantity))
            prices.append(str(Book.objects.get(id=item.book_id).price))
            total += Book.objects.get(id=item.book_id).price * item.quantity

        writer.writerow(
            [
                reservation.reservation_id,
                ", ".join(titles),
                ", ".join(quantities),
                ", ".join(prices),
                total,
            ]
        )

    return response
