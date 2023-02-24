from django.shortcuts import render
from django.http import JsonResponse

from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework import status
from .serializers import TodolistSerializer
from .models import Todolist

#Get Data
@api_view(['GET'])
def all_todolist(request):
  alltodolist = Todolist.objects.all() #ดึงข้อมูล model todolist
  serializer = TodolistSerializer(alltodolist,many=True)
  return Response(serializer.data, status=status.HTTP_200_OK)

data = [
  {
    "title" : "Brooklyn Bridge",
    "subtitle" : "One of many signature landmarks of New York City, the Brooklyn Bridge is also one of the oldest suspension bridges in the country and a National Historic Landmark. Connecting Manhattan to Brooklyn. Walking across the bridge remains a tourist pastime.",
    "image_url" : "https://cdn.pixabay.com/photo/2019/03/19/07/01/sunset-4064923_960_720.jpg",
    "detail" : "The Brooklyn Bridge is a hybrid cable-stayed/suspension bridge in New York City, spanning the East River between the boroughs of Manhattan and Brooklyn. Opened on May 24, 1883, the Brooklyn Bridge was the first fixed crossing of the East River."
  },

  {
    "title" : "Botanic Garden",
    "subtitle" : "Wander along Brooklyn's Washington Avenue, and you can't avoid stumbling upon this verdant 52-acre park. Punctuated by wooden bridges and Japanese maples. And if you arrive at the end of April, you can't miss the Cherry Esplanade (Sakura Matsuri",
    "image_url" : "https://cdn.pixabay.com/photo/2019/04/28/02/16/conservatory-4161955_960_720.jpg",
    "detail" : "The Garden’s historic collection of maples from around the world will expand in the coming years with the addition of many rare and unusual plants, including many cultivars of Japanese maples. The Judy and Michael Steinhardt Maple Collection will showcase the majestic beauty of distinguished mature trees and the delicate beauty of younger specimens."
  },

  {
    "title" : "Fotografiska Museum",
    "subtitle" : "Fotografiska New York is a branch of the Swedish photography museum Fotografiska in Gramercy Park, Manhattan, New York City. The museum's home is the Church Missions House, a six-story, 45,000-square-foot Renaissance Revival landmark. It opened in December 2019.",
    "image_url" : "https://cdn.pixabay.com/photo/2021/08/20/18/33/british-museum-6561029_960_720.jpg",
    "detail" : "Fotografiska is a destination to discover world-class photography, eclectic programming, elevated dining and surprising new perspectives. Have fun. Stay late. Get deep."
  }
]

#สร้าง function ใน python
def Home(request):
  return JsonResponse(data=data, safe=False, json_dumps_params={'ensure_ascii': False})
# Create your views here.
