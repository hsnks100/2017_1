---
layout: post
title: "behavioral-design-patterns"
author: 코딩도사(hsnks100@gmail.com)
date: 2017-06-15 16:34 +0900
tags: 
comments: true
---
* table of contents
{:toc}



# Strategy Pattern

``` java
public class ScoreProcessing {
    private int min, max ;
    private float average ;
    public void analyze(int[] data) {
        min = max = data[0] ;
        int sum = data[0] ;
        for ( int i = 1 ; i < data.length ; i ++ ) {
            if ( min > data[i] ) min = data[i] ;
            if ( max < data[i] ) max = data[i] ;
            sum += data[i] ;
        }
        average = (float) sum / data.length ;
    }
    public int getMin() { return min; }
    public int getMax() { return max; }
    public float getAverage() { return average; }
} 
```

이 코드는 문제가 있다. analyze 에서 너무 많은 기능을 쓰고 있다. min, max 의 기능을 따로 빼야한다.

별도의 메소드로 min, max 를 빼더라도 문제가 있다. 왜냐면 알고리즘을 바꿀 때 많은 코드 변화를 초래한다.

그래서 Strategy Pattern 을 써야 한다.

```java



import java.util.*;

 interface Statistics {
    public int getMax(int[] data);
    public int getMin(int[] data);
    public float getAverage(int[] data);
}
 class GeneralStatistics
    implements Statistics {
    public int getMax(int[] data) {
        int max = data[0] ;
        for ( int i = 1 ; i < data.length ; i ++ )
            if ( max < data[i] ) max = data[i] ;
        return max ;
    }
    public int getMin(int[] data) {
        int min = data[0] ;
        for ( int i = 1 ; i < data.length ; i ++ )
            if ( min > data[i] ) min = data[i] ;
        return min ;
    }
    public float getAverage(int[] data) {
        int sum = data[0] ;
        for ( int i = 1 ; i < data.length ; i ++ )
            sum += data[i] ;
        float average = (float) sum / data.length ;
        return average ;
    }
}


 class JavaStatistics
    implements Statistics {
    public int getMax(int[] data) {
        int[] copied = Arrays.copyOf(data, data.length) ;
        Arrays.sort(copied) ;
        int max = copied[copied.length-1] ;
        return max ;
    }
    public int getMin(int[] data) {
        int[] copied = Arrays.copyOf(data, data.length) ;
        Arrays.sort(copied) ;
        int min = copied[0] ;
        return min ;
    }
    public float getAverage(int[] data) {
        int sum = getSum(data);
        float average = (float) sum / data.length ;
        return average ;
    }
    private int getSum(int[] data) {
        int sum =0 ;
        for ( int v : data ) sum += v ;
        return sum;
    }
}

class ScoreProcessing {
    private Statistics statistics ;
    private int min, max ;
    private float average ;
    public ScoreProcessing(Statistics statistics){
        this.statistics = statistics;
    }
    public void analyze(int[] data) {
        min = statistics.getMin(data);
        max = statistics.getMax(data);
        average = statistics.getAverage(data);
    }
    public int getMin() { return min; }
    public int getMax() { return max; }
    public float getAverage() { return average; }
}


public class Main {
    public static void main(String[] args) {
        int[] data = {0, 50, 10, 30, 70} ;
        Statistics generalStatistics = new GeneralStatistics();
        ScoreProcessing proc1 = new ScoreProcessing(generalStatistics) ;
        proc1.analyze(data) ;
        System.out.println(proc1.getMin()) ;
        System.out.println(proc1.getMax()) ;
        System.out.println(proc1.getAverage()) ;
        // int[] data = {0, 50, 10, 30, 70} ;
        Statistics javaStatistics = new JavaStatistics() ;
        ScoreProcessing proc2 = new ScoreProcessing(javaStatistics) ;
        proc2.analyze(data) ;
        System.out.println(proc2.getMin()) ;
        System.out.println(proc2.getMax()) ;
        System.out.println(proc2.getAverage()) ;
    }
} 
```

위를 참고하시오.





# Observer Pattern



``` java 
import java.util.List;
import java.util.ArrayList;

 class DataSheetView {
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

 class ScoreRecord {
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

public class Main {
    public static void main(String[] args){
        ScoreRecord sr = new ScoreRecord();

        sr.setDataSheetView(new DataSheetView(sr, 10));
        sr.addScore(2);
        sr.addScore(3);
        sr.addScore(4);
        sr.addScore(5);
        sr.addScore(6); 
    }
} 
```

위의 코드는 문제가 있다. 잘 보면 ScoreBoard 는 DataSheetView 에 notify 를 하고 있는데 만약 DataSheeView 가 아닌 다른 View 가 생긴다면 

ScoreRecord 의 구조를 고쳐야 하는 문제가 있다.

observer pattern 으로 고치면 다음과 같다.
``` java

import java.util.ArrayList;
import java.util.ArrayList;
import java.util.List;
import java.util.List;
import java.util.Collections;
import java.util.List;

class DataSheetView implements Observer{
    /**
     * @uml.property  name="scoreRecord"
     * @uml.associationEnd  multiplicity="(1 1)"
     */
    private ScoreRecord scoreRecord;
    /**
     * @uml.property  name="viewCount"
     */
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


class MinMaxView implements Observer{ // 전체 점수가 아니라 최소/최대값만을 출력하는 클래스
    /**
     * @uml.property  name="scoreRecord"
     * @uml.associationEnd  multiplicity="(1 1)"
     */
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

interface Observer{
    public void update(); 
}

interface DataPublisher{
    public void attach(Observer observer);
        public void detach(Observer observer);
        public void notifyObservers();
}
class ScoreRecord implements DataPublisher{
    /**
     * @uml.property  name="observers"
     * @uml.associationEnd  multiplicity="(0 -1)" elementType="Observer"
     */
    private ArrayList<Observer> observers = new ArrayList<>();
        /**
         * @uml.property  name="scores"
         * @uml.associationEnd  multiplicity="(0 -1)" elementType="java.lang.Integer"
         */
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






# Template Method Pattern


그냥 구체적인 내용은 sub-class 에 맡기는 방법임

``` java
public abstract class ReportGenerator {
    public String generate(List<Customer> customers) {
        List<Customer> selectedCustomers = select(customers) ;
        String report = getReportHeader(selectedCustomers) ;
        for ( int i = 0 ; i < selectedCustomers.size() ; i ++ ) {
            Customer customer = selectedCustomers.get(i) ;
            report += getReportForCustomer(customer) ;
        }
        report += getReportFooter(selectedCustomers) ;
        return report ;
    }
    protected List<Customer> select(List<Customer> customers) {
        List<Customer> selected = new ArrayList<Customer>() ;
        for ( Customer customer: customers )
            if ( customerReportCondition(customer) ) selected.add(customer) ;
        return selected;
    }
    protected abstract boolean customerReportCondition(Customer customer) ;
    protected abstract String getReportHeader(List<Customer> customers) ;
    protected abstract String getReportForCustomer(Customer customer) ;
    protected abstract String getReportFooter(List<Customer> customers) ;
}


 class SimpleReportGenerator extends ReportGenerator {
    protected boolean customerReportCondition(Customer customer) {
        return true ;
    }
    protected String getReportHeader(List<Customer> customers) {
        return String.format("고객의 수: %d 명\n", customers.size()) ;
    }
    protected String getReportForCustomer(Customer customer) {
        return String.format("%s: %d\n", customer.getName(),
                customer.getPoint()) ;
    }
    protected String getReportFooter(List<Customer> customers) {
        return "" ;
    }
}



class ComplexReportGenerator extends ReportGenerator {
    protected boolean customerReportCondition(Customer customer) {
        return customer.getPoint() >= 100 ;
    }
    protected String getReportHeader(List<Customer> customers) {
        return String.format("고객의 수: %d 명입니다\n", customers.size()) ;
    }
    protected String getReportForCustomer(Customer customer) {
        return String.format("%d: %s\n", customer.getPoint(),
                customer.getName()) ;
    }
    protected String getReportFooter(List<Customer> customers) {
        int totalPoint = 0 ;
        for ( Customer customer: customers)
            totalPoint += customer.getPoint() ;
        return String.format("점수 합계: %d", totalPoint) ;
    }
} 
```

이런식으로 하면 됨 ㅇㅇ













