//
//  MySwfit.swift
//  SwfitTest
//
//  Created by kingcode on 15/9/25.
//  Copyright (c) 2015年 kingcode. All rights reserved.
//

import Foundation
// 函数
func matableFunc(name:String...){
    
}



func BaseDataTypeTrain(){
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
