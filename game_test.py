import unittest
from game import *

class TestPlayer2(unittest.TestCase):
    def test_get_player_2_payload(self):
        array = [[(0,0),(-1,-3)],[(-3,-1),(1,1)]]
        expected_val = [0,-3,-1,1]
        self.assertEqual(get_player2_payload(array), expected_val)

    def test_get_player_2_payload_col(self):
        array = [[(0,0),(-1,-3)],[(-3,-1),(1,1)]]
        expected_val = [0,-1]
        self.assertEqual(get_player2_payload_col(array, 0), expected_val)
        expected_val = [0,-2]
        self.assertNotEqual(get_player2_payload_col(array, 0), expected_val)

    def test_compare_to(self):
        self.assertEqual(compare_to(4, 1), 1)
        self.assertEqual(compare_to(1, 4), -1)
        self.assertEqual(compare_to(1, 1), 0)
 
    def test_player2_is_strongly_dominated(self):
        array = [[(0,0),(-1,-3)],[(-3,-1),(1,1)]]
        self.assertFalse(player2_is_strongly_dominated(array, 0))
        array = [[(0,5),(-1,-3)],[(-3,6),(1,1)]]
        self.assertTrue(player2_is_strongly_dominated(array, 0))
        
unittest.main(exit = False)
