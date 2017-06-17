---
layout: post
title: "structural-design-pattern"
author: 코딩도사(hsnks100@gmail.com)
date: 2017-06-15 19:08 +0900
tags: 
comments: true
category: designpattern
---
* table of contents
{:toc}



# composite pattern

``` java



import java.util.*;
class File {
    private String name ;
    private int size ;
    public File( String name, int size ) {
        this.name = name ; this.size = size ;
    }
    String getName() { return name ; }
    public void ls(int indent) {
        for (int i=0; i < indent; i++)
            System.out.print(' ');
        System.out.println("[File] " + name + ':' + size) ;
    }
    public int getSize() { return size ; }
}

 class Directory {
    private String name ;
    private List<Object> elements = new ArrayList<Object>();
    public Directory( String name ) { this.name = name ; }
    String getName() { return name ; }
    public void add( Object element ) { elements.add(element); }
    public void ls(int indent) {
        for (int i=0; i < indent; i++) System.out.print(' ');
        System.out.println("[Directory] " + name + ':' + getSize()) ;
        indent += 3;
        for (int i=0; i < elements.size() ; i++) {
            Object o = elements.get(i) ;
            if ( o instanceof Directory )
                ((Directory)o).ls(indent);
            else if(o instanceof File) 
                ((File)o).ls(indent) ;
            else if(o instanceof FileShortCut)
                ((FileShortCut)o).ls(indent);
        }
        indent -= 3;
    }

    public int getSize() {
        int totalSize = 0 ;
        for (int i=0; i < elements.size() ; i++) {
            Object o = elements.get(i) ;
            if ( o instanceof Directory )
                totalSize += ((Directory)o).getSize();
            else if ( o instanceof File) {
                totalSize += ((File)o).getSize();
            }
            else if(o instanceof FileShortCut) {
                totalSize += ((FileShortCut)o).getSize();
            }
        }
        return totalSize;
    }
}


 class FileShortCut {
    private String name ;
    private Object target ;
    public FileShortCut( String name, Object target ) {
        this.name = name ; this.target = target ;
    }
    public String getName() { return name ; }
    public void ls(int indent) {
        for (int i=0; i < indent; i++) System.out.print(' ');
        String targetName ;
        if ( target instanceof Directory )
            targetName = ((Directory)target).getName() ;
        else
            targetName = ((File)target).getName() ;
        System.out.println("[File ShortCut] " + name + " to " + targetName) ;
    }
    public int getSize() { return 0 ; }
}






public class Main {
    public static void main(String[] args) {
        Directory dir1 = new Directory("Dir1");
        Directory dir2 = new Directory("Dir2");
        File fileA = new File("File-a", 10);
        FileShortCut fileB = new FileShortCut("File-d1", dir1);
        File fileC = new File("File-c", 30);
        FileShortCut fileD = new FileShortCut("File-Sb", fileA);
        dir1.add( (Object) fileA );
        dir1.add( (Object) dir2 );
        dir1.add( (Object) fileB );
        dir2.add( (Object) fileC );
        // dir2.add( (Object) fileD );
        dir1.ls(0);
    }
}


```

위와 같이 dip 과 lsp 문제가 있다. 


``` java


import java.util.*;
abstract class DirectoryElement {
    protected String name ;
    public DirectoryElement(String name) { this.name = name ; }
    public String getName() { return name; }
    public abstract void ls(int indent) ;
    public abstract int getSize() ;
}

 class File extends DirectoryElement {
    private int size ;
    public File( String name, int size ) {
        super(name) ; this.size = size ;
    }
    public int getSize() { return size ; }
    public void ls(int indent) {
        for (int i=0; i < indent; i++) System.out.print(' ');
        System.out.println("[File] " + name + ':' + size) ;
    }
}

 class Directory extends DirectoryElement {
    private List<DirectoryElement> elements =
        new ArrayList<DirectoryElement>();
    public Directory( String name ) { super(name) ; }
    public void add( DirectoryElement element ) { elements.add(element); }
    public int getSize() {
        int totalSize = 0 ;
        for (int i=0; i < elements.size() ; i++)
            totalSize += elements.get(i).getSize();
        return totalSize;
    }
    public void ls(int indent) {
        for (int i=0; i < indent; i++) System.out.print(' ');
        System.out.println("[Directory] " + name + ':' + getSize()) ;
        indent += 3;
        for (int i=0; i < elements.size() ; i++)
            elements.get(i).ls(indent) ;
        indent -= 3;
    }
}



class FileShortCut extends DirectoryElement {
    private DirectoryElement target ;
    public FileShortCut( String name, DirectoryElement target ) {
        super(name) ; this.target = target ;
    }
    public int getSize() { return 0 ; }
    public void ls(int indent) {
        for (int i=0; i < indent; i++) System.out.print(' ');
        System.out.println("*shortcut [File] " + name + ':' + target.getName()) ;
    }
}





public class Main {
    public static void main(String[] args) {
        Directory dir1 = new Directory("Dir1");
        Directory dir2 = new Directory("Dir2");
        File fileA = new File("File-a", 10);
        FileShortCut fileB = new FileShortCut("File-d1", dir1);
        File fileC = new File("File-c", 30);
        FileShortCut fileD = new FileShortCut("File-Sb", fileA);
        dir1.add( fileA );
        dir1.add( dir2 );
        dir1.add(  fileB );
        dir2.add( fileC );
        dir2.add( fileD );
        dir1.ls(0);
    }
}

```

깔끔하게 위와 같이 하면 됨.



Shape 예제
``` java

import java.util.*;


import java.awt.Point;



 abstract class Shape {
    public abstract int getLength() ;
    public abstract void draw() ;
}


 class Line extends Shape {
    private Point leftTop, rightBottom ;
    public Line(Point leftTop, Point rightBottom) {
        super();
        this.leftTop = leftTop;
        this.rightBottom = rightBottom;
    }
    public int getLength() {
        int diffX = (int)(rightBottom.getX() - leftTop.getX());
        int diffY = (int)(rightBottom.getY() - leftTop.getX()) ;
        int length = (int) Math.sqrt(diffX*diffX + diffY*diffY) ;
        return length ;
    }
    public void draw() {
        System.out.println("[Line] from " + leftTop + " to "
                + rightBottom + ", length " + getLength()) ;
    }
}

 class Circle extends Shape {
    private Point center ;
    private int radius ;
    public Circle(Point center, int radius) {
        super();
        this.center = center;
        this.radius = radius;
    }
    public int getLength() {
        int length = (int) (2 * Math.PI * radius) ;
        return length ;
    }
    public void draw() {
        System.out.println("[Circle] with center " + center +
                ", radius " + radius + ", length " + getLength()) ;
    }
}
 class Rectangle extends Shape {
    private Point leftTop, rightBottom ;
    public Rectangle(Point leftTop, Point rightBottom) {
        super();
        this.leftTop = leftTop;
        this.rightBottom = rightBottom;
    }
    public int getLength() {
        int diffX = (int)(rightBottom.getX() - leftTop.getX());
        int diffY = (int)(rightBottom.getY() - leftTop.getX() );
        int length = 2*diffX + 2*diffY ;
        return length ;
    }
    public void draw() {
        System.out.println("[Rectangle] with " + leftTop +
                " and " + rightBottom + ", length " + getLength()) ;
    }
}
 class ShapeGroup extends Shape {
    private List<Shape> shapes = new ArrayList<Shape>() ;
    private String name;
    public ShapeGroup(String name) { this.name = name ; }
    public void addShape(Shape shape) { shapes.add(shape) ; }
    public int getLength() {
        int totalLength = 0 ;
        for ( int i = 0 ; i < shapes.size() ; i ++ )
            totalLength += shapes.get(i).getLength() ;
        return totalLength ;
    }
    public void draw() {
        System.out.println("Group name: " + name + " with Length "
                + getLength()) ;
        for ( int i = 0 ; i < shapes.size() ; i ++ ) shapes.get(i).draw() ;
    }
}
public class Main {
    public static void main(String[] args) {
        ShapeGroup group1 = new ShapeGroup("G1") ;
        Point p_0_0 = new Point(0, 0) ;
        Point p_10_10 = new Point(10, 10) ;
        group1.addShape(new Line(p_0_0, p_10_10)) ;
        ShapeGroup group2 = new ShapeGroup("G2") ;
        group1.addShape(group2) ;
        group2.addShape(new Rectangle(p_0_0, p_10_10)) ;
        group1.addShape(new Circle(p_10_10, 10)) ;
        group1.draw() ;
        System.out.println(group1.getLength()) ;
    }
} 

```




# facade pattern


표면 같은거

``` java

HomeTheaterFacade {
    Amplifier amp;
    Tuner tuner;
    Dvdplayer dvd;
    CdPlayer cd;
    Projector projector;
    TheaterLights lights;
    Screen screen;
    PopcornPopper popper;

    public HomeTheaterFacade( Amplifier amp,
            Tuner tuner, 
            DvdPlayer dvd,
            CdPlayer cd,
            Projector projector,
            Screen screen,
            TheaterLights lights,
            PopcornPopper popper) {
        this.amp = amp;
        this.tunner = tuner;
        this.dvd = dvd;
        this.cd = cd;
        this.projector = projector;
        this.screen = screen;
        this.lights = lights;
        this.popper = popper;
    }

    public void watchMovie (String movie) {
        System.out.println("Get ready to watch a movie...");
        popper.on();
        popper.pop();
        lights.dim(10);
        screen.down();
        projector.on();
        projector.wideScreenMode();
        amp.on();
        amp.setDvd(dvd);
        amp.setsurroundSound();
        amp.setVolume(5);
        dvd.on();
        dvd.play(movie);
    }

    public void endMovie() {
        System.out.println("Shutting movie theater down...");
        popper.off();
        lights.on();
        screen.up();
        projector.off();
        amp.off();
        dvd.stop();
        dvd.eject();
        dvd.off();
    }

}


public class HomeTheaterTestDrive {
    public static void main(String[] args) {
        // instantiate components here
        HomeTheaterFacade homeTheater  =
            new HomeTheaterFacade(amp, tuner, dvd, cd, projector, screen, lights, popper);
        homeTheater.watchMovie("타짜");
        homeTheater.endMovie();

    }
}

```





