//
//  MySwiftThird.swift
//  SwfitTest
//
//  Created by kingcode on 15/9/27.
//  Copyright (c) 2015年 kingcode. All rights reserved.
//

import Foundation
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