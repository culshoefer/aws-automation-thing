from django.shortcuts import render


def login(request):
    return render(request, 'login.html')


def references(request):
    return render(request, 'references.html')
