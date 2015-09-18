def player2_is_strongly_dominated(array, col):
    payload_compare = get_player2_payload_col(array, col)
    payload_p2 = get_player2_payload_col(array, col+1)
    if compare_payload(payload_compare, payload_p2) == True:
        return True
    return False

def player1_is_strongly_dominated(array, row):
    payload_compare = get_player1_payload_row(array, row)
    payload_p1 = get_player1_payload_row(array, row+1)
    if compare_payload(payload_compare, payload_p1) == True:
        return True
    return False

def get_player2_payload_col(array, col):
    payload_array = []
    for i in range(len(array)):
        payload = array[i][col]
        payload_p2 = payload[1]
        payload_array.append(payload_p2)
    return payload_array

def get_player1_payload_row(array, row):
    payload_array = []
    for i in range(len(array)):
        payload = array[row][i]
        payload_p1 = payload[0]
        payload_array.append(payload_p1)
    return payload_array

def get_player2_payload(array):
    payload_array = []
    for i in range(len(array)):
        for j in range(len(array)):
            payload = array[i][j]
            payload_p2 = payload[1]
            payload_array.append(payload_p2)
    return payload_array

def get_player1_payload(array):
    payload_array = []
    for i in range(len(array)):
        for j in range(len(array)):
            payload = array[i][j]
            payload_p1 = payload[0]
            payload_array.append(payload_p1)
    return payload_array

def compare_payload(pay1, pay2):
    for i in range(len(pay1)):
        if compare_to(pay1[i], pay2[i]) == -1:
            return True
    return False

def compare_to(a, b):
    if a > b:
        return 1
    elif a < b:
        return -1
    return 0
