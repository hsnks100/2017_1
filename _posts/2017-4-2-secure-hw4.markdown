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

   | 0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
---|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|
00 |63 7c 77 7b f2 6b 6f c5 30 01 67 2b fe d7 ab 76 
10 |ca 82 c9 7d fa 59 47 f0 ad d4 a2 af 9c a4 72 c0 
20 |b7 fd 93 26 36 3f f7 cc 34 a5 e5 f1 71 d8 31 15 
30 |04 c7 23 c3 18 96 05 9a 07 12 80 e2 eb 27 b2 75 
40 |09 83 2c 1a 1b 6e 5a a0 52 3b d6 b3 29 e3 2f 84 
50 |53 d1 00 ed 20 fc b1 5b 6a cb be 39 4a 4c 58 cf 
60 |d0 ef aa fb 43 4d 33 85 45 f9 02 7f 50 3c 9f a8 
70 |51 a3 40 8f 92 9d 38 f5 bc b6 da 21 10 ff f3 d2 
80 |cd 0c 13 ec 5f 97 44 17 c4 a7 7e 3d 64 5d 19 73 
90 |60 81 4f dc 22 2a 90 88 46 ee b8 14 de 5e 0b db 
a0 |e0 32 3a 0a 49 06 24 5c c2 d3 ac 62 91 95 e4 79 
b0 |e7 c8 37 6d 8d d5 4e a9 6c 56 f4 ea 65 7a ae 08 
c0 |ba 78 25 2e 1c a6 b4 c6 e8 dd 74 1f 4b bd 8b 8a 
d0 |70 3e b5 66 48 03 f6 0e 61 35 57 b9 86 c1 1d 9e 
e0 |e1 f8 98 11 69 d9 8e 94 9b 1e 87 e9 ce 55 28 df 
f0 |8c a1 89 0d bf e6 42 68 41 99 2d 0f b0 54 bb 16 

   |  | 0|  1|  2|  3|  4|  5 | 6 | 7 | 8 | 9 | A | B|  C | D|  E | F |
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


