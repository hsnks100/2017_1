---
layout: post
title: "MaliciousSW"
author: 코딩도사(hsnks100@gmail.com)
date: 2017-06-05 13:33 +0900
tags: 
comments: true
---
* table of contents
{:toc}



# 악성 솝트웨어 

self-contained 독립적으로 동작한다.

warm

virus : 자기 자신이 다른 프로그램에 기생한다.

worm : 스스로 복제해서 카피된다.

logic bomb : 어떤 조건하에 트리거

trojan horse : 기대하지 않던 추가된 기능

backdoor : 권한 없는데 들어가는것.

mobile code sw : 다양한 플랫폼에서 ... 사용되는 코드

auto-rooter : 공격set 을 만들어서 공격한다.


![ch19_computersecurity_malicioussw-06](https://cloud.githubusercontent.com/assets/3623889/26770587/38887102-49f3-11e7-851a-f7afc1ee811c.jpg)

Dormant phase, Propagation phase 등등 설명 읽어보기.

![ch19_computersecurity_malicioussw-07](https://cloud.githubusercontent.com/assets/3623889/26770585/38875b14-49f3-11e7-96fd-9c9f50e3ea62.jpg)

Triggering phase 조건 하에 실행된다. 

Execution phase 실행 단계

이쪽 파트는 용어만 좀 알아놓자.



# 바이러스 구조
![ch19_computersecurity_malicioussw-08](https://cloud.githubusercontent.com/assets/3623889/26770589/389b646a-49f3-11e7-9023-e86fafa515f3.jpg)




![ch19_computersecurity_malicioussw-09](https://cloud.githubusercontent.com/assets/3623889/26770590/38a6bae0-49f3-11e7-9933-37d52f5798ba.jpg)

전형적인 구조.

실행파일을 랜덤하게 선택. 이미 감염된지 확인하고 그게 아니면 prepend 가따 부쳐라.

trigger 상태가 되면 악의적인 행위를 하게끔 한다.


![ch19_computersecurity_malicioussw-10](https://cloud.githubusercontent.com/assets/3623889/26770593/38b3f494-49f3-11e7-8430-a4a33fd0da9e.jpg)

숨어있을 땐 packing, 실행시 unpacking


![ch19_computersecurity_malicioussw-12](https://cloud.githubusercontent.com/assets/3623889/26770592/38b37122-49f3-11e7-944a-2c2d9d82c3ed.jpg)

바이러스의 종류

실행파일을 암호화 themida ㅋㅋ 같은거 개꿀임.

polymorphic virus : for-loop 같은걸 다양한 형태로 만들 수 있는데, 비슷한 명령어로 대체 함.

실행 구조를 변형 시킴. 탐지가 정말 힘들다.

metamorphic virus : 코드가 바뀌고 악의 행동 자체가 바뀌는 것.  

![ch19_computersecurity_malicioussw-15](https://cloud.githubusercontent.com/assets/3623889/26770596/38cea50a-49f3-11e7-8e80-bce5c7fce2c1.jpg)

감염시 찾아내는게 현실적인 목표. 그리고 신원 확인, 없애기



![ch19_computersecurity_malicioussw-16](https://cloud.githubusercontent.com/assets/3623889/26770600/38e420b0-49f3-11e7-87b4-ede9bb0511dd.jpg)

first - 코드의 패턴을 db 화 해서 찾기. 

second - 휴리스틱

identify action : 악의 적인 행위 자체를 찾아냄

fourth - 조합


![ch19_computersecurity_malicioussw-17](https://cloud.githubusercontent.com/assets/3623889/26770597/38e01312-49f3-11e7-9eb3-ddfdf7f2397e.jpg)

# Generic Decryption


![ch19_computersecurity_malicioussw-18](https://cloud.githubusercontent.com/assets/3623889/26770599/38e15d3a-49f3-11e7-9b78-6f8cfb53efa1.jpg)

cpu emulator 가 실행하면서 digital immune system 이 구성될 수 있다.

디지털 면역 체계.

![ch19_computersecurity_malicioussw-19](https://cloud.githubusercontent.com/assets/3623889/26770598/38e14eb2-49f3-11e7-8bf1-b8ff86395d68.jpg)
동작이 이상하다 -> 실행파일 전체를 싸서 KISA 에 보낸다 -> 돌려 보면서 분석한다 -> 
시그니쳐 뽑아냄 -> 룰 만들어서 -> 퍼트리면 해당하는 파일들을 다 적용시켜서 치료한다 ->
다른 클라이언트한테도 시그니쳐 공유함. 

이렇게 치유함.


![ch19_computersecurity_malicioussw-20](https://cloud.githubusercontent.com/assets/3623889/26770601/38f0ce5a-49f3-11e7-9e42-7839a7243a52.jpg)

![ch19_computersecurity_malicioussw-21](https://cloud.githubusercontent.com/assets/3623889/26770602/38faac9a-49f3-11e7-9664-0d2213925402.jpg)

행위기반으로 악의적인것을 잡아낸다.

관리자가 정책을 만들어서 white-list 허용가능한 행위를 만들어서 어떤 시스템에 적용시킨다.

이제 공격자가 방화벽 뚫음 -> 악의적인 행동을 감지하는것이 돌아가면서 white-list 벗어나서 딱 잡아냄.

이때 사용되는 개념이 sandbox, sandbox 는 그 안에서만 영향을 미침. 벗어날 수가 없음.

false positive 오탐지가 됨.


![ch19_computersecurity_malicioussw-22](https://cloud.githubusercontent.com/assets/3623889/26770604/390d5480-49f3-11e7-8d9f-868bb9a02ef8.jpg)
![ch19_computersecurity_malicioussw-23](https://cloud.githubusercontent.com/assets/3623889/26770606/3913623a-49f3-11e7-8537-f827df9a2311.jpg)
# Worm 전파
![ch19_computersecurity_malicioussw-24](https://cloud.githubusercontent.com/assets/3623889/26770603/390d1448-49f3-11e7-9ada-141a19620d05.jpg)

웜은 갑자기 확산이 됨.

요즘은 갑자기 요청이 많으면 router 에서 차단시켜 버림.


![ch19_computersecurity_malicioussw-25](https://cloud.githubusercontent.com/assets/3623889/26770605/3912ea9e-49f3-11e7-87b8-45c714f7807c.jpg)

1.25 대란 ㄷ ㄷ  전부 backborn 이 다운됨 ㄷ ㄷ 

![ch19_computersecurity_malicioussw-26](https://cloud.githubusercontent.com/assets/3623889/26770607/391ce792-49f3-11e7-9022-014fbf671411.jpg)

zero-day 어택이란 : 취약성이 발견되면 공개를 함. 이때 배포가 됨. 근데!! 그 취약점이 외부에 오픈 안된 상태에서 그 정보를 이용해서 공격을 함.

대책 없음. 
![ch19_computersecurity_malicioussw-27](https://cloud.githubusercontent.com/assets/3623889/26770608/39251a52-49f3-11e7-87fc-bd3e787826a7.jpg)

rate limiting 어느정도 bandwidth 넘어서면 halting 시킴.


![ch19_computersecurity_malicioussw-28](https://cloud.githubusercontent.com/assets/3623889/26770609/3937120c-49f3-11e7-9eae-70c062b2729b.jpg)
![ch19_computersecurity_malicioussw-29](https://cloud.githubusercontent.com/assets/3623889/26770610/39389460-49f3-11e7-9b25-7f7a339f3e52.jpg)

proactive : 사전대응하기 


![ch19_computersecurity_malicioussw-33](https://cloud.githubusercontent.com/assets/3623889/26770614/39519e42-49f3-11e7-995b-11aef9376275.jpg)
api hooking 가튼거.

진도 끝.



시험 문제는 알아서 하세요. 폴리몰픽...? 커버러스 인증되는 과정, 어떻게 정보가 안전하게 상호 인증이 되는지.

프로토콜들을 하나하나 해석하기. 프로토콜 위주로 봐라. Nonce 가 무슨 뜻인진... 서명이 뭔지 그런거 위주로 봐라

chain 어떻게 연결 되는지.

그래서 마 중요한거 내는거 맞다. hash 의 one-way 가 어디서 나오는지, birth attack

hash 이용해서 무결성이 제공이 됐는데, 키값이 들어가면 인증을 할 수 있다. 메세지 무결성 검증 관련

소스에 대한 인증에 대해서.

디지털 서명 기법들, elgamal signature verification 증명해봐라. 




