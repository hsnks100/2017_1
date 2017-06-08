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




![2017cv14nn2-01](https://user-images.githubusercontent.com/3623889/26906793-4c824af0-4c2a-11e7-8b83-c7acdecb6e36.jpg)
![2017cv14nn2-02](https://user-images.githubusercontent.com/3623889/26906790-4c802dba-4c2a-11e7-8e79-7902e002023f.jpg)
![2017cv14nn2-03](https://user-images.githubusercontent.com/3623889/26906791-4c811770-4c2a-11e7-9eda-0db203ba546b.jpg)
![2017cv14nn2-04](https://user-images.githubusercontent.com/3623889/26906792-4c81d49e-4c2a-11e7-8598-b946f94580cb.jpg)
![2017cv14nn2-05](https://user-images.githubusercontent.com/3623889/26906795-4c9a92cc-4c2a-11e7-975f-e1cd9a5307c7.jpg)
![2017cv14nn2-06](https://user-images.githubusercontent.com/3623889/26906794-4c834bee-4c2a-11e7-88e9-4e542779d176.jpg)




![2017cv14nn2-07](https://user-images.githubusercontent.com/3623889/26906798-4cb09e0a-4c2a-11e7-9bac-7880381cd949.jpg)

![2017cv14nn2-08](https://user-images.githubusercontent.com/3623889/26906796-4cadc05e-4c2a-11e7-84ec-54b6ea46ceb6.jpg)



![2017cv14nn2-09](https://user-images.githubusercontent.com/3623889/26906797-4caeee16-4c2a-11e7-8ad2-6faa27a27d10.jpg)


![2017cv14nn2-10](https://user-images.githubusercontent.com/3623889/26906800-4cc60be6-4c2a-11e7-830e-ced2e0e493bc.jpg)




![2017cv14nn2-11](https://user-images.githubusercontent.com/3623889/26906799-4cb6226c-4c2a-11e7-80b4-99d6473bb5b3.jpg)
![2017cv14nn2-12](https://user-images.githubusercontent.com/3623889/26906801-4cc6b2ee-4c2a-11e7-9ead-2a3a173c38a1.jpg)
![2017cv14nn2-13](https://user-images.githubusercontent.com/3623889/26906802-4cd509fc-4c2a-11e7-8baf-1148b2930d2b.jpg)
![2017cv14nn2-14](https://user-images.githubusercontent.com/3623889/26906803-4cd686e2-4c2a-11e7-8426-600829fa89d1.jpg)
![2017cv14nn2-15](https://user-images.githubusercontent.com/3623889/26906805-4cec8b7c-4c2a-11e7-8b4f-96558915de33.jpg)
![2017cv14nn2-16](https://user-images.githubusercontent.com/3623889/26906804-4ce0878c-4c2a-11e7-8119-e8ed258d01dc.jpg)
![2017cv14nn2-17](https://user-images.githubusercontent.com/3623889/26906808-4d04d092-4c2a-11e7-8b8b-c02bc2a2fb6a.jpg)
![2017cv14nn2-18](https://user-images.githubusercontent.com/3623889/26906806-4d042692-4c2a-11e7-8d91-582cf5c420e5.jpg)
![2017cv14nn2-19](https://user-images.githubusercontent.com/3623889/26906810-4d121590-4c2a-11e7-97d1-e1d7bea13936.jpg)
![2017cv14nn2-20](https://user-images.githubusercontent.com/3623889/26906807-4d042e9e-4c2a-11e7-8337-1213d3b9d16a.jpg)
![2017cv14nn2-21](https://user-images.githubusercontent.com/3623889/26906809-4d09f48c-4c2a-11e7-8b6a-d040165af558.jpg)
![2017cv14nn2-22](https://user-images.githubusercontent.com/3623889/26906811-4d190e04-4c2a-11e7-9409-770b7f0d12a8.jpg)
![2017cv14nn2-23](https://user-images.githubusercontent.com/3623889/26906815-4d402b38-4c2a-11e7-8d18-aa75a6d3a911.jpg)
![2017cv14nn2-24](https://user-images.githubusercontent.com/3623889/26906816-4d4070c0-4c2a-11e7-93d6-79f4e390eafd.jpg)
![2017cv14nn2-25](https://user-images.githubusercontent.com/3623889/26906817-4d422b7c-4c2a-11e7-8caa-7717249adbfd.jpg)
![2017cv14nn2-26](https://user-images.githubusercontent.com/3623889/26906812-4d31d74a-4c2a-11e7-9b77-cdde6e3d4ff7.jpg)
![2017cv14nn2-27](https://user-images.githubusercontent.com/3623889/26906813-4d3b7dc2-4c2a-11e7-8c31-b0c643feb133.jpg)
![2017cv14nn2-28](https://user-images.githubusercontent.com/3623889/26906814-4d3dc21c-4c2a-11e7-9703-b11479613f0e.jpg)
![2017cv14nn2-29](https://user-images.githubusercontent.com/3623889/26906818-4d58b4dc-4c2a-11e7-9352-4e738a41f598.jpg)
![2017cv14nn2-30](https://user-images.githubusercontent.com/3623889/26906819-4d64aba2-4c2a-11e7-98c6-213c4c62f6bf.jpg)

광류...?

앞에서는 흑미점?

흥미점





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


$$\lambda$$ 는 유사도  

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
![2017cv14nn2 1 -11](https://cloud.githubusercontent.com/assets/3623889/26661019/a45ec556-46b6-11e7-9479-7ddc23632501.jpg)


수식을 보면 항상 1 과의 관계의 차영상

레퍼런스 프레임 = 첫프레임

중첩은

(1,2) (1, 3) (1, 4) ( 1, 5) ...  


$$DP_{1k}$$ 1 기준이라는ㄱ 중요함. 





![image](https://cloud.githubusercontent.com/assets/3623889/26565977/9a61fc54-452a-11e7-83ba-836d7a11982e.png)

그림을 보면 오브젝트의 모양과 이동 경로를 알 수 있음.

흰->검



# Static Segmentation and Matching

Segmentation 은 영역을 따내는 것.

영역화, semantic... 의미 있는 오브젝트를 밝혀내는 것, 그룹화 하는것... 등등... 즉 관심 있는거 따내는 거임.




# Stationary Camera


![2017cv14nn2 1 -19](https://cloud.githubusercontent.com/assets/3623889/26661023/a488284c-46b6-11e7-8b4b-461f6fc77935.jpg)


차영상에서 절대값 안붙인게 어느 부분에서 양수도 나오고 음수도 나온다.

$$\gt T$$ 도 가능하고 $$\lt T$$ 인 경우에도 되게끔 설정이 가능하다.


![2017cv14nn2 1 -22](https://cloud.githubusercontent.com/assets/3623889/26661027/a4b0257c-46b6-11e7-84a7-287116dda704.jpg)

3개의 이미지는 각각 AADP, PADP, NADP 

세번째꺼는 오른쪽 끝끼리 이으면 운동 방향을 알 수 있다. 

자세한건 다음 그림 참고 해라.


![2017cv14nn2 1 -20](https://cloud.githubusercontent.com/assets/3623889/26661025/a48c7e74-46b6-11e7-9a09-459b4b4d217d.jpg)


그래서 Stationary Camera 가 뭐냐?


# Disparity Computations as Relaxation Labeling

첫번째 프레임에서 피쳐가 5개, 두번째도 5개 탐지됐으면...

피쳐의 픽셀의 위치가 어디로 갔다고 해야 가장 일치성이 있느냐... (b) ...

거리가 최소가 되는것을 매칭함.

5개의 점은 intereset Points Points ... 즉 Moravec 으로 탐지한 것임. (a) 는 두 프레임을 겹쳐 놓은 것.



# 이런건 시험 ㄴㄴ
![2017cv14nn2 1 -14](https://cloud.githubusercontent.com/assets/3623889/26661018/a45b2356-46b6-11e7-9f87-055c0be33426.jpg)

# 모라벡
![2017cv14nn2 1 -27](https://cloud.githubusercontent.com/assets/3623889/26661028/a4b78894-46b6-11e7-92be-61dbf929a70c.jpg)

경우의수를 따져서 가장 최소의 거리가 되는 것이 매칭되는 것임.



# Image Flow
![2017cv14nn2 1 -28](https://cloud.githubusercontent.com/assets/3623889/26661032/a4e018ea-46b6-11e7-8940-e3eefd30556e.jpg)

계속 도는것 처럼 보인다. 화상뷰.

속도장.

이것은 관측자, 오브젝트의 움직임, 조명변화때문에 생긴다.









![2017cv14nn2 1 -01](https://cloud.githubusercontent.com/assets/3623889/26661005/a3faf95e-46b6-11e7-836b-2ece817da6db.jpg)
![2017cv14nn2 1 -02](https://cloud.githubusercontent.com/assets/3623889/26661008/a3ff3000-46b6-11e7-86de-97a2f7f9f227.jpg)
![2017cv14nn2 1 -03](https://cloud.githubusercontent.com/assets/3623889/26661007/a3fee1f4-46b6-11e7-8594-fe226129d25d.jpg)
![2017cv14nn2 1 -04](https://cloud.githubusercontent.com/assets/3623889/26661009/a3ff86d6-46b6-11e7-9317-54e9915b5214.jpg)
![2017cv14nn2 1 -05](https://cloud.githubusercontent.com/assets/3623889/26661006/a3fdbb76-46b6-11e7-89b6-b6d5bc655fcb.jpg)
![2017cv14nn2 1 -06](https://cloud.githubusercontent.com/assets/3623889/26661011/a42d0624-46b6-11e7-80a9-03089f434d3b.jpg)
![2017cv14nn2 1 -07](https://cloud.githubusercontent.com/assets/3623889/26661010/a42a7e40-46b6-11e7-9bf1-7beb2701af82.jpg)
![2017cv14nn2 1 -08](https://cloud.githubusercontent.com/assets/3623889/26661012/a42cfe4a-46b6-11e7-86ea-967f2a92e9f5.jpg)
![2017cv14nn2 1 -09](https://cloud.githubusercontent.com/assets/3623889/26661013/a42fd3ea-46b6-11e7-9727-ed37e8a67cb2.jpg)
![2017cv14nn2 1 -10](https://cloud.githubusercontent.com/assets/3623889/26661014/a4410f02-46b6-11e7-9975-8a19aa27e2b5.jpg)
![2017cv14nn2 1 -11](https://cloud.githubusercontent.com/assets/3623889/26661019/a45ec556-46b6-11e7-9479-7ddc23632501.jpg)
![2017cv14nn2 1 -12](https://cloud.githubusercontent.com/assets/3623889/26661015/a454ee46-46b6-11e7-8373-61bd677040cc.jpg)
![2017cv14nn2 1 -13](https://cloud.githubusercontent.com/assets/3623889/26661016/a45567ae-46b6-11e7-9cdf-76eb31e4f79c.jpg)
![2017cv14nn2 1 -14](https://cloud.githubusercontent.com/assets/3623889/26661018/a45b2356-46b6-11e7-9f87-055c0be33426.jpg)
![2017cv14nn2 1 -15](https://cloud.githubusercontent.com/assets/3623889/26661017/a45a9f3a-46b6-11e7-8bf5-8dcbe20c8007.jpg)
![2017cv14nn2 1 -16](https://cloud.githubusercontent.com/assets/3623889/26661020/a47957e0-46b6-11e7-97d7-ff75b2c2ce1d.jpg)
![2017cv14nn2 1 -17](https://cloud.githubusercontent.com/assets/3623889/26661022/a481a954-46b6-11e7-87c4-59c87af1221a.jpg)
![2017cv14nn2 1 -18](https://cloud.githubusercontent.com/assets/3623889/26661021/a47f933a-46b6-11e7-97a8-7b9e8e069e18.jpg)
![2017cv14nn2 1 -19](https://cloud.githubusercontent.com/assets/3623889/26661023/a488284c-46b6-11e7-8b4b-461f6fc77935.jpg)
![2017cv14nn2 1 -20](https://cloud.githubusercontent.com/assets/3623889/26661025/a48c7e74-46b6-11e7-9a09-459b4b4d217d.jpg)
![2017cv14nn2 1 -21](https://cloud.githubusercontent.com/assets/3623889/26661024/a48a48a2-46b6-11e7-8bbe-c4a742a07f79.jpg)
![2017cv14nn2 1 -22](https://cloud.githubusercontent.com/assets/3623889/26661027/a4b0257c-46b6-11e7-84a7-287116dda704.jpg)
![2017cv14nn2 1 -23](https://cloud.githubusercontent.com/assets/3623889/26661031/a4c1b38c-46b6-11e7-9121-ad139a2b80db.jpg)
![2017cv14nn2 1 -24](https://cloud.githubusercontent.com/assets/3623889/26661026/a4ae781c-46b6-11e7-94c8-a659c863d3c0.jpg)
![2017cv14nn2 1 -25](https://cloud.githubusercontent.com/assets/3623889/26661030/a4ba8daa-46b6-11e7-9c10-f060f7305eb4.jpg)
![2017cv14nn2 1 -26](https://cloud.githubusercontent.com/assets/3623889/26661029/a4b93dc4-46b6-11e7-9bca-2b643e2f63b1.jpg)
![2017cv14nn2 1 -27](https://cloud.githubusercontent.com/assets/3623889/26661028/a4b78894-46b6-11e7-92be-61dbf929a70c.jpg)
![2017cv14nn2 1 -28](https://cloud.githubusercontent.com/assets/3623889/26661032/a4e018ea-46b6-11e7-8940-e3eefd30556e.jpg)
![2017cv14nn2 1 -29](https://cloud.githubusercontent.com/assets/3623889/26661033/a4e16d94-46b6-11e7-963f-11cf01adc373.jpg)
![2017cv14nn2 1 -30](https://cloud.githubusercontent.com/assets/3623889/26661034/a4e1ccd0-46b6-11e7-9020-cbebd2c7d52c.jpg)

광뷰... 스몰 타임으로 함.

밝기값 기반, 여윽시 셤 ㄴㄴ?

속도장은 3차원 벡터




![2017cv14nn2 1 -31](https://cloud.githubusercontent.com/assets/3623889/26661035/a4e2ef02-46b6-11e7-95d2-f230a1854076.jpg)

운동장은 오른쪽이지망 밝기 기반이니까 업

cube 오른쪽 그림은 화살표다.


![2017cv14nn2 1 -32](https://cloud.githubusercontent.com/assets/3623889/26661036/a4e3898a-46b6-11e7-8316-83d4cf992ced.jpg)
플로우를 구하기 위해서 어떤 가정을 한다. 

속도, 가속, 비슷한 방법으로 모든게 움직인다.(고체)
![2017cv14nn2 1 -33](https://cloud.githubusercontent.com/assets/3623889/26661037/a4ec8daa-46b6-11e7-8378-6f3089f02e49.jpg)
![2017cv14nn2 1 -34](https://cloud.githubusercontent.com/assets/3623889/26661038/a50ba12c-46b6-11e7-81c3-dcc1c9d33d4f.jpg)

시험  


![2017cv14nn2-31](https://user-images.githubusercontent.com/3623889/26906821-4d6d8cc2-4c2a-11e7-9fab-0ec39592c440.jpg)
![2017cv14nn2-32](https://user-images.githubusercontent.com/3623889/26906824-4d80affa-4c2a-11e7-867c-1d37bb8cf906.jpg)

# Computing Image Flow
![2017cv14nn2-33](https://user-images.githubusercontent.com/3623889/26906820-4d6ade28-4c2a-11e7-8b58-f2f70ea94cb1.jpg)

특징 기반은 앞에서 했음. 영상 프레임에서 코너점 찾고,,.. 에지 찾는다 등등 

특징 정보를 연결했다. 매칭 시킨다. 그 사이에서 나오는 차이값을 계산함.

두개의 프레임에서 어떤 f(x, y) 을 생각한다. 

$ E = f(x, y, t)\\
E = f(x, y, t + 1) 
$

짧은 시간에서 $ dE over {dt} = 0 $ 이기 때문에 밑의 식을 쓴다. 


![2017cv14nn2-34](https://user-images.githubusercontent.com/3623889/26906822-4d7de2de-4c2a-11e7-88d1-25752c331f63.jpg)

시험 :  14.1 를 유도해보자.
E 를 전 미분하면 14.1 식이 나온다. 아래 보충설명 ㄱ ㄱ 

우리는 속도장을 구하는거니까 velocity vector(u, v) 를 구해야 한다. 식이 하나라서 풀 수가 없음.



# 편미분과 전미분 차이
![2017cv14nn2-35](https://user-images.githubusercontent.com/3623889/26906823-4d7edd7e-4c2a-11e7-86f1-f0d80816831c.jpg)

편미분은 나머지 변수를 상수로 보고 계산한다.  

# 고차 편미분과 전미분
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


# aperture problem
![2017cv14nn2-38](https://user-images.githubusercontent.com/3623889/26906827-4d995514-4c2a-11e7-9f0a-ae19af65e1aa.jpg)
이런것을 aperture problem 이라고 한다.

동그란 구멍으로 뭘 들여다 보고 있다고 한다.

여기서 사각형이 그 구멍에서 움직였다면 그 구멍에서 코너가 포함됐으면 운동 방향 알지만

코너가 드러나지 않았으면 정보가 없다. 어디로 갔는지 알 수 없다. 

그럼 우야노?? 반복 계산법으로 풀어봄

# 테일러 시리즈

![2017cv14nn2-39](https://user-images.githubusercontent.com/3623889/26906829-4da90072-4c2a-11e7-9fd8-a38d6c87fa7a.jpg)

여기서 나온 식은 14.1 과 같은 표현임. 근데 왜 쓴거야??






![2017cv14nn2-40](https://user-images.githubusercontent.com/3623889/26906828-4da57010-4c2a-11e7-88bf-f381287ad9d3.jpg)
![2017cv14nn2-41](https://user-images.githubusercontent.com/3623889/26906830-4dac1802-4c2a-11e7-8959-a5431173ded0.jpg)

# 완화 계산 광자 플로우... 시험에 안나옴

![2017cv14nn2-42](https://user-images.githubusercontent.com/3623889/26906831-4db9df28-4c2a-11e7-8fec-f1d1852acd02.jpg)
이미지 두개로 하는 알고리즘


![2017cv14nn2-43](https://user-images.githubusercontent.com/3623889/26906832-4dbac424-4c2a-11e7-9ee9-209d3dcf585d.jpg)

영상이 여러개 있을 때 쓰는 알고리즘
![2017cv14nn2-44](https://user-images.githubusercontent.com/3623889/26906833-4dc1d02a-4c2a-11e7-8237-209b350e458b.jpg)

# 결과
![2017cv14nn2-49](https://user-images.githubusercontent.com/3623889/26906837-4de26d1c-4c2a-11e7-8c7c-726dae095017.jpg)

광류를 구한 결과임.


# 광류에서의 정보

![2017cv14nn2-50](https://user-images.githubusercontent.com/3623889/26906839-4deaf522-4c2a-11e7-80e6-699c8a83d31c.jpg)

FOE : 그림에서의 점들을 FOE 라고 한다. 가까워질 때....
FOC : 멀어질 때....





![2017cv14nn2-51](https://user-images.githubusercontent.com/3623889/26906840-4df68c2a-4c2a-11e7-99ab-5fbd616f9b5a.jpg)
![2017cv14nn2-52](https://user-images.githubusercontent.com/3623889/26906841-4dfd4510-4c2a-11e7-8f7b-38a6b429a93d.jpg)
![2017cv14nn2-53](https://user-images.githubusercontent.com/3623889/26906842-4e0065d8-4c2a-11e7-9de4-a1ccebd6747d.jpg)

# Tracking
![2017cv14nn2-60](https://user-images.githubusercontent.com/3623889/26906851-4e393e62-4c2a-11e7-8282-e2c4cc630caf.jpg)

흥미점을 연결해서 움직였다. 경로 일관성 구하는거.



# 응용 사례
![2017cv14nn2-61](https://user-images.githubusercontent.com/3623889/26906850-4e35f5ea-4c2a-11e7-80f2-cc5de6a25c7c.jpg) 
![2017cv14nn2-62](https://user-images.githubusercontent.com/3623889/26906852-4e447444-4c2a-11e7-8bdc-2eeadf043d9e.jpg)

뭔가 놓고 갔다. 그러면 의심.


![2017cv14nn2-63](https://user-images.githubusercontent.com/3623889/26906853-4e54dee2-4c2a-11e7-81b7-0f9bb1f363c4.jpg)

# Derivation Function for Path Coherence

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

첫항을 방향 일관성

둘째항은 속도 일관성

$ weight = w_1 + w_2 = 1 $




![2017cv14nn2-67](https://user-images.githubusercontent.com/3623889/26906858-4e7103b0-4c2a-11e7-8b2a-771306877219.jpg)

# example
![2017cv14nn2-68](https://user-images.githubusercontent.com/3623889/26906857-4e6e214a-4c2a-11e7-8a47-91b8e5ed2041.jpg)


![2017cv14nn2-69](https://user-images.githubusercontent.com/3623889/26906859-4e7aeb8c-4c2a-11e7-8098-4eb35ef1f58a.jpg)
![2017cv14nn2-70](https://user-images.githubusercontent.com/3623889/26906860-4e85b134-4c2a-11e7-8c22-7bcad590176f.jpg)
![2017cv14nn2-71](https://user-images.githubusercontent.com/3623889/26906862-4e8676fa-4c2a-11e7-9070-e0818aa6ebac.jpg)
![2017cv14nn2-72](https://user-images.githubusercontent.com/3623889/26906861-4e8620e2-4c2a-11e7-903d-7ee10b27ca82.jpg)
![2017cv14nn2-73](https://user-images.githubusercontent.com/3623889/26906864-4e99717e-4c2a-11e7-8d6e-8afe6590cf97.jpg)
![2017cv14nn2-74](https://user-images.githubusercontent.com/3623889/26906863-4e957286-4c2a-11e7-8aed-578551e259df.jpg)
![2017cv14nn2-75](https://user-images.githubusercontent.com/3623889/26906865-4ea22512-4c2a-11e7-9145-88a20de48028.jpg)
![2017cv14nn2-76](https://user-images.githubusercontent.com/3623889/26906866-4ead7cc8-4c2a-11e7-86d9-861d90e901ca.jpg)
![2017cv14nn2-77](https://user-images.githubusercontent.com/3623889/26906867-4eb0caf4-4c2a-11e7-89bd-a01c6f2630a5.jpg)
![2017cv14nn2-78](https://user-images.githubusercontent.com/3623889/26906868-4eb2188c-4c2a-11e7-91f9-474524e2c07b.jpg)
![2017cv14nn2-79](https://user-images.githubusercontent.com/3623889/26906869-4ebef32c-4c2a-11e7-8fbe-d9bed06fd697.jpg)
![2017cv14nn2-80](https://user-images.githubusercontent.com/3623889/26906870-4ec166c0-4c2a-11e7-9e41-ed678d6f6763.jpg)





