---
layout: post
title: "DynamicVision"
author: 코딩도사(hsnks100@gmail.com)
date: 2017-05-30 10:42 +0900
tags: 
comments: true
---
* table of contents
{:toc}

# 개요
고체를 가정.



# 어떤 기능을 가져야 ?

변화를 탐지  
객체의 구조를 회복  
카메라와 객체 사이의 관계  


# 용어

SCSO : 정지된 카메라 정지된 객체  
SCMO : 정지 카, 정지 객  
MCSO : 움직 카, 정지 객  
MCMO : 움직, 움직  

# 인풋

$$F(x, y, t)$$ 이 들어옴. 연속된 영상이 들어온다. 시간 t 일 수도 있고, t 번째 프레임이라는 걸로도 볼 수 있음.  

거의 t 번째 프레임 위주로 씀.  



# Change Detection
변화를 체크...  
프레임의 변화를 모아서... 탐지함. 그 단위가 pixel, edge, 영역, 등으로 변화 탐지하는 단위를 조절할 수 있음.  




# Difference Pictures


![image](https://cloud.githubusercontent.com/assets/3623889/26565498/bf4f020e-4526-11e7-9b04-2ec78b01954e.png)


차이의 영상을 만든다.

두 프레임의값을 빼고 절대값 붙이고, 절대값이 $$\gt\tau$$ 라면 1 로 세팅한다.  

마지막 1,0 프레임에서 어떻게 30 을 뽑아내지??


![image](https://cloud.githubusercontent.com/assets/3623889/26565585/576994be-4527-11e7-9c84-ac9119c02f5f.png)

모션과 조명의 변화에서 위 방법을 적용한 모습.  

곰인형의 가슴털이 많이 나옴. 그럴 때 size filter 를 쓴다.


# Size Filter
노이즈 제거용으로 쓰면 된다.   
천천히 움직이면 쓰기가 어렵다. 하지만 천천히 움직이는것들을 지워버릴 가능성이 있음.  




# Robust Change Detection

![image](https://cloud.githubusercontent.com/assets/3623889/26565541/07cbf744-4527-11e7-99b1-c60efe793ae2.png)
통계적인 방법  

각 3 by 3 에 대해서 평균값, 분산을 비교하여 특정 $$\tau$$ 보다 크면 탐지, 아니면 노이즈라고 봄.  

중첩안시키고 해도 되고 중첩 시켜도 된다. 

(a) 는 노중첩, (b) 중첩

두개의 영상이 있다고 생각한다.
![image](https://cloud.githubusercontent.com/assets/3623889/26565544/1390c2bc-4527-11e7-8793-50749048285b.png)


lambda 는 유사도  

1에서 멀어질 수록 변화가 일어난 것임.  
$$\lambda~\gt~\tau$$ 이면 변화가 일어난 것.  




![image](https://cloud.githubusercontent.com/assets/3623889/26565963/78b80da0-452a-11e7-8e61-ee119f9a1fcd.png)

위는 중첩이 아니라서 픽셀이 큼, 아래는 중첩시켜서 부드럽게 추출이 가능함.

밑이 노이즈에 강함.






# 실제 사례

![image](https://cloud.githubusercontent.com/assets/3623889/26565967/8590be50-452a-11e7-9848-87121c6353ca.png)


이거 시험은 안내는데 방법은 알아놔라

빨간건 UFO 임. 탐지하자.  

위 식은 계산은 틀렸지만 방법의 예시임.  


# 중첩 차영상

레퍼런스 프레임 = 첫프레임

중첩은

(1,2) (1, 3) (1, 4) ( 1, 5) ...  


$$DP_{1k}$$ 1 기준이라는ㄱ 중요함. 



![image](https://cloud.githubusercontent.com/assets/3623889/26565977/9a61fc54-452a-11e7-83ba-836d7a11982e.png)

그림을 보면 오브젝트의 모양과 이동 경로를 알 수 있음.

흰->검







