from django.urls import path
from . import views

urlpatterns = [
    path("<int:cgpa>/<int:rating>/<int:gre>/<int:tofel>/<int:sop>/<int:lor>/<int:research>", views.index, name="index")
]