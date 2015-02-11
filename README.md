# bonebonebone

### 模块:
* [Events](https://github.com/moonRider/bonebonebone/tree/develop/api_document/event) : 提供事件驱动的机制
* [Utils](https://github.com/moonRider/bonebonebone/tree/develop/api_document/util): 提供工具函数
* [Model](https://github.com/moonRider/bonebonebone/tree/develop/api_document/model): 核心模块之一, 用于构建模型
* Collection: 核心模块之一, 用于处理模型集合
* View: 用于处理视图
* Ajax: 提供和server交互的restful的Api

### Events模块
* $on: 用于注册事件监听
* $fire: 用于触发事件
* $off: 用于取消事件绑定
* 暂时想到这三个

### Utils模块
* $extend: 合并对象
* 数组方法扩展
* 对象方法扩展

### Ajax模块
* $ajax: 基本的方法
* $get,$post,$delete,$put: 简化写法
* 遵循Promise规范

### Model, Collection, View大家一起讨论


# 写在最后的几个约束
* 执行环境为`nodejs`
* 所有公用方法有‘$’前缀
* 所有私有方法有‘_’前缀
* 开发文件使用coffee, 非js