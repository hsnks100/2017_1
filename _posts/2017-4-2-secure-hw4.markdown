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

   | 0|  1|  2|  3|  4|  5 | 6 | 7 | 8 | 9 | A | B|  C | D|  E | F
---|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|
00 |52| 09| 6A| D5| 30| 36| A5 | 38| BF| 40 |A3| 9E| 81| F3| D7| FB 
10 |7C| E3| 39| 82| 9B| 2F| FF |87 |34| 8E| 43| 44| C4| DE| E9| CB 
20 |54| 7B| 94| 32| A6| C2| 23 |3D |EE| 4C| 95| 0B| 42| FA| C3| 4E 
30 |08| 2E| A1| 66| 28| D9| 24 |B2 |76| 5B| A2| 49| 6D| 8B| D1| 25 
40 |72| F8| F6| 64| 86| 68| 98 |16 |D4| A4| 5C| CC| 5D| 65| B6| 92 
50 |6C| 70| 48| 50| FD| ED| B9 |DA |5E| 15| 46| 57| A7| 8D| 9D| 84 
60 |90| D8| AB| 00| 8C| BC| D3 |0A |F7| E4| 58| 05| B8| B3| 45| 06 
70 |D0| 2C| 1E| 8F| CA| 3F| 0F |02 |C1| AF| BD| 03| 01| 13| 8A| 6B 
80 |3A| 91| 11| 41| 4F| 67| DC |EA |97| F2| CF| CE| F0| B4| E6| 73 
90 |96| AC| 74| 22| E7| AD| 35 |85 |E2| F9| 37| E8| 1C| 75| DF| 6E 
A0 |47| F1| 1A| 71| 1D| 29| C5 |89 |6F| B7| 62| 0E| AA| 18| BE| 1B 
B0 |FC| 56| 3E| 4B| C6| D2| 79 |20 |9A| DB| C0| FE| 78| CD| 5A| F4 
C0 |1F| DD| A8| 33| 88| 07| C7 |31 |B1| 12| 10| 59| 27| 80| EC| 5F 
D0 |60| 51| 7F| A9| 19| B5| 4A |0D |2D| E5| 7A| 9F| 93| C9| 9C| EF 
E0 |A0| E0| 3B| 4D| AE| 2A| F5 |B0 |C8| EB| BB| 3C| 83| 53| 99| 61 
F0 |17| 2B| 04| 7E| BA| 77| D6 |26 |E1| 69| 14| 63| 55| 21| 0C| 7D 

S-Box 는 위와 같은 표인데 어떠한 byte 1개가 sbox 를 통과하면 다른 byte 가 된다.
예를 들면 0xCD 가 S-Box 를 통과하면 0x80 이 된다. 이 표는 임의로 만들어진것이 아니고 계산에 의해 만들어 질 수 있다. 

그 계산에 대해서 알아본다.

# 기본연산
## Subtract / Addition
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



# Galois Field(=finite field)
Binary Field

# Inverse 와 EGCD

# Affine

# 결과

# 코드


