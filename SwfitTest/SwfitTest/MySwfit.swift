//
//  MySwfit.swift
//  SwfitTest
//
//  Created by kingcode on 15/9/25.
//  Copyright (c) 2015年 kingcode. All rights reserved.
//

import Foundation

typealias myfloat = Float32

/**
协议protocol
1.Swift使用protocol定义协议

2.Protocol(协议)用于统一方法和属性的名称，而不实现任何功能。协议能够被类，枚举，结构体实现，满足协议要求的类，枚举，结构体被称为协议的遵循者

3.属性要求

通常前置var关键字将属性声明为变量。在属性声明后写上{ get set }表示属性为可读写的。{ get }用来表示属性为可读的。即使你为可读的属性实现了setter方法，它也不会出错。

protocol SomeProtocol {

var musBeSettable : Int { get set }

var doesNotNeedToBeSettable: Int { get }

}

4.方法要求

协议能够要求其遵循者必备某些特定的实例方法和类方法。协议方法的声明与普通方法声明相似，但它不需要方法内容.

协议方法支持变长参数(variadic parameter)，不支持默认参数(default parameter)。

5.突变方法要求

能在方法或函数内部改变实例类型的方法称为突变方法。在值类型(Value Type)(译者注：特指结构体和枚举)中的的函数前缀加上mutating关键字来表示该函数允许改变该实例和其属性的类型

类中的成员为引用类型(Reference Type)，可以方便的修改实例及其属性的值而无需改变类型；而结构体和枚举中的成员均为值类型(Value Type)，修改变量的值就相当于修改变量的类型，而Swift默认不允许修改类型，因此需要前置mutating关键字用来表示该函数中能够修改类型

用class实现协议中的mutating方法时，不用写mutating关键字；用结构体，枚举实现协议中的mutating方法时，必须写mutating关键字

6.协议类型

协议本身不实现任何功能，但你可以将它当做类型来使用

使用场景：

作为函数，方法或构造器中的参数类型，返回值类型

作为常量，变量，属性的类型

作为数组，字典或其他容器中的元素类型

7.委托(代理)模式

8.在扩展中添加协议成员

9.通过扩展补充协议声明：当一个类型已经实现了协议中的所有要求，却没有声明时，可以通过扩展来补充协议声明

10.集合中的协议类型：协议类型可以被集合使用，表示集合中的元素均为协议类型

11.协议的继承：协议能够继承一到多个其他协议。语法与类的继承相似，多个协议间用逗号,分隔

12.协议合成：一个协议可由多个协议采用protocol<oneProtocol,twoProtocol>这样的格式进行组合，称为协议合成(protocol composition)。

13.检验协议的一致性

使用is检验协议一致性，使用as将协议类型向下转换(downcast)为的其他协议类型

is操作符用来检查实例是否遵循了某个协议。

as?返回一个可选值，当实例遵循协议时，返回该协议类型；否则返回nil

as用以强制向下转换型。

@objc用来表示协议是可选的，也可以用来表示暴露给Objective-C的代码，此外，@objc型 协议只对类有效，因此只能在类中检查协议的一致性。

14.可选协议要求

在协议中使用@optional关键字作为前缀来定义可选成员。

可选协议在调用时使用可选链

可选协议只能在含有@objc前缀的协议中生效。且@objc的协议只能被类遵循。

15.Swift 标准库中定义了一个Equatable协议，该协议要求任何遵循的类型实现等式符（==）和不等符（!=）对任何两个该类型进行比较。所有的 Swift 标准类型自动支持Equatable协议
扩展extension
1.Swift使用extension声明扩展

2.Swift 中的扩展可以：

(1)添加计算型属性和计算静态属性: 扩展可以添加新的计算属性，但是不可以添加存储属性，也不可以向已有属性添加属性观测器(property observers)。

(2)定义实例方法和类型方法 ：扩展可以向已有类型添加新的实例方法和类型方法.通过扩展添加的实例方法也可以修改该实例本身。结构体和枚举类型中修改self或其属性的方法必须将该实例方法标注为mutating，正如来自原始实现的修改方法一样。

(3)提供新的构造器:扩展能向类中添加新的便利构造器，但是它们不能向类中添加新的指定构造器或析构函数。指定构造器和析构函数必须总是由原始的类实现来提供。

(4)定义下标：扩展可以向一个已有类型添加新下标

(5)定义和使用新的嵌套类型：扩展可以向已有的类、结构体和枚举添加新的嵌套类型

(6)使一个已有类型符合某个协议 ：一个扩展可以扩展一个已有类型，使其能够适配一个或多个协议（protocol）
范型<>
1.Swift使用<>来声明泛型函数或泛型类型。

2.Swift支持在类、枚举和结构中使用泛型

3.泛型代码可以让你写出根据自我需求定义、适用于任何类型的，灵活且可重用的函数和类型。它的可以让你避免重复的代码，用一种清晰和抽象的方式来表达代码的意图。

4.泛型函数

func swapTwoValues (inout a: T, inout b: T) {}

占位类型T是一种类型参数的示例。类型参数指定并命名为一个占位类型，并且紧随在函数名后面，使用一对尖括号括起来.可支持多个类型参数，命名在尖括号中，用逗号分开。
类型别名 typealias
1.Swift 使用typealias关键字定义类型别名

2. typealias AudioSample = UInt16
断言assert
1.Swift中用全局函数assert来断言调试2.assert函数接受一个布尔表达式和一个断言失败时显示的消息。如：

let age = -3;

assert(age >= 0, " age cannot < zero")
取余运算符  %
1.Swift允许对浮点数执行取余运算

2. a % b  =>   a =  (b × 最多倍数) + 余数.

b为负值时的b的符号被忽略，这意味着%b和%-b的结果是一样的.

8 % 2.5 = 0.5 ;  =>  (8 = 2.5*3+0.5)
赋值运算符 =

*/

enum myenmu{
    func test(){
        
    }
    case enmu1,e,e1,e2,e3
    //case enmu2
}
func test(){
    var menmu:myenmu
    //let temp = myenmu.e1.rowValue
}
/**
枚举enum
1.枚举可以关联方法

2.使用toRaw和fromRaw在原始数值和枚举值之间进行转换
结构体Struct
1.支持构造器和方法

2.结构和类的最大区别在于：结构的实例按值传递（passed by value），而类的实例按引用传递（passed by reference）

3.结构类型有一种成员逐一完成初始化的构造器,类不存在成员逐一构造器
类 class
1.重写一个由继承而来的方法需要在方法定义前标注override关键词。

2.@final  用来标记一个类不被继承或者一个方法不被重写

3.类型方法

在类结构体里面用class func开头 ，对于枚举和结构来说，类型方法是用static func开头。

4. 便捷初始化.

convenience init() { self.init(name: "[Unnamed]") }

5.weak：弱引用必须声明为变量 及 可选类型

6.unowned：无主引用不能为可选类型
*/
// 输入，输出参数inout
// 由函数修改后，从函数返回替换原来的值,类似于传递的引用
func printAndCont(inout stringToPrint:String)->Int{
    return 3;
}
// 函数,可变参数函数
func matableFunc(names:String...){
    for name in names{
        println(name)
    }
}
/*

*/


func BaseDataTypeTrain(){
    matableFunc()
    matableFunc("wang","xiao","long")
    var myyuzu = (name:"wang",age:9)
    println(myyuzu.name)
//    var (one:Int,_) = yuzu
//    println(yuzu)
    
    var tuple = ("1",1,33)
    println(tuple.0)
    var tu = (1,"ee")
    // 元组
    var (one:Int, two:String) = tu
    
    for temp in 1...4{
        
    }
    for temp in 1...3{
        println(temp)
    }
    /**
    区间
    ..生成 [ ) 的区间，而…生成 [ ] 的区间
    元组（Tuple）
    元组类型可以将一些不同的数据类型组装成一个元素
    
    var yuZu = ( 404 ,  "error" )
    
    println( yuZu )
    
    var ( one:Int , two:String ) = yuZu
    
    println( one )
    
    println( two )
    
    2.使用 _ 来忽略不需要的值
    
    var ( one:Int , _ ) = yuZu
    
    println( one )
    
    3.使用元素序号来选择元组中的值,从0开始
    
    var tuple = ( 404 , "error" )
    
    println( tuple.0 )
    
    4.使用 元组名.元素名 访问
    
    var tuple = ( eN:404 , eT:"error" )
    
    println( tuple.eN )

    */
    
    
    // 字典只有一种创建形式
    var dict1 = Dictionary<String,Int>()
    
    var keys = Array<String>()
    keys = Array(dict1.keys)
    let values = Array(dict1.values)
    for (key , value) in dict1{
        println("key: \(key) value: \(value)")
    }
    //dict1.removeAll("one")
    dict1.removeAll()
    dict1["zero"] = nil
    let oldvalue = dict1.removeValueForKey("wang")
    dict1["am"] = 1
    //dict1["zeor"] = 0
    if let oldValue = dict1.updateValue(1, forKey: "zeor"){
        
    }
// 确定长度
    var array1 = [Double](count: 3, repeatedValue: 0.0)
    var array2 = Array<String>()
    var array0 = [String]()
    for (index,value) in enumerate(array0){
        println("item \(index):\(value)")
    }
    array0.removeAtIndex(0)
    array0[0...2] = []
    array0.insert("zeero", atIndex: 0)
   // Bool isEmpty = array0.isEmpty();
    var count = array0.count
    array0.append("")
   // array0 += "two"
    array0 += ["two","three"]
    // 创建数组
    
    var myarray = [String]();
    var myarray2:[String] = []
    // 1、还是用这种吧
    var myarray1 = Array<String>()
    let mydictionary = Dictionary<String,Int>()
    let myarray3 = Array([])
    var emptyarra = []
    /*
    字典和数组
    1.都用[]
    
    2.空数组 和 空字典
    
    var emptyArray = String[]()  (或者 Array<String>() )
    
    let emptyDictionary = Dictionary<String,Int>()
    
    或者
    
    var emptyArr:String[] = []
    
    或者
    
    var emptyArray = Array([])   //用数组创建数组
    
    对于已知类型的字典可用[:]置空
    
    var arr = []  //直接这样写arr是个空的NSArray
    
    3.确定长度和默认值的数组
    
    var threeDoubles = Double[](count: 3, repeatedValue: 0.0)
    
    4.用只读属性count来读取数组和字典的长度
    
    5.用属性isEmpty检查数组的长度是否为0
    
    6.往数组追加元素
    
    emptyArray.append("one")
    
    emptyArray += "two"
    
    emptyArray += [ "three" , "four" ]
    
    emptyArray.insert("zero" , atIndex:0)
    
    7.从数组中删除元素
    
    let lastElement = emptyArray.removeLast()  //删除最后一个
    
    let indexElement = emptyArray.removeAtIndex(3) //按索引删除
    
    emptyArray[0...2] = []  //区间元素替换
    
    8. 遍历数组
    
    for (index, value) in enumerate(emptyArray) {
    
    println("Item \(index): \(value)")
    
    }
    
    9. 给字典增加元素
    
    emptyDictionary["zero"] = 0
    
    if let oldValue = emptyDictionary.updateValue(1, forKey: "one") {
    
    println("The old value for key:one was \(oldValue).")
    
    } //增加或更新元素
    
    10.移除字典元素
    
    emptyDictionary["zero"] = nil
    
    let oldValue = emptyDictionary.removeValueForKey("one")
    
    emptyDictionary.removeAll()
    
    11.遍历字典
    
    for (key, value) in dic {
    
    println("\(key): \(value)")
    
    }
    
    12.获取字典的keys和values
    
    let keys = Array(dic.keys)
    
    let values = Array(dic.values)
    
    13.数组的copy方法
    
    通过调用数组的copy方法来完成强制拷贝。这个方法将会完整复制一个数组到新的数组中。
    
    14.数组的unshare方法
    
    如果多个变量引用了同一个数组，可以使用unshare方法来完成一次“独立”
    区间
    ..生成 [ ) 的区间，而…生成 [ ] 的区间

    */
}
//enum MyEnum{
//    MyEnum1,
//    MyEnum2,
//    MyEnum3
//}
//struct Dog {
//    var name:String?
//    var hoster:String?
//
//}
/**
Swift数据类型
1.基础数据类型：整形Int、浮点数Double和Float、布尔类型Bool，字符串类型String。

2.集合数据类型，Array和Dictionary

3.元组类型

4.结构体struct，枚举enum，类：class

5.数值类型 和 引用类型

（1）数值类型是说当它被赋值给一个常量或者变量，或者作为参数传递给函数时，是完整地复制了一个新的数值，而不是仅仅改变了引用对象。

（2）所有Swift中的基础类型-整型，浮点型，布尔类型，字符串，数组和字典都是数值类型。它们也都是由结构来实现的。

（3）在Swift中所有的结构和枚举类型都是数值类型。这意味这你实例化的每个结构和枚举，其包含的所有属性，都会在代码中传递的时候被完整复制。

（4）类 和 函数 闭包 是引用类型

（5）当一个值类型实例作为常量而存在，它的所有属性也作为常量而存在。类是引用类型。如果你将引用类型的实例赋值给常量，依然能够改变实例的变量属性。
？和 ！
参见博文：http://joeyio.com/ios/2014/06/04/swift---/

字典和数组
1.都用[]


*/

var name:String?
func setname(){
//    let score:Dictionary<"","">
//    let arms:Array<"">
    name = "wangxiaolong"
    print(name);
    let age:Int
    let height:Double
    let isMan:Bool
    let address:String
    
    
    
    
    
    
}
