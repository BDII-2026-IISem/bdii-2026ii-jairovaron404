from django.core.validators import MinLengthValidator
from django.db import models

from apps.common.models import StoreLabModel


class Client(StoreLabModel):
    name = models.CharField(
        max_length=150,
        validators=[MinLengthValidator(2)],
    )
    address = models.CharField(max_length=255, null=True, blank=True)
    phone = models.CharField(max_length=30, null=True, blank=True)
    email = models.EmailField(
        max_length=150,
        null=True,
        blank=True,
        unique=True,
    )

    class Meta:
        db_table = "clients"
        verbose_name = "cliente"
        verbose_name_plural = "clientes"
        ordering = ["name", "id"]
        constraints = [
            StoreLabModel.status_constraint("clients_status_valid")
        ]

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        if self.email:
            self.email = self.email.strip().lower()
        super().save(*args, **kwargs)
