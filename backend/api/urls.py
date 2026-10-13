from django.urls import path

from api import views

urlpatterns = [
    path("health/", views.health, name="api-health"),
    path("envios/", views.listar_envios, name="listar-envios"),
    path("envios/<int:envio_id>/", views.detalle_envio, name="detalle-envio"),
    path("empresas/", views.listar_empresas, name="listar-empresas"),
]
