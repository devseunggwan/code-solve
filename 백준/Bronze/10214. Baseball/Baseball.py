for _ in range(int(input())):
    Y, K = 0, 0
    for __ in range(9):
        y, k = map(int, input().split())
        Y += y
        K += k

    if Y > K:
        print("Yonsei")
    elif Y < K:
        print("Korea")
    else:
        print("Draw")
