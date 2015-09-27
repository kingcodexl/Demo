//
//  MySwiftSecond.swift
//  SwfitTest
//
//  Created by kingcode on 15/9/26.
//  Copyright (c) 2015年 kingcode. All rights reserved.
//

import Foundation

func AFuncYuanzu(){
    // 集合类型，无需
    // 需要有初始值
    var Aset = Set("dd")
    Aset.insert("d")
    // 清空
    Aset = []
    
    ////6.数组是值类型的
    var Aaarray = [String]()
    var Aarray:Array = ["wnag","wang"]
    var Aarrayt1 = ["wang","wag"]
    var Aarry3 = Array<String>()
    Aarray.append("wang")
    // 加记得是同一类型才能
    Aarray += [" "]
    Aarray.insert("dd", atIndex: 0)
    Aarray.removeAll(keepCapacity: true)
    Aarray.removeAtIndex(1)
    ///包括2但不包括4，删除2不删除4
    Aarray.removeRange(Range(start: 2, end: 4))
    Aarray[0] = "dd"
    Aarray[3...4] = ["d","d"]
    // 清空
    Aarray = []
    
    //where子句,用于switch中
    let yetPoint = (1, 1)
    
    switch yetPoint {
        
    case let(x, y) where x == y:
        
        println("点(\(x),\(y))在x==y这条线上")
        
    case let(x, y) where x == -y:
        
        println("点(\(x),\(y))在x==-y这条线上")
        
    case let(x, y):
        
        println("点(\(x),\(y))不在这两条斜线上")
    }
    /*
    
    
    
    var shoppingList : [String] = ["Watch", "iPhone6+", "牙刷", "牙膏"]
    
    
    
    //1.查
    
    shoppingList.count
    
    shoppingList.isEmpty
    
    
    
    //遍历数组
    
    for shopping in shoppingList {
    
    println("\(shopping)")
    
    }
    
    //遍历数组并获取每个元素的下标
    
    for (index, shopping) in enumerate(shoppingList) {
    
    println("\(index) : \(shopping)")
    
    }
    
    //使用下标运算获取元素
    
    for var i = 0; i < shoppingList.count; i++ {
    
    println("\(i) : \(shoppingList[i])")
    
    }
    
    
    
    //2.增
    
    shoppingList.append("面包")
    
    shoppingList.count
    
    shoppingList += ["牛奶"]
    
    shoppingList.count
    
    shoppingList += ["笔", "纸"]
    
    shoppingList.insert("Mac", atIndex: 0)
    
    
    
    
    
    //3.删
    
    shoppingList.removeAtIndex(0)
    
    shoppingList.removeLast()
    
    //shoppingList.removeAll(keepCapacity: true)
    
    println(shoppingList)
    
    //包括2但不包括4，删除2不删除4
    
    shoppingList.removeRange(Range(start:2, end:4))
    
    println(shoppingList)
    
    
    
    
    
    //4.改
    
    shoppingList[0] = "Apple Watch"
    
    println(shoppingList)
    
    shoppingList[1 ..< 3] = ["饺子", "馄饨"]
    
    println(shoppingList)
    
    
    
    
    
    //5.空数组的创建
    
    //空数组
    
    var someInts = [Int]()//Array()
    
    var otherInts : [Int] = []//[]相当于空数组
    
    someInts.append(1)
    
    otherInts.append(1)
    
    
    
    var anotherInts = Array() //本质
    
    //有初始值的数组
    
    var threeDoubles = [Double](count: 3, repeatedValue: 0.0)
    
    //类型推断出数组是[Double]类型的
    
    var anotherDoubles = Array(count: 3, repeatedValue: 0.0)
    
    let sixDoubles = threeDoubles + anotherDoubles
    
    
    
    //6.数组是值类型的
    
    var arr1  = [100, 200, 300]
    
    var arr2 = arr1
    
    arr1[0] = 1111
    
    arr1[1] = 2222
    
    println("\(arr2)")
    
    
    
    //OC中的数组是引用类型的
    
    var arr3 : NSMutableArray = ["aaa", "bbb", "ccc"]
    
    var arr4 = arr3
    
    arr3[0] = "AAA"
    
    arr3[1] = "BBB"
    
    println(arr4)
    
    
    
    
    
    13.//集合Set
    import UIKit
    
    
    
    var names = Set()
    
    names.count
    
    names.insert("Daniel")
    
    names.insert("ShaSha")
    
    names.insert("ShanShan")
    
    names.insert("Daniel")
    
    //集合无序，元素不可重复
    
    println("\(names)")
    
    
    
    //清空set
    
    names = []
    
    
    
    //使用数组字面值构建一个set
    
    var favoriteGenres: Set = ["Rock", "Classical", "Hip hop", "Hip hop", "Rock"]
    
    println("\(favoriteGenres)")
    
    
    
    //类型推断
    
    var favoriteGenres2: Set = ["Rock", "Classical", "Hip hop", "Rock"]
    
    println("\(favoriteGenres2)")
    
    
    
    //访问和修改
    
    favoriteGenres.count
    
    favoriteGenres.isEmpty
    
    //遍历
    
    for genres in favoriteGenres {
    
    println("\(genres)")
    
    }
    
    //不要在程序中依赖set的顺序
    
    for (index, genres) in enumerate(favoriteGenres){
    
    println("\(index) : \(genres)")
    
    }
    
    
    
    
    
    
    
    //删除
    
    if let removeGenre = favoriteGenres.remove("Hip hop") {
    
    println("成功删除：\(removeGenre)")
    
    }else{
    
    println("Set中没有你要删除的元素")
    
    }
    
    println("\(favoriteGenres)")
    
    
    
    
    
    //判断某一个元素是否存在
    
    if favoriteGenres.contains("Rock") {
    
    println("有这种风格")
    
    }else{
    
    println("没有这种风格")
    
    }
    
    
    
    //遍历
    
    for genres in favoriteGenres {
    
    println("\(genres)")
    
    }
    
    //排序遍历
    
    var genres : Set = ["Jazz", "Classes", "Rock", "Funk"]
    
    for genre in sorted(genres) {
    
    println("\(genre)")
    
    }
    
    
    
    //集合运算
    
    let oddDigits : Set = [1, 3, 5, 7, 9]//奇数
    
    let evenDigits : Set = [0, 2, 4, 6, 8]//偶数
    
    //并集
    
    sorted(oddDigits.union(evenDigits))
    
    //交集
    
    oddDigits.intersect(evenDigits)
    
    let primes : Set = [2,3,5,7]//素数
    
    //把交集去掉,只留下oddDigits剩余的
    
    oddDigits.subtract(primes)
    
    //把交集去掉，留下两类中所有剩下的
    
    oddDigits.exclusiveOr(primes)
    
    
    
    let hourseAnimals : Set = ["🐶", "🐱"]
    
    let farmAnimals: Set = ["🐷", "🐔", "🐑", "🐱", "🐶"]
    
    let cityAnimals :Set = ["🐨", "🐭"]
    
    //是不是子集
    
    hourseAnimals.isSubsetOf(farmAnimals)
    
    //是不是超集
    
    farmAnimals.isSupersetOf(hourseAnimals)
    
    //不相交的集合
    
    hourseAnimals.isDisjointWith(cityAnimals)
    
    
    
    
    
    14.数组
    
    import UIKit
    
    
    
    let a = [1, 2, 3]//a是Int数组
    
    var shoppingList : [String] = ["Watch", "iPhone6+", "牙刷", "牙膏"]
    
    
    
    //1.查
    
    shoppingList.count
    
    shoppingList.isEmpty
    
    
    
    //遍历数组
    
    for shopping in shoppingList {
    
    println("\(shopping)")
    
    }
    
    //遍历数组并获取每个元素的下标
    
    for (index, shopping) in enumerate(shoppingList) {
    
    println("\(index) : \(shopping)")
    
    }
    
    //使用下标运算获取元素
    
    for var i = 0; i < shoppingList.count; i++ {
    
    println("\(i) : \(shoppingList[i])")
    
    }
    
    
    
    //2.增
    
    shoppingList.append("面包")
    
    shoppingList.count
    
    shoppingList += ["牛奶"]
    
    shoppingList.count
    
    shoppingList += ["笔", "纸"]
    
    shoppingList.insert("Mac", atIndex: 0)
    
    
    
    //3.删
    
    shoppingList.removeAtIndex(0)
    
    shoppingList.removeLast()
    
    //shoppingList.removeAll(keepCapacity: true)
    
    println(shoppingList)
    
    //包括2但不包括4，删除2不删除4
    
    shoppingList.removeRange(Range(start:2, end:4))
    
    println(shoppingList)
    
    
    
    //4.改
    
    shoppingList[0] = "Apple Watch"
    
    println(shoppingList)
    
    shoppingList[1 ..< 3] = ["饺子", "馄饨"]
    
    println(shoppingList)
    
    
    
    //5.数组的创建
    
    //空数组
    
    var someInts = [Int]()//Array()
    
    var otherInts : [Int] = []//[]相当于空数组
    
    someInts.append(1)
    
    otherInts.append(1)
    
    
    
    var anotherInts = Array() //本质
    
    //有初始值的数组
    
    var threeDoubles = [Double](count: 3, repeatedValue: 0.0)
    
    //类型推断出数组是[Double]类型的
    
    var anotherDoubles = Array(count: 3
    */
    
}
func AFuncLiuCheng(){
    // true or false
    if 1 > 2 {
        
    }else{
        
    }
    /* //条件的结果必须是true或false
    
    //if a {} //ERROR
    
    var x : Int? = nil
    
    if x != nil { //不能写成!x
        
        println("x不为空")
        
    }*/
    var Aa:Int? = nil
    if Aa != nil{
        
    }
//    if !Aa{
//        
//    }
    
    // Switch
    /*
    /**
    
    1.完备性(exhaustive),不论表达式的值是多少，switch都应该有一个分支来处理，如果缺少分支，语法错误
    
    2.没有隐式贯穿(NO Implicit Fallthrough)，如果一个分支结束，switch语句就结束，（而OC中必须看见break才跳出分支）不会继续向下一个分支执行，除非特殊申请
    
    3.一个case可以有多个匹配模式
    
    4.在case中也可以使用break提前结束switch语句
    
    */

    */
    var Aab = 4
    // 这里不能用可选类型
    // 记得没有括号
    switch Aab{
    case 1:
        println("")
    case 2:
        println("")
        // 可以贯穿式
    case 4,5,678,8:
        println("")
    default:
        println("")
    }
    //switch 类型不限
    var AaS:String = ""
    switch AaS{
        case "wang":
            //必须有个处理的
        println("")
    default:
        println("")
    }
    
    // for while
    for inde in 1...6{
        
    }
    for index in 1..<7{
        
    }
    for temp in "wangxiaolong"{
        
    }
    var Avalue = 100
    for _ in 1...Avalue{// _占位符
        
    }
    
    while  Avalue < 100{
    }
    // FIXME
    // 可选类型
    var AKa:Int
    // 没有赋值的的变量，不能使用，
    AKa = 2
    println("\(AKa)")
    // 非可选变量不可以为空
    //AKa = nil
    
    var AKav:Int? //默认未nil
    println(" \(AKav)")
    AKav = nil
    // 可选不能直接和非科学之间运算
    let Aadd = AKav! + AKa
    var a : Int = 10
    
    var b : Double = 20
    
    
    //Int和Double不是一个类型，Swift不会自动将a提升为一个Double，所以编译错误，不能一起运算，而oc中会自动将int（小）提升为Double（大）类型，临时进行运算
    
    //let c = a + b
    
    let c = Double(a) + b
    let Adouble:Double = 23.34
    let Ainta:Int = 23
    // 注意括号的位置
    let Aaddadou = Adouble + Double(Ainta)
    
    // 对包强制解包
    var ANameString:String? = "1234"
    let ANameCon = ANameString?.toInt()
    let AAge = "212"
    // 会自动转为可选
    var AnameAd:Int? = AAge.toInt()
    if ANameString != nil{
        
    }
    var An:String?
    // 对空解包依然未空
    let test = An!
    
    // 可选值绑定
    if let test = AnameAd{
        //test不是可选只
    }else{
        
    }
    // 隐式解包
    let Ayinshi:Int!
    Ayinshi = 3
    let Anumber = Ayinshi + 3
    
}

// TODO
func AFunc(){
    
    var name1 = "wang"
    let age = 13
    var erjinzhi = 0b10101010
    var bajinzhi = 0o1234
    var shiniujinzhi = 0xf
    // Swift语言是强类型语言,变量需要明确的类型
    
    // 常量和变量必须在使用前声明，用let来声明常量，用var来声明变量
    
    // 类型推断
    var myage = 34
    //  可以在一行中声明多个常量或者多个变量，用逗号隔开
    var a = 1,b = 2,c = 3
    
// 类型标注,需要写在方法里面
    var Aname:String
    Aname = "wang"
    var Aage: Int
    Aage = 1

    // 类型转换
    // 字符串可以直接相加
    let AnameAge = Aname + Aname
    let ANameAge = Aname + String(Aage)
    let AStringShot = "\(Aname), age \(Aage)"
    // 基本数据类型
    var Aint:Int?
    var ADouble:Double?
    var AFloat:Float32
    var ABool:Bool?
    var Aint64:Int64
    var AFloat64: Float64
    // 获取再内存中的大小
    sizeof(Int64)
    sizeof(Double)
    sizeof(Bool)
    sizeof(Float64)
    
    // 运算符+-*\
    var Aadd = 1 + 2
    //-9 % -4 //结果正负就看%左边的值除数本身正负
    ////支持浮点数
    
    //%左边的值 = 右边的值 X 倍数 + 余数
    
    // 余数 = 左边的值 - 右边的值 X 倍数
    
    3.14 % 2.99 //3.14 - 2.99 X 1
    
    8.15 % 2.34 //8.15 - 2.34 X 3
    /*
    //单目 ++，--和C语言相同
    //比较 >, >=, <, <=, ==, !=和C语言相同
    //三目运算符 ? : 和C语言一样
    //瑞吉运算符 && || ! & | 和C语言一样
    //以下是不同*********************************\\
    //1.Swift支持===运算符，专门用于比较两个引用是否指向了同一个对象（在对象部分讲）

    //2.新的运算符 ？？
    可选类型
    var x : Int?
    x = nil
    
    let r = (x != nil ? x : 0)
    
    let r2 = x ?? 0 //如果想不为空，结果为想本身；如果为空，结果为0
    
    //3.新运算符 ...(闭区间运算符)
    
    for index in 1...5 {
    
    println("\(index)")
    
    }
    //4.半闭区间运算符 ..<包括前者不包括后者
    
    for index in 1 ..< 5 {//包括1但不包括5
    
    println("\(index)")
    
    }
*/
    for index in 1..<5{
        
    }
    for index in 1...5{
        
    }
    
    // 字符串
    var AString = ""
    var AString1 = String()
    //类型标注
    var AString2:String?
    AString.isEmpty
    //SWift中的String类型完全兼容OC中的NSString类的所有方法
    AString.hasPrefix("w")
    AString.hasSuffix("e")
    
    var Achar = Character("d")
    Achar = "d"
    //Achar = "AB"
    Achar = "\\"
    Achar = " "// 空格也是字符，多了报错
    
    //注意类型推断,推断出的类型默认是String
    var ch2 = "T"
    
    ch2 = "ABCDEF"//String
    
    var tiger : Character = "🐯"
    
    let dog : Character = "🐶"
    // swift unicode 支持中国编码
    var 你妈:String
    你妈 = "woman"
    

}


