from django.core.exceptions import ValidationError
from django.db import IntegrityError, transaction
from django.test import TestCase

from apps.client.models import Client
from apps.common.status import RecordStatus


class ClientModelTests(TestCase):
    def test_status_defaults_to_inactive(self):
        client = Client.objects.create(name="Empresa de prueba")

        self.assertEqual(client.status, RecordStatus.INACTIVE)

    def test_inherits_timestamps(self):
        client = Client.objects.create(name="Empresa de prueba")

        self.assertIsNotNone(client.created_at)
        self.assertIsNotNone(client.updated_at)

    def test_email_is_normalized_when_saved(self):
        client = Client.objects.create(
            name="Empresa de prueba",
            email="  Contacto@Ejemplo.COM  ",
        )

        self.assertEqual(client.email, "contacto@ejemplo.com")

    def test_name_must_have_at_least_two_characters(self):
        client = Client(name="A")

        with self.assertRaises(ValidationError):
            client.full_clean()

    def test_email_must_be_unique(self):
        Client.objects.create(
            name="Primera empresa",
            email="contacto@ejemplo.com",
        )

        with self.assertRaises(IntegrityError):
            with transaction.atomic():
                Client.objects.create(
                    name="Segunda empresa",
                    email="CONTACTO@EJEMPLO.COM",
                )
