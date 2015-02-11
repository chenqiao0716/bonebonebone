# Collection 模块


### 依赖
* Util
* Event
* Model

### constructor 构造函数

#### params
* sets

    需要初始化的集合

    Array: 元素是Object类型的任意数组

    必须的参数

* options

  用户的配置，非必须参数，会原封不动的交给Model的构造函数


### $add

添加一个元素到集合

    collection.$add(model)

#### params
* model

    待添加的元素

    Model的实例或可以被Model构造的对象

    必须的参数, 触发一个`add`事件


### $reset

重置一个集合

    collection.$reset(sets)

#### params
* sets

    同构造函数的sets参数


### length
返回集合的长度，只读属性


# 更多方法正在加入中，请稍等