
//
//  MySwiftFourth.swift
//  SwfitTest
//
//  Created by kingcode on 15/9/27.
//  Copyright (c) 2015年 kingcode. All rights reserved.
//

import Foundation
/**
二：便利构造器:

1) 是次要的，辅助性的构造器.

2) 一个类可能没有便利构造器，但不能没有指定构造器

3) 便利构造器不会调用父类的构造器，而会调用同类中的构造器



三原则 四检查：

三大原则:  1)指定向上调, 2)便利调自己,  3)便利最终会调用到指定

安全检查:

1. 必须先初始本类的所有属性之后，才能向上调用父类的指定构造器(初始化父类中的属性)

2. 必须调用完了父类的指定构造器后，才能给继承下来的属性赋值(如果需要的话)

3. 在便利构造器中,如果需要直接给属性赋值,则赋值语句一定要写在调用另一个构造器的语句之后

4. 构造器中要调用其他构造器之前,不能调用任何实例方法。只有在调用其他构造器之后才可以调用实例方法。



构造器的继承问题:

一般情况下，构造器是不能被子类继承的,子类中如果需要父类的构造器，可以重写(覆盖)父类中已有构造器。但有如下特殊规则:

1. 如果子类没有任何指定构造器,那么子类就继承所有的指定构造器

2. 如果子类提供了父类中所有的指定构造器(可以是继承来的或都是覆盖的),那么,父类中所有的便利构造器也会被子类继承



*/
class Person {
    var name:String
    /*
    //编译器写的构造器
    
    override init(){
    
    //在调用父类的指定构造器之前，必须相处是否本类中的所有属性
    
    numberOfPassengers = 1
    
    super.init()
    
    //必须先调用父类的指定构造器，再给从父类继承来的属性赋值，否则有可能导致你赋的值无效（被覆盖）
    
    numberOfWheels = 2
    
    }
    */
    // 一个类一定有构造器
    // 如果没有自定义的，系统会默认创建一个
//    init(name:String){
//        self.name = name
//    }
    init(){
        name = ""
    }
}
class PersonA: Person {
    var age:Int
    override init(){
        age = 2
        super.init()
    }
//    override init(age:Int){
//        age = 2
//        super.init(name: "")
//        name = 33
//    }
}
/*
10.指定构造器

有两种:

指定构造器(Designated Initializer)

便利构造器(Convenience Initializer)



一：指定构造器：

1)  最重要的构造器

2)  初始化所有的属性，并且向上调用父类的指定构造器来初始从父类中继承的属性

3) 类中至少有一个指定构造器(可以是自己写的，也可以是从父类中继承来的)

*/