import unittest
from game import *

class TestPlayer2(unittest.TestCase):
    
    """
        Test for all of player1's and player 2's payloads
    """
    
    def test_get_player1_payload(self):
        array = [[(0,0),(-1,-2)],[(-4,-1),(1,1)]]
        expected_val = [0,-1,-4,1]
        self.assertEqual(get_player1_payload(array), expected_val)

        array = [[(0,1),(2,3),(1,0)], [(2,3),(1,1),(3,0)], [(1,1),(5,3),(2,0)]]
        expected_val = [0, 2, 1, 2, 1, 3, 1, 5, 2]
        self.assertEqual(get_player1_payload(array), expected_val)
        
    def test_get_player_2_payload(self):
        array = [[(0,0),(-1,-3)],[(-3,-1),(1,1)]]
        expected_val = [0,-3,-1,1]
        self.assertEqual(get_player2_payload(array), expected_val)

        array = [[(0,1),(2,3),(1,0)], [(2,3),(1,1),(3,0)], [(1,1),(5,3),(2,0)]]
        expected_val = [1, 3, 0, 3, 1, 0, 1, 3, 0]
        self.assertEqual(get_player2_payload(array), expected_val)

    """
        Test for player1's and player'2 payloads for a row or col
    """

    def test_get_player1_payload_row(self):
        array = [[(0,0),(-1,-2)],[(-4,-1),(1,1)]]
        expected_val = [0,-1]
        self.assertEqual(get_player1_payload_row(array, 0), expected_val)

        expected_val = [0,-2]
        self.assertNotEqual(get_player1_payload_row(array, 0), expected_val)

        array = [[(0,1),(2,3),(1,0)], [(2,3),(1,1),(3,0)], [(1,1),(5,3),(2,0)]]
        expected_val = [0, 2, 1]
        self.assertEqual(get_player1_payload_row(array, 0), expected_val)

        expected_val = [1, 5, 2]
        self.assertEqual(get_player1_payload_row(array, 2), expected_val)


    def test_get_player2_payload_col(self):
        array = [[(0,0),(-1,-3)],[(-3,-1),(1,1)]]
        expected_val = [0,-1]
        self.assertEqual(get_player2_payload_col(array, 0), expected_val)
        
        expected_val = [0,-2]
        self.assertNotEqual(get_player2_payload_col(array, 0), expected_val)

        array = [[(0,1),(2,3),(1,0)], [(2,3),(1,1),(3,0)], [(1,1),(5,3),(2,0)]]
        expected_val = [1, 3, 1]
        self.assertEqual(get_player2_payload_col(array, 0), expected_val)

        array = [[(0,1),(2,3),(1,0)], [(2,3),(1,1),(3,0)], [(1,1),(5,3),(2,0)]]
        expected_val = [0, 0, 0]
        self.assertEqual(get_player2_payload_col(array, 2), expected_val)

    """
        Test for a row or col is dominated by player1's or player's 2 other strategies, respectively
    """
    
    def test_player1_is_strongly_dominated(self):
        array = [[(-8,0),(-6,-2)],[(-4,-1),(1,1)]]
        self.assertTrue(player1_is_strongly_dominated(array, 0))
        
        array = [[(8,0),(6,-2)],[(4,-1),(1,1)]]
        self.assertFalse(player1_is_strongly_dominated(array, 0))

    def test_player2_is_strongly_dominated(self):
        array = [[(0,0),(-1,-3)],[(-3,-1),(1,1)]]
        self.assertFalse(player2_is_strongly_dominated(array, 0))
        
        array = [[(0,5),(-1,-3)],[(-3,6),(1,1)]]
        self.assertFalse(player2_is_strongly_dominated(array, 0))
        
        array = [[(0,5),(-1,10)],[(-3,6),(1,1)]]
        self.assertFalse(player2_is_strongly_dominated(array, 0))

        array = [[(0,0),(-1,20)],[(-3,0),(1,20)]]
        self.assertTrue(player2_is_strongly_dominated(array, 0))
        
    """
        Test for all
    """
                        
    def test_player2_is_strongly_dominated_all(self):
        array = [[(0,1),(2,3),(1,0)], [(2,3),(1,1),(3,0)], [(1,1),(5,3),(2,0)]]
        self.assertFalse(player2_is_strongly_dominated_all(array, 0))

        array = [[(0,1),(2,3),(1,20)], [(2,3),(1,1),(3,20)], [(1,1),(5,3),(2,20)]]
        self.assertTrue(player2_is_strongly_dominated_all(array, 0))

    def test_player1_is_strongly_dominated_all(self):
        array = [[(0,1),(2,3),(1,20)], [(2,3),(1,1),(3,20)], [(1,1),(5,3),(2,20)]]
        self.assertTrue(player1_is_strongly_dominated_all(array, 0))

        array = [[(1,4),(5,3),(6,2)],[(8,2),(9,5),(10,11)],[(7,2),(23,8),(14,32)]]
        self.assertTrue(player1_is_strongly_dominated_all(array, 0))

        array = [[(50,4),(5,3),(6,2)],[(8,2),(9,5),(10,11)],[(7,2),(23,8),(14,32)]]
        self.assertFalse(player1_is_strongly_dominated_all(array, 0))

        array = [[(4,1),(3,1),(5,1)],[(4,1),(2,1),(0,1)],[(4,1),(3,1),(4,1)]]
        self.assertFalse(player1_is_strongly_dominated_all(array, 1))    
    
    """
        Helper functions test(s)
    """
    
    def test_compare_to(self):
        self.assertEqual(compare_to(4, 1), 1)
        self.assertEqual(compare_to(1, 4), -1)
        self.assertEqual(compare_to(1, 1), 0)

    """
        Test for all with loop
    """
        
    def test_player1_is_strongly_dominated_all_loop(self):
        array = [[(5,1),(3,1),(5,1)],[(4,1),(2,1),(0,1)],[(4,1),(3,1),(4,1)]]
        self.assertTrue(player1_is_strongly_dominated_all_loop(array, 1))

        array = [[(0,1),(3,1),(5,1)],[(4,1),(2,1),(0,1)],[(4,1),(3,1),(4,1)]]
        self.assertFalse(player1_is_strongly_dominated_all_loop(array, 1))

        array = [[(0,1),(3,1),(5,1)],[(4,1),(2,1),(0,1)],[(4,1),(3,1),(4,1)]]
        self.assertFalse(player1_is_strongly_dominated_all_loop(array, 2))

        array = [[(0,1),(3,1),(5,1)],[(4,1),(2,1),(0,1)],[(-1,1),(-1,1),(-1,1)]]
        self.assertTrue(player1_is_strongly_dominated_all_loop(array, 2))

    def test_player2_is_strongly_dominated_all_loop(self):
        array = [[(4,5),(3,2),(6,0)],[(1,5),(7,2),(0,4)],[(6,5),(8,2),(9,0)]]
        self.assertTrue(player2_is_strongly_dominated_all_loop(array, 1))

        array = [[(4,0),(3,2),(6,0)],[(1,5),(7,2),(0,4)],[(6,5),(8,2),(9,0)]]
        self.assertFalse(player2_is_strongly_dominated_all_loop(array, 1))

        array = [[(4,0),(3,2),(6,0)],[(1,5),(7,2),(0,4)],[(6,5),(8,2),(9,0)]]
        self.assertFalse(player2_is_strongly_dominated_all_loop(array, 1))

        array = [[(0,1),(3,1),(5,0)],[(4,1),(2,1),(0,0)],[(4,1),(3,1),(4,0)]]
        self.assertTrue(player2_is_strongly_dominated_all_loop(array, 2))
        
unittest.main(exit = False)
