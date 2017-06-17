---
layout: post
title: "creational-design-patterns"
author: 코딩도사(hsnks100@gmail.com)
date: 2017-06-15 18:42 +0900
tags: 
comments: true
category: designpattern
---
* table of contents
{:toc}


# Factory Pattern


``` java
ElevatorScheduler scheduler ;
// 0..23
int hour = Calendar.getInstance().get(Calendar.HOUR_OF_DAY) ;
if ( hour < 12 ) // 오전
    scheduler = new ResponseTimeScheduler() ;
    else // 오후
    scheduler = new ThroughputScheduler() ;
    ElevatorManager em = new ElevatorManager(2, scheduler) ;
    em.requestElevator(10, Direction.UP) ; 
    ```

    이 코드는 고객의 요구가 바뀔 때 대응하기 힘들다 그래서 아래 코드 스타일로...

    ``` java
    import java.util.ArrayList;
    import java.util.Calendar;
    import java.util.List;
    enum Direction {
        UP, DOWN
    }

class ElevatorController {
    private int id;
    private int curFloor;

    public ElevatorController(int id) {
        this.id = id;
        curFloor = 1;
    }

    public void gotoFloor(int destination) {
        System.out.print("Elevator [" + id + "] Floor: " + curFloor);
        // 현재 층 갱신, 즉 주어진 목적지 층으로 엘리베이터가 이동함
        curFloor = destination;
        System.out.println(" ==> " + curFloor);
    }
}
interface ElevatorScheduler {
    public int selectElevator(ElevatorManager manager, int destination, Direction direction);
}
class ElevatorScheduleSelector{
    public static ElevatorScheduler selectScheduler(int destination, Direction direction){
        ElevatorScheduler scheduler;
        // 0..23
        int hour = Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
        if (hour < 12) // 오전에는 ResponseTimeScheduler를 이용함
            scheduler = new ResponseTimeScheduler();
        else // 오후에는 ThroughtputScheduler를 이용함
            scheduler = new ThroughputScheduler();

        return scheduler;
    } 
}


class ResponseTimeScheduler implements ElevatorScheduler {
    public int selectElevator(ElevatorManager manager, int destination, Direction direction) {
        return 1; // 임의로 선택한다.
    }
}

class ThroughputScheduler implements ElevatorScheduler {
    public int selectElevator(ElevatorManager manager, int destination, Direction direction) {
        return 0; // 임의로 선택한다.
    }
}
public class ElevatorManager {
    private List<ElevatorController> controllers;

    public ElevatorManager(int controllerCount) {

        controllers = new ArrayList<ElevatorController>(controllerCount) ;
        for ( int i = 0 ; i < controllerCount ; i ++ ) {
            ElevatorController controller = new ElevatorController(i+1) ;
            controllers.add(controller) ;
        }
    }


    void requestElevator(int destination, Direction direction) {
        ElevatorScheduler scheduler = ElevatorScheduleSelector.selectScheduler(destination, direction);
        int selectedElevator = scheduler.selectElevator(this, destination, direction);
        controllers.get(selectedElevator).gotoFloor(destination);
    }
}

``` 

# Factory Pattern2

``` java

abstract class Namer {
    protected String last;
    protected String first;
    public String getFirst() {
        return first;
    }
    public String getLast() {
        return last;
    }
}



//last, first
class LastFirst extends Namer {
    public LastFirst(String name) {
        int i = name.lastIndexOf(",");
        if (i > 0) {
            last = name.substring(0, i).trim();
            first =name.substring(i+1).trim();
        }
        else {
            first = "";
            last = name;
        }
    }
}
// first last
class FirstFirst extends Namer {
    public FirstFirst(String name) {
        int i = name.lastIndexOf(" ");
        if ( i > 0 ) {
            first = name.substring(0, i).trim();
            last =name.substring(i+1).trim();
        }
        else {
            first = "";
            last = name;
        }
    }
}



public class Main {
    public static void main(String[] args) {
        String name = "Hong, Kildong" ;
        Namer namer ;
        int i = name.indexOf(",");
        if ( i > 0 )
            namer = new LastFirst(name);
        else
            namer = new FirstFirst(name);
        System.out.println("Last name: " + namer.getLast() +
                ", First name: " + namer.getFirst()) ;
    }
} 
```

어떤 클래스를 호출할지 결정하는데 Main 이 너무 많은일을 하고 있다.

``` java



abstract class Namer {
    protected String last;
    protected String first;
    public String getFirst() {
        return first;
    }
    public String getLast() {
        return last;
    }
}



//last, first
class LastFirst extends Namer {
    public LastFirst(String name) {
        int i = name.lastIndexOf(",");
        if (i > 0) {
            last = name.substring(0, i).trim();
            first =name.substring(i+1).trim();
        }
        else {
            first = "";
            last = name;
        }
    }
}
// first last
class FirstFirst extends Namer {
    public FirstFirst(String name) {
        int i = name.lastIndexOf(" ");
        if ( i > 0 ) {
            first = name.substring(0, i).trim();
            last =name.substring(i+1).trim();
        }
        else {
            first = "";
            last = name;
        }
    }
}

class NameFactory {
    public Namer getInstance(String name) {
        int i = name.indexOf(",");
        if (i>0)
            return new LastFirst(name); //return one class
        else
            return new FirstFirst(name); //or the other
    }
}



public class Main {
    public static void main(String[] args) {
        NameFactory nameFactory = new NameFactory() ;
        Namer lastNamer = nameFactory.getInstance("Hong, Kildong") ;
        System.out.println("Last name: " + lastNamer.getLast() +
                ", First name: " + lastNamer.getFirst()) ;
        Namer firstNamer = nameFactory.getInstance("Kildong Hong") ;
        System.out.println("Last name: " + firstNamer.getLast() +
                ", First name: " + firstNamer.getFirst()) ;

    }
}

```

이렇게 바꿀 수 있다^^


# Abstract Factory Pattern

일반 Factory Pattern 과 같은데 그냥 Factory class 가 abstract 로 되고 

그 sub-class 에서 세부적인 class 를 return 하는 형태다.


``` java
public class UI {
    private Button _button ;
    private Menu _menu ;
    private Factory _factory ;
}
public UI(Factory factory ) { _factory = factory ; }
public void Create() {
    _button = _factory.CreateButton() ;
    _menu = _factory.CreateMenu() ;
}
public void Draw() { _menu.draw() ; }
public void Click() { _button.clicked() ; }
```

대강 작성하면 이런형태가 되겠지. 이 때Factory 는 abstract class.

# Singleton Pattern


``` java

public class HyundaiElevatorFactory extends ElevatorFactory {
    private static ElevatorFactory factory ;
    private HyundaiElevatorFactory() {}
    public static ElevatorFactory getInstance() {
        if ( factory == null )
            factory = new HyundaiElevatorFactory() ;
        return factory ;
    }
    public Motor createMotor() { return new HyundaiMotor() ; }
    public Door createDoor() { return new HyundaiDoor() ; }
} 

```

Factory 랑 singleton pattern 하고 결합한 모습.







