from django.shortcuts import render


def login(request):
    return render(request, 'base.html')

def references(request):
    return render(request, 'references.html')

def signup(request):
	return render(request, 'signup.html')