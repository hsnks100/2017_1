---
layout: post
author: 코딩도사(hsnks100@gmail.com)
date: 2017-05-16 10:41 +0900
tags: 
comments: true
---
* table of contents
{:toc}


# Edge Detecting

![2017cv05f-01](https://user-images.githubusercontent.com/3623889/26906688-fecc3c08-4c29-11e7-8962-8e40e8ab1822.jpg)
![2017cv05f-02](https://user-images.githubusercontent.com/3623889/26906689-fef4d3ac-4c29-11e7-81bd-85aa94bbb964.jpg)
![2017cv05f-03](https://user-images.githubusercontent.com/3623889/26906691-ff081570-4c29-11e7-86d7-c4b8430ce2e4.jpg)
![2017cv05f-04](https://user-images.githubusercontent.com/3623889/26906690-ff06fa0a-4c29-11e7-8d92-6d4c033b7dda.jpg)
![2017cv05f-05](https://user-images.githubusercontent.com/3623889/26906692-ff08781c-4c29-11e7-8c49-e7c19d62cb1c.jpg)
![2017cv05f-06](https://user-images.githubusercontent.com/3623889/26906694-ff0c10c6-4c29-11e7-9da9-0e3a7d1f3203.jpg)
이것저것 용어들 정의하고 일단은 edge 는 밝기의 변화값 차이를 잡아내는 것이다.

그래서 편미분을 도입하고 수식을 유도하는데 결국은 method2 를 쓴다.

$ f[x+1, y] - f[x, y] $ 

그러면 $ G_x = [-1 1],~G_y = [1; -1] $ 으로 operator 를 정의 할 수 있다.  

![2017cv05f-07](https://user-images.githubusercontent.com/3623889/26906693-ff0aef2a-4c29-11e7-9fd9-3fd039a93e22.jpg)

# Derivative Operator

![2017cv05f-08](https://user-images.githubusercontent.com/3623889/26906695-ff1d6a06-4c29-11e7-9e27-83db327ed97c.jpg)
$$
G_x = 
\begin{matrix}
-1 & 1 \\
-1 & 1 \\ 
\end{matrix} 
$$

$$
G_y = 
\begin{matrix}
-1 & 1 \\
-1 & 1 \\ 
\end{matrix} 
$$

와 같이 합칠 수 있다.


![2017cv05f-09](https://user-images.githubusercontent.com/3623889/26906698-ff2f92f8-4c29-11e7-9583-384bb3b6dc69.jpg)


# Roberts Operator

* sobel,~prewitt 에 비해 매우 빠른 속도를 가짐
* 주변과 상관없이 경계과 확실한 에지가 추출됨
* 다른 마스크보다 크기가 작아서 돌출한 화소를 처리할 수가 없어서 잡음 해결이 안됨.

$$

G_x = 
\begin{matrix}
1 && 0
0 && -1 
\end{matrix}
\\

G_y = 
\begin{matrix}
0 && -1
1 && 0
\end{matrix}
\\
$$

위 식으로 계산 된다.


# Sobel Operator

![2017cv05f-11](https://user-images.githubusercontent.com/3623889/26906696-ff2d6f0a-4c29-11e7-8783-fbfc4a42af62.jpg)

* 에지 추출의 대표적인 operator
* 모든 방향의 에지 추출 가능
* 수직, 수평보다 대각에 민감

위 수식을 보면 현재 가운데 값에 가중치를 c 로 주는 방법이다.

보통 c = 2 로 놓는다.

convolution mask 로 나타내면

$$
G_x = 
\begin{matrix}
-1 & 0 & 1
-2 & 0 & 2
-1 & 0 & 1 
\end{matrix}
\\
G_y = 
\begin{matrix}
1 & 2 & 1
0 & 0 & 0
-1 & -2 & -1
\end{matrix}
$$

# prewitt Operator

* 소벨마스크의 c=1 버전
* 밝기 변화를 좀 둔감하게 둔 버전
* 대각보다 수평, 수직에 민감함 

$$
G_x = 
\begin{matrix}
-1 & 0 & 1
-1 & 0 & 1
-1 & 0 & 1 
\end{matrix}
\\
G_y = 
\begin{matrix}
1 & 1 & 1
0 & 0 & 0
-1 & -1 & -1
\end{matrix}
$$ 


# Second Derivative Operators

지금까지 다룬 sobel, prewitt 은 1차 미분 연산자였다.

1차 미분의 크기는 에지의 존재 여부를 알기 위해 사용된다.

2차 미분은 현재 밝은곳에서 어두운곳으로 가는지를 파악할 수 있다.

2차 미분은 윤곽선이 얇게 나옴.

단점은 서서히 변화하는 영역에 대해서는 반응을 보이지 않음.ㅁ 

![2017cv05f-17](https://user-images.githubusercontent.com/3623889/26906704-ff5938c4-4c29-11e7-9fdf-7e61169bcf1a.jpg)
![2017cv05f-18](https://user-images.githubusercontent.com/3623889/26906705-ff6c3136-4c29-11e7-9ce0-70a4869895a9.jpg) 
![2017cv05f-19](https://user-images.githubusercontent.com/3623889/26906706-ff71ff94-4c29-11e7-96f6-556b75180054.jpg)
![2017cv05f-20](https://user-images.githubusercontent.com/3623889/26906707-ff7a42f8-4c29-11e7-840f-14c3010cb198.jpg)

위 17~20 자료는 버릴게 없다.


# Laplacian Of Gaussian


![2017cv05f-21](https://user-images.githubusercontent.com/3623889/26906708-ff85092c-4c29-11e7-9165-663a53349ac6.jpg)
![2017cv05f-22](https://user-images.githubusercontent.com/3623889/26906710-ff872a2c-4c29-11e7-9643-141ca7e2f438.jpg)
![2017cv05f-23](https://user-images.githubusercontent.com/3623889/26906709-ff85e1c6-4c29-11e7-847f-8f1a3eed440a.jpg)

g 는 가우시안 함수고, 역삼각형은 라플라시안 함수다. 

convolution 형태로 만들기 위해서 라플^2 * g 로 묶으면 위와 같은 mask 가 나온다.


![2017cv05f-24](https://user-images.githubusercontent.com/3623889/26906711-ff9b17c6-4c29-11e7-8662-51e043f26871.jpg)
![2017cv05f-25](https://user-images.githubusercontent.com/3623889/26906712-ff9cd26e-4c29-11e7-908b-b85e97b1988a.jpg)


# Image Approximation


![2017cv05f-26](https://user-images.githubusercontent.com/3623889/26906713-ffa8a616-4c29-11e7-8fe5-d606c7899d7d.jpg)
![2017cv05f-27](https://user-images.githubusercontent.com/3623889/26906716-ffb775d8-4c29-11e7-9104-464ca4c8bb9f.jpg)
![2017cv05f-28](https://user-images.githubusercontent.com/3623889/26906717-ffbc4e1e-4c29-11e7-815d-b3aa7634e04d.jpg)
![2017cv05f-29](https://user-images.githubusercontent.com/3623889/26906715-ffb5a00a-4c29-11e7-9ce3-a129eb14d90b.jpg)
![2017cv05f-30](https://user-images.githubusercontent.com/3623889/26906718-ffc54834-4c29-11e7-8ab5-4ba62d7f3b09.jpg)
![2017cv05f-31](https://user-images.githubusercontent.com/3623889/26906719-ffc5cfc0-4c29-11e7-9799-4a8b2c9aa960.jpg)
![2017cv05f-32](https://user-images.githubusercontent.com/3623889/26906720-ffd2cee6-4c29-11e7-9a40-fd23a70d44b9.jpg)
![2017cv05f-33](https://user-images.githubusercontent.com/3623889/26906722-ffe2d4d0-4c29-11e7-81ae-ab1cce28cb29.jpg)
![2017cv05f-34](https://user-images.githubusercontent.com/3623889/26906721-ffe08874-4c29-11e7-9cf8-8d64487926d5.jpg)
![2017cv05f-35](https://user-images.githubusercontent.com/3623889/26906723-ffe4c4de-4c29-11e7-859f-1b1760ab6081.jpg)
![2017cv05f-36](https://user-images.githubusercontent.com/3623889/26906724-ffece880-4c29-11e7-80d2-d0306afdb129.jpg)
![2017cv05f-37](https://user-images.githubusercontent.com/3623889/26906725-fff3279a-4c29-11e7-88f0-252f45aebdb0.jpg)
![2017cv05f-38](https://user-images.githubusercontent.com/3623889/26906726-fffab5aa-4c29-11e7-94c9-45a65fa8c113.jpg)
![2017cv05f-39](https://user-images.githubusercontent.com/3623889/26906727-000ad5ca-4c2a-11e7-9ae2-966be4692e9f.jpg)
![2017cv05f-40](https://user-images.githubusercontent.com/3623889/26906728-000f6374-4c2a-11e7-979c-8613fba1a810.jpg)
![2017cv05f-41](https://user-images.githubusercontent.com/3623889/26906731-00247a8e-4c2a-11e7-8ec0-83e8e95b9936.jpg)
![2017cv05f-42](https://user-images.githubusercontent.com/3623889/26906729-001476f2-4c2a-11e7-8526-36af243131d4.jpg)
![2017cv05f-43](https://user-images.githubusercontent.com/3623889/26906730-0020097c-4c2a-11e7-9b37-93d82da0359f.jpg)
![2017cv05f-44](https://user-images.githubusercontent.com/3623889/26906732-0024f84c-4c2a-11e7-80aa-fe62dced76bf.jpg)
![2017cv05f-45](https://user-images.githubusercontent.com/3623889/26906733-00382322-4c2a-11e7-9c6b-517dcf5b0d62.jpg)
![2017cv05f-46](https://user-images.githubusercontent.com/3623889/26906734-003fafa2-4c2a-11e7-981a-c83ab7b4dc9b.jpg)
![2017cv05f-47](https://user-images.githubusercontent.com/3623889/26906735-003fdcac-4c2a-11e7-9c91-fcffd29d46fc.jpg)
![2017cv05f-48](https://user-images.githubusercontent.com/3623889/26906738-00509b0a-4c2a-11e7-8fb0-2939c5d0feae.jpg)
![2017cv05f-49](https://user-images.githubusercontent.com/3623889/26906737-005080f2-4c2a-11e7-9dec-a302c7a3e8ed.jpg)
![2017cv05f-50](https://user-images.githubusercontent.com/3623889/26906736-004fd03a-4c2a-11e7-8214-bceb093daa0c.jpg)
![2017cv05f-51](https://user-images.githubusercontent.com/3623889/26906739-00672938-4c2a-11e7-9195-46f355cf7af5.jpg)
![2017cv05f-52](https://user-images.githubusercontent.com/3623889/26906741-006c008e-4c2a-11e7-8782-fb71b4ce3dcf.jpg)
![2017cv05f-53](https://user-images.githubusercontent.com/3623889/26906740-006b97b6-4c2a-11e7-97eb-9fe54e595386.jpg)
![2017cv05f-54](https://user-images.githubusercontent.com/3623889/26906743-007bc26c-4c2a-11e7-9959-4e2953287746.jpg)
![2017cv05f-55](https://user-images.githubusercontent.com/3623889/26906744-007ccedc-4c2a-11e7-8dda-c6237911e25d.jpg)
![2017cv05f-56](https://user-images.githubusercontent.com/3623889/26906742-0079fd56-4c2a-11e7-9fb9-205655f04ec2.jpg)
![2017cv05f-57](https://user-images.githubusercontent.com/3623889/26906745-008f9c56-4c2a-11e7-83a0-9a8082140538.jpg)
![2017cv05f-58](https://user-images.githubusercontent.com/3623889/26906746-009779f8-4c2a-11e7-8adc-4359758adc5f.jpg)
![2017cv05f-59](https://user-images.githubusercontent.com/3623889/26906747-009c2dae-4c2a-11e7-9ec4-5673c4a328ee.jpg)
![2017cv05f-60](https://user-images.githubusercontent.com/3623889/26906748-00a2a9b8-4c2a-11e7-9b3a-aac00d57b2e8.jpg)

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





