---
layout: post
tags: 
title2: 시각개론 Histogram equalization
comments: true
---


# Histogram equalization 

이번 과제는 이미지의 Histogram equalization 을 시키는 것이다. 

일종의 흐리멍텅한 이미지의 선명도를 개선하는 것이다.

# Algorithm

![](../images/visual/hw3_3.png)

위와 같은 식으로 먼저 256-gray 의 histogram 과 histogram cumulative 를 구한다.

python 으로 코드를 간단히 써보면

``` python
    for y in range(0, sizeY):
        for x in range(0, sizeX):
            histo[img[y,x]] += 1

    acc = 0
    histoc[0] = histo[0]
    for i in range(1, 256):
        histoc[i] = histoc[i-1] + histo[i]
```

위와 같이 간단히 구할 수 있다. 


# 변환


``` python
    newImg = img.copy()

    for y in range(0, sizeY):
        for x in range(0, sizeX):
            newImg[y, x] = round(255.0 / (sizeX * sizeY) * histoc[img[y, x]]) 

    sumImg = np.hstack((img, newImg))    
    showImg(sumImg) 

```

구한 histogram table 을 이용하여 원본 이미지를 변환 시키는 코드는 위와 같다.

하지만 예제로 주어진 사진에서는 결과가 잘 나오지 않았다. 

![](../images/visual/hw3_2.png)
잘 안되는 모습

![](../images/visual/hw3_1.png) 
다른 이미지로 해보면 어떨까 싶어서 해보았더니 잘 나왔다.

이러한 결과가 나온 이유는 원본 이미지가 0이 매우 많아서 histogram cumulative 시에 0 수치가 매우 높아 일종의 밝기가 개선된 모습이 나왔다.

p[0] = round(255 / 크기 * 0의 개수)  로 인해 기본적인 0 컬러의 값이 상승하는 효과가 있었다.


전체 코드
``` python

import cv2
import numpy as np
import math

from matplotlib import pyplot as plt

def showImg(img):
    plt.imshow(img, cmap='gray')
    plt.xticks([]), plt.yticks([])
    plt.show()

def main():

    imgfile = 'hw3.jpg' 
    img = cv2.imread(imgfile) 
    img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    histo = [0] * 256
    histoc = [0] * 256

    sizeY, sizeX = img.shape
    print sizeY, sizeX

    # return


    for y in range(0, sizeY):
        for x in range(0, sizeX):
            histo[img[y,x]] += 1

    acc = 0
    histoc[0] = histo[0]
    for i in range(1, 256):
        histoc[i] = histoc[i-1] + histo[i]

    newImg = img.copy()

    for y in range(0, sizeY):
        for x in range(0, sizeX):
            newImg[y, x] = round(255.0 / (sizeX * sizeY) * histoc[img[y, x]]) 

    sumImg = np.hstack((img, newImg))    
    showImg(sumImg) 

main()


```

