---
layout: post
title: "DynamicVision"
author: 코딩도사(hsnks100@gmail.com)
date: 2017-05-30 10:42 +0900
tags: 
comments: true
category: imageprocessing
---
* table of contents
{:toc}


# Dynamic Vision

![2017cv14nn2-02](https://user-images.githubusercontent.com/3623889/26906790-4c802dba-4c2a-11e7-8e79-7902e002023f.jpg)
# 용어

SCSO : 정지된 카메라 정지된 객체  
SCMO : 정지 카, 정지 객  
MCSO : 움직 카, 정지 객  
MCMO : 움직, 움직  

여러 프레임이 있을 때 물체를 탐지한다.


# Change Detection




## Difference Pictures


![2017cv14nn2-05](https://user-images.githubusercontent.com/3623889/26906795-4c9a92cc-4c2a-11e7-975f-e1cd9a5307c7.jpg)


차이의 영상을 만든다.

두 프레임의값을 빼고 절대값 붙이고, 절대값이 $$\gt\tau$$ 라면 1 로 세팅한다.  

마지막 1,0 프레임에서 어떻게 30 을 뽑아내지??

## Robust Change Detection

![2017cv14nn2-08](https://user-images.githubusercontent.com/3623889/26906796-4cadc05e-4c2a-11e7-84ec-54b6ea46ceb6.jpg)
![2017cv14nn2-09](https://user-images.githubusercontent.com/3623889/26906797-4caeee16-4c2a-11e7-8ad2-6faa27a27d10.jpg) 
두개의 영상이 있다고 생각한다.
![2017cv14nn2-10](https://user-images.githubusercontent.com/3623889/26906800-4cc60be6-4c2a-11e7-830e-ced2e0e493bc.jpg) 
이거 시험은 안내는데 방법은 알아놔라

빨간건 UFO 임. 탐지하자.  

위 식은 계산은 틀렸지만 방법의 예시임.  


$$\lambda$$ 는 유사도  

1에서 멀어질 수록 변화가 일어난 것임.  
$$\lambda~\gt~\tau$$ 이면 변화가 일어난 것.  




## 중첩 차영상
![2017cv14nn2 1 -11](https://cloud.githubusercontent.com/assets/3623889/26661019/a45ec556-46b6-11e7-9479-7ddc23632501.jpg)


수식을 보면 항상 1 과의 관계의 차영상

레퍼런스 프레임 = 첫프레임

중첩은

(1,2) (1, 3) (1, 4) ( 1, 5) ...  


$$DP_{1k}$$ 1 기준이라는ㄱ 중요함.  

![2017cv14nn2-12](https://user-images.githubusercontent.com/3623889/26906801-4cc6b2ee-4c2a-11e7-9ead-2a3a173c38a1.jpg)
그림을 보면 오브젝트의 모양과 이동 경로를 알 수 있음.

흰->검








# Segmentation Using Motion

## Stationary Camera 
정지된 카메라에서 인식


![2017cv14nn2 1 -19](https://cloud.githubusercontent.com/assets/3623889/26661023/a488284c-46b6-11e7-8b4b-461f6fc77935.jpg)
차영상에서 절대값 안붙인게 어느 부분에서 양수도 나오고 음수도 나온다.

$$\gt T$$ 도 가능하고 $$\lt T$$ 인 경우에도 되게끔 설정이 가능하다.
![2017cv14nn2 1 -20](https://cloud.githubusercontent.com/assets/3623889/26661025/a48c7e74-46b6-11e7-9a09-459b4b4d217d.jpg)

결과 예시들

NADP 는 오른쪽 끝끼리 이으면 운동 방향을 알 수 있다.






# Motion Correspondence

## 모라벡 Interest Points
![2017cv14nn2 1 -26](https://cloud.githubusercontent.com/assets/3623889/26661029/a4b93dc4-46b6-11e7-9bca-2b643e2f63b1.jpg)
![2017cv14nn2 1 -27](https://cloud.githubusercontent.com/assets/3623889/26661028/a4b78894-46b6-11e7-92be-61dbf929a70c.jpg)

경우의수를 따져서 가장 최소의 거리가 되는 것이 매칭되는 것임.

# Image Flow

Image Flow 는 속도장이다. 

## Motion Field And Optical Field
![2017cv14nn2 1 -31](https://cloud.githubusercontent.com/assets/3623889/26661035/a4e2ef02-46b6-11e7-95d2-f230a1854076.jpg)

운동장은 오른쪽이지망 밝기 기반이니까 업

cube 오른쪽 그림은 화살표다.


![2017cv14nn2 1 -32](https://cloud.githubusercontent.com/assets/3623889/26661036/a4e3898a-46b6-11e7-8316-83d4cf992ced.jpg)
플로우를 구하기 위해서 어떤 가정을 한다. 

속도, 가속, 비슷한 방법으로 모든게 움직인다.(고체)

## Computing Image Flow
크게 두가지 개념으로 한다.

* Feature-based methods 
* Gradient-based methods


Feature-based methods 는 쉽지 않다. 너무 sementic 적이다.

그래서 Gradient-based methods 설명을 한다.

## 시험
![2017cv14nn2 1 -34](https://cloud.githubusercontent.com/assets/3623889/26661038/a50ba12c-46b6-11e7-81c3-dcc1c9d33d4f.jpg) 

특징 기반은 앞에서 했음. 영상 프레임에서 코너점 찾고,,.. 에지 찾는다 등등 

특징 정보를 연결했다. 매칭 시킨다. 그 사이에서 나오는 차이값을 계산함.

두개의 프레임에서 어떤 f(x, y) 을 생각한다. 

$
E = f(x, y, t)\\
E = f(x, y, t + 1) 
$

짧은 시간에서 $ {dE {over} dt} = 0 $ 이기 때문에 밑의 식을 쓴다. 


![2017cv14nn2-34](https://user-images.githubusercontent.com/3623889/26906822-4d7de2de-4c2a-11e7-88d1-25752c331f63.jpg)

## 시험 :  14.1 를 유도해보자.
E 를 전 미분하면 14.1 식이 나온다. 아래 보충설명 ㄱ ㄱ 

우리는 속도장을 구하는거니까 velocity vector(u, v) 를 구해야 한다. 식이 하나라서 풀 수가 없음.



## 편미분과 전미분 차이 (시험 가능성 있음)
![2017cv14nn2-35](https://user-images.githubusercontent.com/3623889/26906823-4d7edd7e-4c2a-11e7-86f1-f0d80816831c.jpg)

편미분은 나머지 변수를 상수로 보고 계산한다.  

## 고차 편미분과 전미분
![2017cv14nn2-36](https://user-images.githubusercontent.com/3623889/26906825-4d90efc8-4c2a-11e7-88c2-1faea7ccc5c8.jpg)

그냥 두번 미분하는거임. 딴거 없음 ㅇㅇ

전미분은 그냥 모든것을 변수로 보고 $ df / dx $ 를 붙여준다.






위에서 언급한 u, v 에 대해서  설명을 좀 더 하자면
![2017cv14nn2-37](https://user-images.githubusercontent.com/3623889/26906826-4d91f030-4c2a-11e7-82dd-4987f35f3f33.jpg)

식은 하난데 식은 하나다.

빨간 직선위의 점중에 하나다.

그래서 14.1 를 다시 쓰면 

Ex 는 x 방향의 밝기의 변화값

Uv 는 운동벡터

Et 시간에 대한 밝기의 변화값


## aperture problem
![2017cv14nn2-38](https://user-images.githubusercontent.com/3623889/26906827-4d995514-4c2a-11e7-9f0a-ae19af65e1aa.jpg)
이런것을 aperture problem 이라고 한다.

동그란 구멍으로 뭘 들여다 보고 있다고 한다.

여기서 사각형이 그 구멍에서 움직였다면 그 구멍에서 코너가 포함됐으면 운동 방향 알지만

코너가 드러나지 않았으면 정보가 없다. 어디로 갔는지 알 수 없다. 

그럼 우야노?? 반복 계산법으로 풀어봄

## 테일러 시리즈

![2017cv14nn2-39](https://user-images.githubusercontent.com/3623889/26906829-4da90072-4c2a-11e7-9fd8-a38d6c87fa7a.jpg)

여기서 나온 식은 14.1 과 같은 표현임. 근데 왜 쓴거야??






![2017cv14nn2-40](https://user-images.githubusercontent.com/3623889/26906828-4da57010-4c2a-11e7-88bf-f381287ad9d3.jpg)
![2017cv14nn2-41](https://user-images.githubusercontent.com/3623889/26906830-4dac1802-4c2a-11e7-8959-a5431173ded0.jpg)

## 완화 계산 광자 플로우... 시험에 안나옴

![2017cv14nn2-42](https://user-images.githubusercontent.com/3623889/26906831-4db9df28-4c2a-11e7-8fec-f1d1852acd02.jpg)
이미지 두개로 하는 알고리즘


![2017cv14nn2-43](https://user-images.githubusercontent.com/3623889/26906832-4dbac424-4c2a-11e7-9ee9-209d3dcf585d.jpg)

영상이 여러개 있을 때 쓰는 알고리즘
![2017cv14nn2-44](https://user-images.githubusercontent.com/3623889/26906833-4dc1d02a-4c2a-11e7-8237-209b350e458b.jpg)

## 결과
![2017cv14nn2-49](https://user-images.githubusercontent.com/3623889/26906837-4de26d1c-4c2a-11e7-8c7c-726dae095017.jpg)

광류를 구한 결과임.


# 광류에서의 정보

![2017cv14nn2-50](https://user-images.githubusercontent.com/3623889/26906839-4deaf522-4c2a-11e7-80e6-699c8a83d31c.jpg)

FOE : 그림에서의 점들을 FOE 라고 한다. 가까워질 때....
FOC : 멀어질 때....




# Tracking

![2017cv14nn2-60](https://user-images.githubusercontent.com/3623889/26906851-4e393e62-4c2a-11e7-8282-e2c4cc630caf.jpg)

흥미점을 연결해서 움직였다. 경로 일관성 구하는거.



## 응용 사례
![2017cv14nn2-61](https://user-images.githubusercontent.com/3623889/26906850-4e35f5ea-4c2a-11e7-80f2-cc5de6a25c7c.jpg) 
![2017cv14nn2-62](https://user-images.githubusercontent.com/3623889/26906852-4e447444-4c2a-11e7-8bdc-2eeadf043d9e.jpg)

뭔가 놓고 갔다. 그러면 의심.


![2017cv14nn2-63](https://user-images.githubusercontent.com/3623889/26906853-4e54dee2-4c2a-11e7-81b7-0f9bb1f363c4.jpg)

## Derivation Function for Path Coherence

시험 냈다고 함.
![2017cv14nn2-64](https://user-images.githubusercontent.com/3623889/26906855-4e5c9f24-4c2a-11e7-8874-f8d57442ef13.jpg)

o -> 세모 -> 네모

어떻게 움직인게 가장 좋은 궤적이냐??

항상 function 값 양수다, 방향의 편차가 제한이 있다.

속도가 일정하게 증가한다고 본다. 정규화 값의 범위를 0~0.1 사이로 해야한다.

t1 의 궤적은 
$ T_1 = P_1^1,P_1^2, P_1^3 $





![2017cv14nn2-65](https://user-images.githubusercontent.com/3623889/26906854-4e5c6004-4c2a-11e7-96a8-9da2e234175f.jpg)
동글-세모 벡터가 있을거다. 두점씩 이어가는것은 벡터로 나타낸다.

경로에서의 편차는 

$ d_i^k = \phi(...) $


D 가 최소값이 되는 경로의 지합

$ d_i $ 는 전체 점 개수보다 하나 작음


![2017cv14nn2-66](https://user-images.githubusercontent.com/3623889/26906856-4e5d75a2-4c2a-11e7-87e1-82899961c27e.jpg)

$ \phi $ 의 정체... 14.81 

꺾이는 값이 변화가 없으면 0 이 나오게 디자인 됨.

$ w_1, w_2 $ 는 각각 방향, 속도의 가중치

$ w_1 = 0.5, w_2 = 0.5 $

진짜 풀면 14.82 로 나옴

밑에꺼는 벡터의 크기, 위는 벡터

첫항을 방향 일관성

둘째항은 속도 일관성

$ weight = w_1 + w_2 = 1 $




![2017cv14nn2-67](https://user-images.githubusercontent.com/3623889/26906858-4e7103b0-4c2a-11e7-8b2a-771306877219.jpg)

## example
![2017cv14nn2-68](https://user-images.githubusercontent.com/3623889/26906857-4e6e214a-4c2a-11e7-8a47-91b8e5ed2041.jpg)


![2017cv14nn2-69](https://user-images.githubusercontent.com/3623889/26906859-4e7aeb8c-4c2a-11e7-8098-4eb35ef1f58a.jpg)

![2017cv14nn2-70](https://user-images.githubusercontent.com/3623889/26906860-4e85b134-4c2a-11e7-8c22-7bcad590176f.jpg)
![2017cv14nn2-71](https://user-images.githubusercontent.com/3623889/26906862-4e8676fa-4c2a-11e7-9070-e0818aa6ebac.jpg)
보니까 $ P_1P_2B $ 로 가는게 맞네!! ^^
![2017cv14nn2-72](https://user-images.githubusercontent.com/3623889/26906861-4e8620e2-4c2a-11e7-903d-7ee10b27ca82.jpg)
![2017cv14nn2-73](https://user-images.githubusercontent.com/3623889/26906864-4e99717e-4c2a-11e7-8d6e-8afe6590cf97.jpg)
![2017cv14nn2-74](https://user-images.githubusercontent.com/3623889/26906863-4e957286-4c2a-11e7-8aed-578551e259df.jpg)
![2017cv14nn2-75](https://user-images.githubusercontent.com/3623889/26906865-4ea22512-4c2a-11e7-9145-88a20de48028.jpg)
![2017cv14nn2-76](https://user-images.githubusercontent.com/3623889/26906866-4ead7cc8-4c2a-11e7-86d9-861d90e901ca.jpg)




