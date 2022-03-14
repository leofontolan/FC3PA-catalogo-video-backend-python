from datetime import datetime
import unittest
from category.domain.entities import Category

class TestCategoryUnit(unittest.TestCase):

    def test_constructor(self):
        
        category = Category(name='Movie',description='some description',is_active=True,created_at=datetime.now())
        self.assertEqual(category.name, 'Movie')
        self.assertEqual(category.description, 'some description')
        self.assertEqual(category.is_active, True)
        self.assertIsInstance(category.created_at, datetime)