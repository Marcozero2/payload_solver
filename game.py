"""
    Author: George Acevedo
    Date: 17 September 2015
"""
def player2_is_strongly_dominated(array, col):
    """
        Compares the col with each col in the array.
        Returns True if the col is dominated by another strategy.
        Returns False otherwise.
    """
    payload_compare = get_player2_payload_col(array, col)
    payload_p2 = get_player2_payload_col(array, col+1)
    if compare_payload(payload_compare, payload_p2) == True:
        return True
    return False

def player1_is_strongly_dominated(array, row):
    """
        Compares the row with each row in the array.
        Returns True if the row is dominated by another strategy.
        Returns False otherwise.
    """
    payload_compare = get_player1_payload_row(array, row)
    payload_p1 = get_player1_payload_row(array, row+1)
    if compare_payload(payload_compare, payload_p1) == True:
        return True
    return False

def get_player2_payload_col(array, col):
    """
        Returns the payload for p2 for a col.
    """
    payload_array = []
    for i in range(len(array)):
        payload = array[i][col]
        payload_p2 = payload[1]
        payload_array.append(payload_p2)
    return payload_array

def get_player1_payload_row(array, row):
    """
        Returns the payload for p1 for a row.
    """
    payload_array = []
    for i in range(len(array)):
        payload = array[row][i]
        payload_p1 = payload[0]
        payload_array.append(payload_p1)
    return payload_array

def get_player_payload(array):
    """
        Returns all of the payloads in a array for p2.
    """
    payload_array = []
    for i in range(len(array)):
        for j in range(len(array)):
            payload = array[i][j]
            payload_p2 = payload[1]
            payload_array.append(payload_p2)
    return payload_array

def get_player1_payload(array):
    """
        Returns all of the payloads in a array for p1.
    """
    payload_array = []
    for i in range(len(array)):
        for j in range(len(array)):
            payload = array[i][j]
            payload_p1 = payload[0]
            payload_array.append(payload_p1)
    return payload_array

def compare_payload(pay1, pay2):
    """
        Returns True if all of the values in the first array.
        that correspond to the values in the second array is greater.
        Returns False otherwise.
    """
    for i in range(len(pay1)):
        if compare_to(pay1[i], pay2[i]) == -1:
            return True
    return False

def compare_to(a, b):
    """
        Returns 1 if the first parameter is greater than the second parameter.
        Returns -1 if the first parameter is less than the second parameter.
        Returns 0 the parameters are equal.
    """
    if a > b:
        return 1
    elif a < b:
        return -1
    return 0
