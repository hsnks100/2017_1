---
layout: post
tags: 
title2: 컴퓨터보안 AES Contruction S-Box
comments: true
---


# AES 
[기본 구조] AES(Advanced Encryption Standard)의 기본 구조  

![](../images/comsecure/hw4_1png)  

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












# Galois Field(=finite field)
Binary Field

# Inverse 와 EGCD

# Affine

# 결과

# 코드


