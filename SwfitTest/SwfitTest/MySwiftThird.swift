//
//  MySwiftThird.swift
//  SwfitTest
//
//  Created by kingcode on 15/9/27.
//  Copyright (c) 2015年 kingcode. All rights reserved.
//

import Foundation
/*
9.结构体的构造器代理Initializer Delegation

构造器代理：

在构造器中调用另外一个构造器来完成初始化工作

为了方便构造实例
*/

// 构造器
/**
/*语法：

1.当创建一个实例时，实例的构造器一定会被调用

2.一个类型中至少会有一个构造器，如果没有，编译器会帮我们自动生成一个

3.构造器方法中的每一个参数名都默认为既是内部名，也是外部名

4. 一个类型的构造器可以有多个,多个构造器之间形成重载(overload)关系

5. 构造器是自动调用的,不允许程序员主动调用

*/

*/
class Teacher {
    // 类中的属性要么是饿可选择
    var name:String?
    // 要么是默认值
    var age = 2
    var isman:Bool = true
    // 要么再init进行初始化
    init(name:String,age:Int,isman:Bool){
        self.name = name
        self.age = age
        self.isman = isman
    }
}
func studentTest(){
    var student = Student(name: "", age: 2)
    var s = Student("",3)
}
struct Student {
    var name:String?
    var age:Int?
    init(name:String,age:Int){
        self.name = name
        self.age = age
    }
    // _隐藏外部
    init(_ name:String,_ age:Int){
        self.name = name
        self.age = age
    }
}
/**

将具体的实现隐藏起来，只给外界公开访问接口

@interface Sample : NSObject

@property(nonatomic, strong, readonly) NSString *name;

@end



@interface Sample ()

//在.m中，将属性name重新声明为可读可写

@property(nonatomic, strong, readwrite) NSString *name;

@end

*/

// 继承重写
/**
子类(Sub class)  父类(Super class)  基类(Base class)

Swift中，继承是单继承的。但是,Swift中的类并不一定非得有父类。Swift没有类似NSObject的根类，没有父类的类叫基类。
*/
class A{
    // 存储属性
    var name = ""
    // 计算属性
    var age:String{
        return ""
    }
    
     func A(){
        
    }
}
class B:A {
    // 方法覆盖
    override func A(){
        
    }
    // 存储属性不能重写
   // override var name = "dd"
    // 重写计算属性
    override var age:String{
    return "edd"
    }
    
    // 结合继承给存储属性添加监视器，必须加上overide
    override var name:String{
        willSet{
            
        }
        didSet{
            
        }
    }
    
}
func jichengtest(){
    var jia:A = B()
    // 存储属性不能重写
    

}
// 私有，公有类不能写在方法里
private class pricateclass{
    
}

public class publicclass{
    // 再任何位置都可以访问，
    public var propA:Int = 0
    // 再本模块，本项目内部访问缺省internal
    var propB:Int = 0
    // 私有属性，只能再本类中访问
    private  var propC:Int = 0
    
    public func MethodA(){
        
    }
    private func MehtodB(){
        
    }
    //新语法：
    
    //属性count的set是私有的，而get是公开的（这个属性只有我自己能改，但大家不能修改，只可读）
    
    public private(set) var count : Int = 0
}

func fangwenkongzhi(){
    // 私有类
        // 公有类
   
}

func juzheng(){
    struct Metrix{
        var grid:[Double]
        let rows:Int
        let cols:Int
        // 初始化方法
        init(rows:Int,cols:Int){
            self.rows = rows
            self.cols = cols
            self.grid = Array<Double>(count: rows * cols, repeatedValue:0.0)
        }
        subscript(row:Int,col:Int)->Double{
            set{
                //assert(true, "")
                grid[rows * cols + cols] = newValue
            }
            get{
                return grid[rows * cols + cols]
            }
        
        }
    }
    var m = Metrix(rows: 3, cols: 3)
    m[0,2] = 39
    m[0,1] = 33
    
}


func SubscriptyTest(){
// 下标运算
class MyArray{
    var array = [Int]()
    func add(x:Int){
        array.append(x)
    }
    var size:Int{
        return array.count
    }
    // 类就支持下标运算了
    subscript(index:Int)->Int{
        get{
            return array[index]
        }
        set{
            array[index] = newValue
        }
    }
}
    var array = MyArray()
    array.add(3)
    array.size
    array[3] = 3
    array[1] = 1
    
}
func StructTest(){
    struct Point{
        var x = 0.0,y = 0.0
        //struct中的方法默认为只读方法，只能读取当前实例的属性的值，不能修改属性的值
        
        //但是，如果方法前加了关键字mutating，那么方法就可以修改属性的值了,加了mutating method的方法就是变异方法
        
        // 变异方法 只用于值类型（struct,enum）
        mutating func moveByX(_x:Double, y _y:Double) {
            
            x += _x
            
            y += _y
            
        }
        static func TypeMethod(){
            println("结构体静态方法")
        }

    }
}

// 方法
class Counter{
    var count = 0
    var x = "",y = ""
    func setX(x:String,y:String){
        self.x = x
        self.y = y
    }
    // 类方法 同OC+
    class func functest() {
        
        println("leifangfa")
    }
    
    // 实例方法可访问实例变量
    func increment(){
        count++
    }
    // #内部名
    func incrementBy(#amount:Int){
        count += amount
    }
    // 方法重载
    func incrementBy(amout:Int,numberOfTimes:Int){
        count += amout * numberOfTimes
    }
    func incrementyBy(testint amout:String,testint2 amount2:String){
        x = amout
        y = amount2
    }
}
func classTest(){
    var count = Counter()
    count.increment()
    count.incrementBy(amount: 2)
    count.incrementBy(2, numberOfTimes: 4)
    count.incrementyBy(testint: "", testint2: "")
    
}

// 实例属性和类型属性,类结构体通用
//不加static的是实例属性，加static的是类型属性。实例属性只能通过实例来访问，不能通过类型来访问。同样，类型属性只能通过类型来访问，不能通过实例来访问
class testclass{
    // 实例属性
    var name:String = "wag"
    // 类型属性
    static var age:Int = 0
    // 是计算类型属性
    static var jisuanleixngshxing:Int{
    return 199
    }
}

// 属性监视器，属性发生改变，也就是必须哟值父给他
func jububianliang(){
    //
    var jububianliang:Int = 9{
        willSet{
            println("\(newValue)")
        }
        didSet{
            println("\(oldValue)")
        }
    }
}
// 全局=变量也可以添加监视器
var globe:Int = 0{
willSet{
    println("\(newValue)")
}
didSet{
    println("\(oldValue)")
}
}
// 属性监视器 观察器
var indicator:Int = -1999
class StepCounter {
    // 一个属性租多可以有两个属性观察其，一个willset，一个didset
    var totalStep:Int = 0{
        willSet{
            //属性变化前调用
            println("属性马上变成 \(newValue)")
            indicator = newValue
        }
        didSet{
            // 属性发生变化后调用
            println("属性变化前的值\(oldValue)")
            indicator = oldValue
        }
    }
}


// 延迟属性
class DataImporter{
    var mucnFiles = "data.Text"
}
class DataManager {
    ////这是一个延迟加载属性，只有当读取这个属性的值时才会加载到内存。这个属性加载时太慢了,且会占用大量的内存,所以,能不加载就不加载
    lazy var importer = DataImporter()
}
func temp(){
    let manger = DataManager()
    var test:DataImporter = manger.importer//此时必须加载属性的内容
}

// 存储属性和计算属性
struct SHUXING{
    var firstValue:Int //存储属性，再内存中有控件保留值
    let length:Int // 常量属性
}
func SHUXING1(){
    var shxing = SHUXING(firstValue: 0, length: 4)
    //shxing.length = 3
}


func JietouTI(){
    struct Point{
        var X:Float
        var Y:Float
        
    }
    struct Size{
        var Width:Float
        var Height:Float
    }
    struct MFrame{
        var point:Point
        var size:Size
        
        // center 计算属性
        var center:Point{
            get{
                
                let centerX = point.X + size.Height / 2
                let centerY = point.Y + size.Width / 2
                return Point(X: centerX, Y: centerY)
            }
            set(p){
                
                let originX = p.X - size.Width / 2
                let originY = p.Y - size.Height / 2
                point = Point(X: originX, Y: originY)
            }
        }

    }
    let frame = MFrame(point: Point(X: 3, Y: 3), size: Size(Width: 3, Height: 3))
}
//结构体的逐一构造器

struct Point {
    
    var x : Float
    
    var y : Float
    
}

//Swift要确保实例中的属性都有初始值

let point = Point(x:10, y:20)


// 类和结构
// 基础数据都是结构体类型
/*
var i : Int

var f : Float

var s : String

var a : Array

var d : Dictionary

var set : Set
*/
//结构体是值类型
struct Resolution {
    var width = 0 // 属性
    var height = 0
}
//类是引用类型
class VideoMode {
    var resolution = Resolution()// 属性
    var inerloaced = false // 逐行
    var name:String? //可选值属性
}

//专门用于判断两个引用是否指向了同一个对象的运算符:===

//不可以使用==来判断两个引用是否指向同一个对象

//==是用来判断两个对象的内容是否相等(相当于OC中的isEqual方法),要使用==，必须重写==运算符函数




func Bfunc(){
    var someReso = Resolution()
    someReso.width = 1024
    someReso.height = 748
    var someVie = VideoMode()
    someVie.resolution = someReso
    var otherMode = VideoMode()
    if someVie === otherMode {
        
        println("这两引用指向了同一个对象")
        
    }
    
}


// 枚举
enum Myenum{
    case North
    case South
    case East
    case West
}
func Fenum(){
    // 原始值，（Raw Value），裸值
    enum Week:Int{
        case SUN = 0
        case MON = 1,THE,WED,THU,FRI,SAT
    }
    var w : Week
    w = .SUN
    // 枚举值 -》原始值
    let sunValue:Int = w.rawValue
    println("\(sunValue)")
    w = .WED
    w.rawValue
    // 原始值 -》 枚举值
    let week = Week(rawValue: 5)// 可选值
    if week == .FRI{
        
    }
    
    var direction:Myenum
    // 不能推断时需要写全
    direction = Myenum.North
    // 自动类型判断
    direction = .North
    
    switch direction{
    case .North:
        println("")
    case .South:
        println("")
    case .East:
        println("")
    default:
        println("")
    }
    
    //时机开发中使用枚举, .System是一个枚举值
    
   // var button: UIButton = UIButton.buttonWithType(.System) as! UIButton
}

// 闭包本质就是函数，凡事函数的地方哪个都可以用闭包
func Closures(){
    var a = [4,1,2,5,3,9,0,6,8,7];
    //闭包的本质是函数,凡是要函数的地方都可以给闭包
    myclosure(wang:{(a:Int,b:Int)->Int in
        return 1
        }
    )
    myclosure(wang:{
        (a:Int,b:Int)->Int in
        return 1
        })
    myclosu({(a:Int,b:String)->String in
    return ""})
}
func myclosure(wang myf:(Int,Int)->Int){

}

func myclosu(mycloo:(Int,String)->String){
    
}
/*
闭包表达式的语法如下：

{

(parameters)->returnType    in

语句...

return xxx

}



OC中的Block：

^returnType(parameters){

//…

return xxx;

}



1.闭包1

import UIKit



func rule(a:Int, b:Int)->Bool {

return a > b

}


f: {(a:Int,b:Int)->Bool in

return a > b

}
func sortInts(inout data:[Int], f:(Int,Int)->Bool = rule ){

for var i=0; i
for var j=0; j
if f(data[j],data[j+1]) {

swap(&data[j], &data[j+1])

}

}

println("\(data)")

}

}



var a = [4,1,2,5,3,9,0,6,8,7];

//闭包的本质是函数,凡是要函数的地方都可以给闭包

sortInts(&a, f: {(a:Int,b:Int)->Bool in

return a > b

})

println("\(a)")



//Swift的类型推断功能可以推断出闭包中的参数和返回值类型,所以可以不用提供

sortInts(&a, f: {(a,b) in return a > b})



//当闭包中只是一条语句时，return可以省略不写

sortInts(&a, f: {(a,b) in a > b})

//闭包中的参数可以直接使用$0,$1,$2...来代替

sortInts(&a, f: {$0 > $1})

//如果只有两个参数,可以将参数直接省略

sortInts(&a, f: <)

println("\(a)")





2.闭包2

import UIKit



var a = [3,2,1,4,9,8,0,5,7,6]

sort(&a, {(x, y) in return x%3 < y%3})

println("\(a)")



sort(&a, {$0 < $1})

println("\(a)")



sort(&a, >)

println("\(a)")



let r1 = sorted(a, {$0 < $1})

println("\(r1)")



var names = ["aaa","bbb","ccc"]

sort(&names, <)

println("\(names)")



//拖尾闭包（Trailing Closures）

//最后一个参数

sort(&a) {

(x, y)->Bool in return x%3 < y%3

}

*/
/*
闭包：

Swift ==> Closures

Smalltalk   Ruby  OC   ==> Block

Python C++(11) Lisp  ==> Lambda

Javascript (JS) ==>  Anonymous Function(匿名函数)



Swift中的闭包本质上是一个函数，一般将闭包函数称为闭包表达式。

*/