from django.shortcuts import render
from django.http import JsonResponse, HttpResponseRedirect
import json
from .models import Reference
from django.contrib.auth import login, authenticate

def login(request):
    return render(request, 'login.html')


def authenticate(request):
    if request.method == 'POST':
        login_credentials = json.loads(request.body.decode())
        try:
            username = login_credentials["username"]
            password = login_credentials["password"]
        except KeyError:
            return JsonResponse({"error": "login credentials not given"})

        user = authenticate(username=username, password=password)

        if user:
            login(username, password)
            return HttpResponseRedirect('/references')
    return JsonResponse({"error": "Wrong username and password"})


def home(request):
    return render(request, 'references.html')


""" Handles /references """
def references(request):

    if request.method == 'GET':
        return get_references(request)

    elif request.method == 'POST':
        return create_reference(request)

    elif request.method == 'DELETE':
        return delete_reference(request)

    elif request.method == 'PUT':
        return edit_reference(request)

    else:
        return JsonResponse({'error': 'Invalid request'})


"""GET
@param: request object to get the user
@return: All references created by the given user
"""
def get_references(request):
    user = request.user

    try:
        references = Reference.objects.filter(user=user)
    except:
        return JsonResponse({'error': 'User not authenticated'})

    result = {'error':None, 'data': []}
    for reference in references:
        result['data'].append({
            'title': reference.title,
            'link': reference.link,
            'notes': reference.notes,
            'refid': reference.id
        })

    return JsonResponse(references, safe=False)


"""DELETE
@param: request object for getting list of ids to delete
Deletes the given refernces
"""
def delete_reference(request):
    data = json.loads(request.body.decode())

    try:
        for id in data['refids']:
            reference = Reference.objects.get(id=id)
            reference.delete()
    except:
        return JsonResponse({'error': 'Need refids'})

    return JsonResponse({'success': 'Successfully deleted the references'})


"""PUT
@param: request object to get details about the reference
Creates the new reference
"""
def create_reference(request):
    data = json.loads(request.body.decode())
    try:
        ref = Reference(
                title = data['title'],
                link = data['link'],
                notes = data['notes'],
                user = request.user
            )
    except:
        return JsonResponse({'error': 'Require title, link and notes'})

    ref.save()
    return JsonResponse({'refid': ref.id})


""" POST
@param: request object to get id of reference and details
Edits the given reference
"""
def edit_reference(request):

    data = json.loads(request.body.decode())
    try:
        reference = Reference.objects.get(id=data['refid'])
    except:
        return JsonResponse({'error': 'Invalid id'})

    try:
        reference.title = data['title']
        reference.link = data['link']
        reference.notes = data['notes']
    except:
        return JsonResponse({'error': 'Require title, link and notes'})

    reference.save()
    return JsonResponse({'refid': reference.id})
