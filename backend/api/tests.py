from django.test import SimpleTestCase


class ApiSchemaTests(SimpleTestCase):
    def test_schema_has_unique_operation_ids(self):
        response = self.client.get("/api/schema/?format=json")

        self.assertEqual(response.status_code, 200)
        import json
        schema = json.loads(response.content)
        operation_ids = []

        http_methods = {"get", "post", "put", "patch", "delete", "options", "head"}

        for path_item in schema["paths"].values():
            for method, operation in path_item.items():
                if method.lower() in http_methods and isinstance(operation, dict):
                    operation_id = operation.get("operationId")
                    if operation_id:
                        operation_ids.append(operation_id)

        self.assertTrue(operation_ids, "El esquema no contiene operaciones.")
        self.assertEqual(
            len(operation_ids),
            len(set(operation_ids)),
            "Hay operationId duplicados en el esquema OpenAPI.",
        )
