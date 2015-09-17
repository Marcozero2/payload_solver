def player2_is_strongly_dominated(array, col):
    payload_compare = get_player2_payload_col(array, col)
    for i in range(len(array)):
        payload = array[i][1] #goes down a level and looks to the left of the col
        payload_p2 = payload[1]
        if compare_to(payload_compare[i], payload_p2) == -1:
            return False
    return True

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

def compare_to(a, b):
    if a > b:
        return 1
    elif a < b:
        return -1
    return 0
