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

두 프레임의값을 빼고 절대값 붙이고, 절대값이 $$\gt\t$$ 라면 1 로 세팅한다.  

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






# 
![image](https://cloud.githubusercontent.com/assets/3623889/26565544/1390c2bc-4527-11e7-8793-50749048285b.png)
# 
![image](https://cloud.githubusercontent.com/assets/3623889/26565549/19e5bad2-4527-11e7-88ed-851a522fcdd6.png)


