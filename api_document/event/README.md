# Event 模块


### $on方法

    obj.$on(eventType, handle, context)

#### params
  * eventType
  * handle
  * context

###### eventType

  事件名称
  string: 允许任何有效的字符串
  必须的参数

###### handle

  事件触发后的回调函数
  function: 任何有效的可执行的函数
  必须的参数

###### context

  回调函数的执行环境
  object: 可供handle执行的任意对象
  可选参数,默认为`obj`


### $fire方法

    obj.$fire(eventType, msg)

#### params
  * eventType
  * msg

###### eventType

  事件名称
  string: 允许任何有效的字符串
  必须的参数

###### msg

  传递给回调函数的唯一参数
  允许任意有效的javascript的数据类型
  可选参数


### $off方法

    obj.$off(eventType, handle)

#### params
  * eventType
  * handle

###### eventType

  要取消绑定的事件名
  string: 允许任何有效的字符串
  可选的参数, 缺省时取消全部的绑定

###### handle

  要取消绑定的事件回调
  function: 只能为已经绑定过的某个函数，如果不是绑定过的函数，则直接返回
  可选的参数，但需要eventType存在，缺省时取消所有eventType的事件回调