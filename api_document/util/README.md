# Util 模块


### $extend 合并对象

    Util.$extend(target, source...)

#### params
* target

    合并到哪个对象里

    object: 任何有效的对象

    必须的参数

* source...

    哪些对象需要合并进来

    object: 任何有效的对象

    必须的选项，至少含有一个对象，多个对象用逗号隔开，同一属性靠后的覆盖靠前的


### $idGenerator id生成器（待实现）

    Util.$extend(prefix, suffix)

#### params
* prefix

    生成id应该带有的前缀

    string: 任何有效的字符串

    可选参数, 默认为空字符

* suffix

    生成id应该带有的后缀

    string: 任何有效的字符串

    可选参数, 默认为空字符，需要先有prefix参数


## 更多方法正在加入中，请稍等