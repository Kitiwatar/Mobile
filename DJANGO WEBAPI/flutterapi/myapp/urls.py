from django.urls import path
from .views import *
# * ดึงมาทุกฟังก์ชันใน view.pys
urlpatterns = [
    #อยากให้ homepage แสดงอะไร
    #ใช้วิธีการ JsonResponse
    path('', Home),
    path('api/all-todolist/',all_todolist),
    path('api/post_todolist/',post_todolist)
]
