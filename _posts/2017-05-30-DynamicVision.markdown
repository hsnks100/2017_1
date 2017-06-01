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

# Static Segmentation and Matching

Segmentation 은 영역을 따내는 것.

영역화, semantic... 의미 있는 오브젝트를 밝혀내는 것, 그룹화 하는것... 등등... 즉 관심 있는거 따내는 거임.













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
![2017cv14nn2 1 -31](https://cloud.githubusercontent.com/assets/3623889/26661035/a4e2ef02-46b6-11e7-95d2-f230a1854076.jpg)
![2017cv14nn2 1 -32](https://cloud.githubusercontent.com/assets/3623889/26661036/a4e3898a-46b6-11e7-8316-83d4cf992ced.jpg)
![2017cv14nn2 1 -33](https://cloud.githubusercontent.com/assets/3623889/26661037/a4ec8daa-46b6-11e7-8378-6f3089f02e49.jpg)
![2017cv14nn2 1 -34](https://cloud.githubusercontent.com/assets/3623889/26661038/a50ba12c-46b6-11e7-81c3-dcc1c9d33d4f.jpg)
![2017cv14nn2 1 -35](https://cloud.githubusercontent.com/assets/3623889/26661039/a50e2cf8-46b6-11e7-9cc5-25d3183f9cf1.jpg)
![2017cv14nn2 1 -36](https://cloud.githubusercontent.com/assets/3623889/26661041/a5107d64-46b6-11e7-893b-fd1dcfa70aa1.jpg)
![2017cv14nn2 1 -37](https://cloud.githubusercontent.com/assets/3623889/26661040/a50fa8b2-46b6-11e7-8d5f-28c6450f7be6.jpg)
![2017cv14nn2 1 -38](https://cloud.githubusercontent.com/assets/3623889/26661042/a51147f8-46b6-11e7-94d2-210a4b700c27.jpg)
![2017cv14nn2 1 -39](https://cloud.githubusercontent.com/assets/3623889/26661043/a51e849a-46b6-11e7-9a7e-2b86421fcb49.jpg)
![2017cv14nn2 1 -40](https://cloud.githubusercontent.com/assets/3623889/26661048/a54adda6-46b6-11e7-811b-fbebfb589588.jpg)
![2017cv14nn2 1 -41](https://cloud.githubusercontent.com/assets/3623889/26661044/a53ad1b8-46b6-11e7-864b-b554dd7fa37e.jpg)
![2017cv14nn2 1 -42](https://cloud.githubusercontent.com/assets/3623889/26661046/a53d5d98-46b6-11e7-9f0d-af485fa4c31e.jpg)
![2017cv14nn2 1 -43](https://cloud.githubusercontent.com/assets/3623889/26661047/a53d9c04-46b6-11e7-90a1-7e053d48bd67.jpg)
![2017cv14nn2 1 -44](https://cloud.githubusercontent.com/assets/3623889/26661045/a53c70c2-46b6-11e7-87a7-70642dfd4125.jpg)
![2017cv14nn2 1 -45](https://cloud.githubusercontent.com/assets/3623889/26661049/a55c110c-46b6-11e7-9958-fb5acb2e6396.jpg)
![2017cv14nn2 1 -46](https://cloud.githubusercontent.com/assets/3623889/26661052/a56ff744-46b6-11e7-9034-76b7bbaf24c3.jpg)
![2017cv14nn2 1 -47](https://cloud.githubusercontent.com/assets/3623889/26661050/a56f1126-46b6-11e7-88ab-1d792f1c4405.jpg)
![2017cv14nn2 1 -48](https://cloud.githubusercontent.com/assets/3623889/26661053/a572f8ae-46b6-11e7-9c73-011f9fcd3db2.jpg)
![2017cv14nn2 1 -49](https://cloud.githubusercontent.com/assets/3623889/26661051/a56fd1ba-46b6-11e7-909a-c5d55a9950de.jpg)
![2017cv14nn2 1 -50](https://cloud.githubusercontent.com/assets/3623889/26661054/a576f148-46b6-11e7-96cb-9657650c7f18.jpg)
![2017cv14nn2 1 -51](https://cloud.githubusercontent.com/assets/3623889/26661055/a593be40-46b6-11e7-82a0-b3c7f5b10884.jpg)
![2017cv14nn2 1 -52](https://cloud.githubusercontent.com/assets/3623889/26661056/a59ca23a-46b6-11e7-834b-4f399104fc22.jpg)
![2017cv14nn2 1 -53](https://cloud.githubusercontent.com/assets/3623889/26661058/a59fde64-46b6-11e7-965a-5d72b511a1fa.jpg)
![2017cv14nn2 1 -54](https://cloud.githubusercontent.com/assets/3623889/26661057/a59f46de-46b6-11e7-95f8-79e137b3c5ba.jpg)
![2017cv14nn2 1 -55](https://cloud.githubusercontent.com/assets/3623889/26661059/a5a08440-46b6-11e7-8f6b-19b407b666f3.jpg)
![2017cv14nn2 1 -56](https://cloud.githubusercontent.com/assets/3623889/26661060/a5a372d6-46b6-11e7-9884-c611a716fd67.jpg)
![2017cv14nn2 1 -57](https://cloud.githubusercontent.com/assets/3623889/26661061/a5c2af70-46b6-11e7-8a3d-ef88daf81f47.jpg)
![2017cv14nn2 1 -58](https://cloud.githubusercontent.com/assets/3623889/26661062/a5ca1224-46b6-11e7-8290-c455e05a2317.jpg)
![2017cv14nn2 1 -59](https://cloud.githubusercontent.com/assets/3623889/26661064/a5cb709c-46b6-11e7-8315-7956455118c5.jpg)
![2017cv14nn2 1 -60](https://cloud.githubusercontent.com/assets/3623889/26661066/a5d026b4-46b6-11e7-97b4-7430ac960716.jpg)
![2017cv14nn2 1 -61](https://cloud.githubusercontent.com/assets/3623889/26661063/a5ca5126-46b6-11e7-8419-9942e1e8bcfc.jpg)
![2017cv14nn2 1 -62](https://cloud.githubusercontent.com/assets/3623889/26661065/a5cc8342-46b6-11e7-9cf9-0db7a147a9ad.jpg)
![2017cv14nn2 1 -63](https://cloud.githubusercontent.com/assets/3623889/26661067/a5f405ac-46b6-11e7-8afc-858aa9c89e64.jpg)
![2017cv14nn2 1 -64](https://cloud.githubusercontent.com/assets/3623889/26661068/a5f6ee0c-46b6-11e7-9a13-a982a058cf7b.jpg)
![2017cv14nn2 1 -65](https://cloud.githubusercontent.com/assets/3623889/26661069/a5f73650-46b6-11e7-83f7-fbdf43e9e44c.jpg)
![2017cv14nn2 1 -66](https://cloud.githubusercontent.com/assets/3623889/26661072/a60cb30e-46b6-11e7-9d0d-4da83a73c3e9.jpg)
![2017cv14nn2 1 -67](https://cloud.githubusercontent.com/assets/3623889/26661071/a60be42e-46b6-11e7-84b0-fb3928a161ab.jpg)
![2017cv14nn2 1 -68](https://cloud.githubusercontent.com/assets/3623889/26661070/a5fa2edc-46b6-11e7-9371-af31efac9b20.jpg)
![2017cv14nn2 1 -69](https://cloud.githubusercontent.com/assets/3623889/26661073/a621435a-46b6-11e7-9866-bc1c57b74575.jpg)
![2017cv14nn2 1 -70](https://cloud.githubusercontent.com/assets/3623889/26661074/a6351f38-46b6-11e7-81f6-3fd16587dc4a.jpg)
![2017cv14nn2 1 -71](https://cloud.githubusercontent.com/assets/3623889/26661075/a635f7c8-46b6-11e7-8bb8-7d7a09646fff.jpg)
![2017cv14nn2 1 -72](https://cloud.githubusercontent.com/assets/3623889/26661076/a63729d6-46b6-11e7-84a7-1855c7bc3fa0.jpg)
![2017cv14nn2 1 -73](https://cloud.githubusercontent.com/assets/3623889/26661078/a6386a1c-46b6-11e7-8d4d-91e6849cfe65.jpg)
![2017cv14nn2 1 -74](https://cloud.githubusercontent.com/assets/3623889/26661077/a6377bde-46b6-11e7-8964-d71566f32e19.jpg)
![2017cv14nn2 1 -75](https://cloud.githubusercontent.com/assets/3623889/26661079/a64dadc8-46b6-11e7-8dcd-45781a884d0c.jpg)
![2017cv14nn2 1 -76](https://cloud.githubusercontent.com/assets/3623889/26661080/a65dcff0-46b6-11e7-890d-0b29ce7feaac.jpg)
![2017cv14nn2 1 -77](https://cloud.githubusercontent.com/assets/3623889/26661081/a666f7b0-46b6-11e7-8898-dbf2e28bdd4a.jpg)
![2017cv14nn2 1 -78](https://cloud.githubusercontent.com/assets/3623889/26661083/a6682798-46b6-11e7-989c-472118d06d25.jpg)
![2017cv14nn2 1 -79](https://cloud.githubusercontent.com/assets/3623889/26661082/a667b272-46b6-11e7-9edc-314afdc8bcd6.jpg)
![2017cv14nn2 1 -80](https://cloud.githubusercontent.com/assets/3623889/26661084/a669a8c0-46b6-11e7-9a9c-6b86eba824dd.jpg)



