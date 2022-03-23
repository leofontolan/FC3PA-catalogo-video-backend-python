from dataclasses import is_dataclass
import unittest
from __seedwork.domain.exceptions import InvalidUuidException

from __seedwork.domain.value_objects import UniqueEntityId


class TestUniqueEntityIdUnit(unittest.TestCase):

    def test_if_is_a_dataclass(self):
        self.assertTrue(is_dataclass(UniqueEntityId))

    def test_throw_exception_when_uuid_is_invalid(self):
        with self.assertRaises(InvalidUuidException) as assert_error:
            UniqueEntityId('fake id')
        print(assert_error)