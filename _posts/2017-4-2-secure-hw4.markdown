---
layout: post
tags: 
title2: 컴퓨터보안 AES Contruction S-Box
comments: true
category: secure
---


# AES 
[기본 구조] AES(Advanced Encryption Standard)의 기본 구조  

![](../images/comsecure/hw4_1.png)  

위와 같은 구조로 생겼으며 plaintext 가 10round 를 돌면 cipher text 가 나오는 구조다.

여기서 알아볼 것은 substitue bytes 에 대해서다.





# S-BOX

   |  | 0| 1|  2|  3|  4|  5 | 6 | 7 | 8 | 9 | A | B | C | D | E|  F
---|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|
00 |63| 7C| 77| 7B| F2| 6B| 6F| C5| 30| 01| 67| 2B| FE| D7| AB| 76 
10 |CA| 82| C9| 7D| FA| 59| 47| F0| AD| D4| A2| AF| 9C| A4| 72| C0 
20 |B7| FD| 93| 26| 36| 3F| F7| CC| 34| A5| E5| F1| 71| D8| 31| 15 
30 |04| C7| 23| C3| 18| 96| 05| 9A| 07| 12| 80| E2| EB| 27| B2| 75 
40 |09| 83| 2C| 1A| 1B| 6E| 5A| A0| 52| 3B| D6| B3| 29| E3| 2F| 84 
50 |53| D1| 00| ED| 20| FC| B1| 5B| 6A| CB| BE| 39| 4A| 4C| 58| CF 
60 |D0| EF| AA| FB| 43| 4D| 33| 85| 45| F9| 02| 7F| 50| 3C| 9F| A8 
70 |51| A3| 40| 8F| 92| 9D| 38| F5| BC| B6| DA| 21| 10| FF| F3| D2 
80 |CD| 0C| 13| EC| 5F| 97| 44| 17| C4| A7| 7E| 3D| 64| 5D| 19| 73 
90 |60| 81| 4F| DC| 22| 2A| 90| 88| 46| EE| B8| 14| DE| 5E| 0B| DB 
A0 |E0| 32| 3A| 0A| 49| 06| 24| 5C| C2| D3| AC| 62| 91| 95| E4| 79 
B0 |E7| C8| 37| 6D| 8D| D5| 4E| A9| 6C| 56| F4| EA| 65| 7A| AE| 08 
C0 |BA| 78| 25| 2E| 1C| A6| B4| C6| E8| DD| 74| 1F| 4B| BD| 8B| 8A 
D0 |70| 3E| B5| 66| 48| 03| F6| 0E| 61| 35| 57| B9| 86| C1| 1D| 9E 
E0 |E1| F8| 98| 11| 69| D9| 8E| 94| 9B| 1E| 87| E9| CE| 55| 28| DF 
F0 |8C| A1| 89| 0D| BF| E6| 42| 68| 41| 99| 2D| 0F| B0| 54| BB| 16 


S-Box 는 위와 같은 표인데 어떠한 byte 1개가 sbox 를 통과하면 다른 byte 가 된다.
예를 들면 0xCD 가 S-Box 를 통과하면 0xBD 이 된다. 이 표는 임의로 만들어진것이 아니고 계산에 의해 만들어 질 수 있다. 

그 계산에 대해서 알아본다.

# 기본연산
## Subtract / Addition

GF(2^n) 꼴은 Galois Field 라고 하는데 특별히 2^n 공간은 Binary Field 라고 부른다.

기본적으로 연산에 대한 개념은 Binary Field 상에서 이뤄진다.

Binary Field 에서 x 에 대한 다항식에서 덧셈 뺄셈 계산은 xor 연산으로 하는게 가능하다.

예를 들면
```
 x^3 + x^2 
+      x^2 + 1
---------------
x^3 + 1 
```


비트로 표현 하면 

```
    1100
xor 0101
---------
    1001
```

뺄셈도 덧셈과 같이 xor 다.


## Multification / Division

### Multification
Binary Field 상에서 Multification 과 Division 을 정의한다.

예를 들어, (x^3 + x^2 + 1)*(x^2 + 1) 를 구해보면

```
 x^5 + x^4 +       x^2
+          + x^3 + x^2 + 1
---------------------------
x^5 + x^4 + x^3 + 0 + 1
```

여기서 덧셈은 위에서 정의한 xor 형식으로 적용한다.

또한 이것을 비트로 나타내면

```
(1101)*(0101) 으로 표현 가능한데,

 11010
+00111
-------
 11101 

```

위와 같이 된다. 

### Division

나눗셈도 비슷하게 정의 할 수 있다.

(x^5 + x^3 + 1)/(x^2 + 1) 를 구해본다면

```
        x^3 + x + 1
x^2+1 | x^5 +      x^2 +    1
      | x^5 + x^3        
      ---------------------
          x^3 + x^2 +     1
          x^3       + x
          -----------------
                x^2 + x + 1
                x^2     + 1 
              -------------
                        x



```      


반복하여 비트로 본다면 

```
      1011    
101 | 100101
    | 101000
    --------
        1101
        1010
        ----
         111
         101
         ---
          10

```
몫 Q = 1011, 나머지 m = 10

# AES 의 Galois Field(=finite field)
AES 의 S-Box 에서는 GF(2^8) with x^8+x^4+x^3 + x + 1 에서의 inverse 를 구한 뒤 별도의 affine 변환을 통해 값을 구한다.
이를 위해 확장된 유클리드 알고리즘을 통해 inverse 를 구한다.

# Inverse 와 EGCD

확장유클리드 알고리즘에서 m = x^8 + x^4 + x^3 + x + 1, b = x^7 + x^6 + x^3 + x^2 + 1

라고 놓으면 표현하기가 번거로우니 비트 표현법을 쓰겠다.

m = 10001101, b = 11001101



```
표는 

A1 A2 A3
B1 B2 B3

구조로 진행된다.

1 0 100011011
0 1 11001101
Q = 11
----------
0 1 11001101
1 11 1001100
Q = 11
----------
1 11 1001100
11 100 11001
Q = 111
----------
11 100 11001
1000 11111 11
Q = 1000
----------
1000 11111 11
1000011 11111100 1 
```

여기서 Q 는 위에서 정의된 연산을 따르고 곱하기 또한 위에서 정의된 연산을 따르면서 진행한다.

즉, 0xCD 에 대한 inverse 는 1111 1100 => 0xFC 


# Affine

![](../images/comsecure/hw4_affine.png)



0xFC 에 대해 위 Affine Transform 을 적용하면 

--|--|--|--|--|--|--|--|
x7|x6|x5|x4|x3|x2|x1|x0
1|1|1|1|1|1|0|0

0xBD 가 된다.  


# 결과
```

m = 0b100011011
for x in range(0, 0xF+1):
    for y in range(0, 0xF+1):
        num = x * 16 + y
        res = getInv(m, num)
        print "{:02X}".format(affine(res)),
    print ""
의 코드 실행은 다음과 같다.

└─[$] sage sbox_aes.py                                   [17:58:55]
63 7C 77 7B F2 6B 6F C5 30 01 67 2B FE D7 AB 76 
CA 82 C9 7D FA 59 47 F0 AD D4 A2 AF 9C A4 72 C0 
B7 FD 93 26 36 3F F7 CC 34 A5 E5 F1 71 D8 31 15 
04 C7 23 C3 18 96 05 9A 07 12 80 E2 EB 27 B2 75 
09 83 2C 1A 1B 6E 5A A0 52 3B D6 B3 29 E3 2F 84 
53 D1 00 ED 20 FC B1 5B 6A CB BE 39 4A 4C 58 CF 
D0 EF AA FB 43 4D 33 85 45 F9 02 7F 50 3C 9F A8 
51 A3 40 8F 92 9D 38 F5 BC B6 DA 21 10 FF F3 D2 
CD 0C 13 EC 5F 97 44 17 C4 A7 7E 3D 64 5D 19 73 
60 81 4F DC 22 2A 90 88 46 EE B8 14 DE 5E 0B DB 
E0 32 3A 0A 49 06 24 5C C2 D3 AC 62 91 95 E4 79 
E7 C8 37 6D 8D D5 4E A9 6C 56 F4 EA 65 7A AE 08 
BA 78 25 2E 1C A6 B4 C6 E8 DD 74 1F 4B BD 8B 8A 
70 3E B5 66 48 03 F6 0E 61 35 57 B9 86 C1 1D 9E 
E1 F8 98 11 69 D9 8E 94 9B 1E 87 E9 CE 55 28 DF 
8C A1 89 0D BF E6 42 68 41 99 2D 0F B0 54 BB 16 
``` 

# 코드

전체 코드는 아래에 첨부한다.

``` python

import sys
from sage.all import *
import math

def getMSB(b): 
    return int(math.log(b, 2))

def div(a, b):
    Q = 0
    tempA = a 
    while True:
        tempB = b
        cnt = 0
        # print bin(tempA), bin(tempB)
        # print getMSB(tempA), getMSB(tempB)
        if getMSB(tempA) < getMSB(tempB):
            break
        while True:
            if getMSB(tempA) == getMSB(tempB):
                break
            tempB <<= 1
            cnt += 1

        tempA = tempB ^ tempA
        Q  += 2 ** cnt
        if cnt == 0:
            break





    return Q

def mult(a, b):
    tot = 0
    for (i, x) in enumerate(bin(b)[:1:-1]):
        g = int(x) 
        if g == 1: 
            tot ^= (a << i)
    return tot




def getInv(m, b):
    A1 = 1
    A2 = 0
    A3 = m

    B1 = 0
    B2 = 1
    B3 = b
    if B3 == 1:
        return B2
    elif B3 == 0:
        return 0

    # print "{} {} {}".format(bin(A1), bin(A2), bin(A3))
    # print "{} {} {}".format(bin(B1), bin(B2), bin(B3))
    # print "----------"
    i = 0
    while True: 
        i += 1
        Q = div(A3, B3)


        T1 = A1 ^ mult(B1 , Q)
        T2 = A2 ^ mult(B2 , Q)
        T3 = A3 ^ mult(B3 , Q)

        # print "{} {} {}".format(bin(A1), bin(A2), bin(A3))
        # print "{} {} {}".format(bin(B1), bin(B2), bin(B3))
        # print "Q : ", bin(Q)
        (A1, A2, A3) = (B1, B2, B3)
        (B1, B2, B3) = (T1, T2, T3)
        # print "-----"
        if B3 == 1:

            # print "{} {} {}".format(bin(A1), bin(A2), bin(A3))
            # print "{} {} {}".format(bin(B1), bin(B2), bin(B3))
            # print "Q : ", bin(Q)
            return B2
        elif B3 == 0:
            return 0

        # if i > 10:
            # break


def bin2vector(b):
    v = []
    for i, x in enumerate(bin(b)[:1:-1]):
        v.append(int(x))

    while len(v) != 8:
        v.append(0)

    return vector(v)


def affine(inv):
    vectorInv = bin2vector(inv).row().transpose()
    c = vector([1, 1, 0, 0, 0, 1, 1, 0]).row().transpose()
    A = Matrix([[1, 0, 0, 0, 1, 1, 1, 1],
            [1, 1, 0, 0, 0, 1, 1, 1],
            [1, 1, 1, 0, 0, 0, 1, 1],
            [1, 1, 1, 1, 0, 0, 0, 1],
            [1, 1, 1, 1, 1, 0, 0, 0],
            [0, 1, 1, 1, 1, 1, 0, 0],
            [0, 0, 1, 1, 1, 1, 1, 0],
            [0, 0, 0, 1, 1, 1, 1, 1]]) 

    result = A * vectorInv + c 
    acc = 0
    for (i, x) in enumerate(result):
        acc += (x[0] % 2) * (2 ** i)


    return acc




m = 0b100011011
for x in range(0, 0xF+1):
    for y in range(0, 0xF+1):
        num = x * 16 + y
        res = getInv(m, num)
        print "{:02X}".format(affine(res)),
    print ""



```


