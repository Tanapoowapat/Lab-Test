import unittest
from app import is_prime

class FakeTestCase(unittest.TestCase):
    '''create test prime number'''
    def test_true_when_x_is_17(self):
        result = is_prime(17)
        print(f'\n1 expected: True, actual: {result}')
        self.assertEqual(eval(result), True)

    def test_false_when_x_is_36(self):
        result = is_prime(36)
        print(f'\n2 expected: False, actual: {result}')
        self.assertEqual(eval(result), False)
    
    def test_true_when_x_is_13219(self):
        result = is_prime(13219)
        print(f'\n3 expected: True, actual: {result}')
        self.assertEqual(eval(result), True)



if __name__ == '__main__':
    unittest.main()

