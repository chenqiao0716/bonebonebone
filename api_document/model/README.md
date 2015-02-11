# Model 模块


### 依赖
* Util
* Event


### constructor 构造函数

#### params
* obj

    需要初始化的对象

    object: 任何有效的对象

    必须的参数

* options

    用户的配置，非必须参数


#### options 用户的配置
* observers

    规定哪些属性改变时会触change事件

    Array: 由字符串组成的数组

    默认值为 []

* setters

    用户自定义属性的存值方式

    Object: 键名为属性，值为函数，函数将会传入要存入的值，返回值为实际存入值。

    默认为 {}

* getters

    同setters，区别在于这里定义的是取值时的方法

* validates

    规定哪些属性将会如何被校验(先于setter执行, 可阻断setter的执行)

    Object: 键名为属性，值为函数或指定的字符串, 函数会传入要校验的值, 要求返回boolen值

    默认为 {}


#### 可用的validates字符串
* `required`: 非空检测
* `maxlength:num`: 长度不超过num
* `minlength:num`: 长度不小于num
* `lengtharea:min-max`: 长度在min与max之间(含min和max)
* `number`: 是否为数字，包括小数
* `integer`: 是否为整数
* `email`: 是否为邮箱
* `telphone`: 是否为手机号码
* `regexp:reg flag`: 自定义校验的正则


### $isNew

判断一个实例是否是新建的(根据id属性判断)

    model.$isNew()


#### $parse

该方法在初始化时调用，参数和constructor一致


# 更多方法正在加入中，请稍等