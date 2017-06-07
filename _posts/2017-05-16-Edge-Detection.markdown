---
layout: post
author: 코딩도사(hsnks100@gmail.com)
date: 2017-05-16 10:41 +0900
tags: 
comments: true
---
* table of contents
{:toc}



# 이차미분이 크로스 0 되는 쪽이 edge 
구하기 위해서 라플라시안을 적용함  
Gx 는 이미 미분한 값이니까 거기에 다시 편미분을 적용함.  

계속 적용하면 f[i, j+2] - 2f[i, j +1] + f[i,j]  

즉 f 를 x 에 대해 두번 편미분한 값은 5장에 잘 나와있다.

y 에 대해서도 똑같이 구하면 된다.  

이것을 convolution 과 같은 디자인을 적용하면 

```
[0, 1, 0; 
1, -4, 1; 
0, 1, 0] 
```

행렬과 같게 된다.

```
[0, 4, 0; 
3, -20, 3; 
0, 3, 0] 
```

이런식으로도 디자인 가능하다.

하지만 라플라시안은 노이즈까지 찾아주니까 문제다.  



# edge
edge 구하는건 1차 미분을 이용한다는게 중요함.  

sovel, priwitt 으로 대체 하기도 함.

# Subpixel Location Estimation

edge 를 만드는데 있어서 edge 가 중간에 비어있을 수 있는데, 이 비어있는 픽셀을 추정한다.

## Edge Filling Method

```
0 10 10
7 14 7
10 10 0

에
0 1 0
0 0 0
1 0 0 
을 적용하게 되면 가운데가 1 이상이 되는데 이때 edge 를 이어준다.  

```
# Seqeutial Methods 

자기들의 edge detector 가 성능이 좋다고 해야하지만 실제론 안그렇다. 그래서

다음과 같은 방법을 쓴다.

## Edge Following
빠진 edge 에 대해 추정해서 점을 넣는 것. (Ex filling edge)




## Boundary tracking





