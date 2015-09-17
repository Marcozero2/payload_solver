def player2_is_strongly_dominated(array, col):
    payload_compare = get_player2_payload_col(array, col)
    for i in range(len(array)):
        payload = array[i][1] #goes down a level and looks to the left of the col
        payload_p2 = payload[1]
        if compare_to(payload_compare[i], payload_p2) == -1:
            return True
    return False

def get_player2_payload(array):
    payload_array = []
    for i in range(len(array)):
        for j in range(len(array)):
            payload = array[i][j]
            payload_p2 = payload[1]
            payload_array.append(payload_p2)
    return payload_array

def get_player2_payload_col(array, col):
    payload_array = []
    for i in range(len(array)):
        payload = array[i][col]
        payload_array.append(payload[1])
    return payload_array

def get_player1_payload(array):
    payload_array = []
    for i in range(len(array)):
        for j in range(len(array)):
            payload = array[i][j]
            payload_p1 = payload[0]
            payload_array.append(payload_p1)
    return payload_array

def get_player1_payload_row(array, row):
    payload_array = []
    for i in range(len(array)):
        payload = array[row][i]
        payload_p1 = payload[0]
        payload_array.append(payload_p1)
    return payload_array

def player1_is_strongly_dominated(array, row):
    payload_compare = get_player1_payload_row(array, row)
    payload_p1 = get_player1_payload_row(array, 1)
    for i in range(len(payload_compare)):
        if compare_to(payload_compare[i], payload_p1[i]) == -1:
            return True
    return False

def compare_to(a, b):
    if a > b:
        return 1
    elif a < b:
        return -1
    return 0
