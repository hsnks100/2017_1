---
layout: post
title: "ObserverPatter간단한설명과예제"
author: 코딩도사(hsnks100@gmail.com)
date: 2017-05-21 22:09 +0900
tags: 
comments: true
---
* table of contents
{:toc}

# 과제 개요
  주어진 프로그램 코드에 대해 Strategy Pattern, Observer Pattern을 적용한다.

# 1. Strategy Pattern 적용하기


## 기존 코드
### Robot
* 생성자로 이름 설정
* attack(), move()는 하위클래스에서 적용하는 것으로 작성되었다.

```
public abstract class Robot {
	private String name;

	public Robot(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	abstract public void attack();

	abstract public void move();
}
```

### Atom
* Robot class를 상속받아 작성된다.
* attack(), move() 함수를 반드시(?) 작성한다.

```
public class Atom extends Robot {
	public Atom(String name) {
		super(name);
	}

	public void attack() {
		System.out.println("I have strong punch and can attack with it.");
	}

	public void move() {
		System.out.println("I can fly.");
	}
}
```

### TaekwonV

* Robot class를 상속받아 작성된다.
* attack(), move() 함수를 반드시(?) 작성한다.

```
public class TaekwonV extends Robot {
	public TaekwonV(String name) {
		super(name);
	}

	public void attack() {
		System.out.println("I have Missile and can attack with it.");
	}

	public void move() {
		System.out.println("I can only walk.");
	}
}
```
## 로봇의 움직임을 클래스로 상속받도록 해보자

### RobotActions Class
* 기존에 주어진 attack(), move()를 interface화 한 모습이다.

```
public interface RobotActions {
	public void attack();
	public void move();
}
```

### AtomActions Class
* RobotActions interface를 implements함

```
public class AtomActions implements RobotActions {

	@Override
	public void attack() {
		System.out.println("I have strong punch and can attack with it.");
	}

	@Override
	public void move() {
		System.out.println("I can fly.");
	}
}
```

### TaekwonVActions
* RobotActions interface를 implements함

```
public class TaekwonVActions implements RobotActions {

	@Override
	public void attack() {
		System.out.println("I have Missile and can attack with it.");
	}

	@Override
	public void move() {
		System.out.println("I can only walk.");
	}

}
```

## 각 로봇 클래스를 위에 만든 Action을 이용하도록 변경하자

### Robot Class
* RobotActions interface를 변수로 등록함.
* RobotActions에 대한 setter, getter 등록
* attack(), move()를 RobotActions의 interface를 호출하도록 변경.

```
public abstract class Robot {
	private String name;
	private RobotActions robotActions;
	public Robot(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setRobotActions(RobotActions robotActions) {
		this.robotActions = robotActions;
	}
	
	public void attack() {
		robotActions.attack();
	};

	public void move() {
		robotActions.move();
	}
}
```

### Atom Class
* 생성자에서 RobotActions를 생성하여 setRobotActions를 호출하도록 변경.
* attack(), move()를 RobotActions implement를 이용하도록 변경.

```
public class Atom extends Robot {
	public Atom(String name) {
		super(name);
		RobotActions atomActions = new AtomActions();
		setRobotActions(atomActions);
	}

	public void attack() {
		super.attack();
	}

	public void move() {
		super.move();
	}
}
```

### TaekwonV Class
* 생성자에서 RobotActions를 생성하여 setRobotActions를 호출하도록 변경.
* attack(), move()를 RobotActions implement를 이용하도록 변경.

```
public class TaekwonV extends Robot {
	public TaekwonV(String name) {
		super(name);
		RobotActions taekwonVActions = new TaekwonVActions();
		setRobotActions(taekwonVActions);
	}

	public void attack() {
		super.attack();
	}

	public void move() {
		super.move();
	}
}
```

## main함수에서의 테스트

```
public class testRobotMain {

	public static void main(String[] args) {
		Robot atom = new Atom("atom-1");

		atom.attack();
		atom.move();
		
		Robot taekwonV = new TaekwonV("taekwonV-1");
		
		taekwonV.attack();
		taekwonV.move();
	}

}
```

예상대로(?) 각각에 대해 에러 없이 잘 동작하였다.

아래는 출력된 결과이다.

>I have strong punch and can attack with it.
>
>I can fly.
>
>I have Missile and can attack with it.
>
>I can only walk.

## 정리(보고서 양식에 맞추어...)

### 클래스다이어그램 작성
Robot.java, TaekwonV.java, Atom.java 클래스에 대해 Strategy Pattern을 적용한 결과를 클래스 다이어그램으로 작성하고, 각 클래스를 설명하라

(각 클래스를 Context, Strategy, Concrete Strategy 관점에서 설명.)

---
*Answer*

![Class-diagram Picture](/images/SW4_strategy.PNG)

Robot Context는 Robot Actions라는 Strategy를 이용하여 attack(), move() 함수를 동작시킨다.

각 Concrete Strategy는 Interface를 이용하여 각 attack(), move()함수에 대한 자세한 함수가 구현된다.


### 얻을 수 있는 이점에 대해 설명

*Answer*

힝...

# 2. Observer Pattern 적용하기


## 기존 코드
### DataSheetView

```
import java.util.List;

public class DataSheetView {
	private ScoreRecord scoreRecord;
	private int viewCount;

	public DataSheetView(ScoreRecord scoreRecord, int viewCount) {
		this.scoreRecord = scoreRecord;
		this.viewCount = viewCount;
	}

	public void update() { // 점수의 변경을 통보 받음
		List<Integer> record = scoreRecord.getScoreRecord(); // 점수를 조회함
		displayScores(record, viewCount); // 조회된 점수를 viewCount만큼 출력함
	}

	private void displayScores(List<Integer> record, int viewCount) {
		System.out.print("List of " + viewCount + " entries: ");
		for (int i = 0; i < viewCount && i < record.size(); i++) {
			System.out.print(record.get(i) + " ");
		}
		System.out.println();
	}
}

```
### MinMaxView

```
import java.util.Collections;
import java.util.List;

public class MinMaxView { // 전체 점수가 아니라 최소/최대값만을 출력하는 클래스
	private ScoreRecord scoreRecord;

	public MinMaxView(ScoreRecord scoreRecord) {
		this.scoreRecord = scoreRecord;
	}

	public void update() {
		List<Integer> record = scoreRecord.getScoreRecord();
		displayMinMax(record); // 최소/최대값만을 출력
	}

	private void displayMinMax(List<Integer> record) {
		int min = Collections.min(record, null);
		int max = Collections.max(record, null);
		System.out.println("Min: " + min + " Max: " + max);
	}
}
```

### ScoreRecord

```
import java.util.ArrayList;
import java.util.List;

public class ScoreRecord {
	private List<Integer> scores = new ArrayList<Integer>(); // 점수를 저장함
	private DataSheetView dataSheetView; // 목록 형태로 점수를 출력하는 클래스

	public void setDataSheetView(DataSheetView dataSheetView) {
		this.dataSheetView = dataSheetView;
	}

	public void addScore(int score) { // 새로운 점수를 축함
		scores.add(score); // scores 목록에 주어진 점수를 추가함
		dataSheetView.update(); // scores가 변경됨을 통보함
	}

	public List<Integer> getScoreRecord() {
		return scores;
	}
}
```

## 문제점

아 몰라 그냥 문제가 있어.

## 고친 코드

DataSheetView.java
``` java 
import java.util.ArrayList;
import java.util.List;

public class DataSheetView implements Observer{
	private ScoreRecord scoreRecord;
	private int viewCount;

	public DataSheetView(ScoreRecord scoreRecord, int viewCount) {
		this.scoreRecord = scoreRecord;
		this.viewCount = viewCount;
	}

	public void update() { // 점수의 변경을 통보 받음
		List<Integer> record = scoreRecord.getScoreRecord(); // 점수를 조회함
		displayScores(record, viewCount); // 조회된 점수를 viewCount만큼 출력함
	}

	private void displayScores(List<Integer> record, int viewCount) {
		System.out.print("List of " + viewCount + " entries: ");
		for (int i = 0; i < viewCount && i < record.size(); i++) {
			System.out.print(record.get(i) + " ");
		}
		System.out.println();
	}
} 
```

MinMaxView.java
``` java 
import java.util.Collections;
import java.util.List;


public class MinMaxView implements Observer{ // 전체 점수가 아니라 최소/최대값만을 출력하는 클래스
	private ScoreRecord scoreRecord;

	public MinMaxView(ScoreRecord scoreRecord) {
		this.scoreRecord = scoreRecord;
	}

	public void update() {
		List<Integer> record = scoreRecord.getScoreRecord();
		displayMinMax(record); // 최소/최대값만을 출력
	}

	private void displayMinMax(List<Integer> record) {
		int min = Collections.min(record, null);
		int max = Collections.max(record, null);
		System.out.println("Min: " + min + " Max: " + max);
	}
}
```

Observer.java
``` java 
interface Observer{
	public void update(); 
} 
```

ScoreBoard.java
``` java 
import java.util.ArrayList;
import java.util.List;

interface DataPublisher{
	public void attach(Observer observer);
	public void detach(Observer observer);
	public void notifyObservers();
}
public class ScoreRecord implements DataPublisher{
	private ArrayList<Observer> observers = new ArrayList<>();
	private List<Integer> scores = new ArrayList<Integer>(); // 점수를 저장함 
	
	public void addScore(int score) { // 새로운 점수를 축함
		scores.add(score); // scores 목록에 주어진 점수를 추가함 
		notifyObservers(); 
	}

	public List<Integer> getScoreRecord() {
		return scores;
	}

	
	
	@Override
	public void attach(Observer observer) {
		observers.add(observer); 
	}

	@Override
	public void detach(Observer observer) {
		int index = observers.indexOf(observer);
       observers.remove(index); 
	}

	@Override
	public void notifyObservers() {
		for(Observer ob : observers){
			ob.update();
		} 
	}
}
```

TestObserver.java
``` java

public class TestObserver {
    public static void main(String[] args){
        ScoreRecord sr = new ScoreRecord();

        sr.attach(new DataSheetView(sr, 10));
        sr.attach(new MinMaxView(sr));

        sr.addScore(2);
        sr.addScore(3);
        sr.addScore(4);
        sr.addScore(5);
        sr.addScore(6);

    }
} 
```





### 클래스 다이어그램 작성 및 설명

*solution*

(각 클래스를 Subject, Concrete Subject, Observer, Concrete Observer 관점에서 설명)

### Observer Pattern을 적용함으로써 얻을 수 있는 이점

*solution*

잉...


