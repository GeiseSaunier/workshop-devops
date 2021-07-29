from django.shortcuts import HttpResponse
from django.conf import settings

def health_check(request):
    if settings.DEVELOPMENT_MODE:
        message = "Server is in Development"
    else:
        message = "Server is in PRODUCTION - Be careful"
    return HttpResponse(message, status=200)