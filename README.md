# bonebonebone


### How to test?
* 在根目录下建立一个test.coffee
* 在test.coffee最上面加入`Bone3 = require './Bonebonebone.coffee'`
* 然后就可以了，你可以在该文件里测试
* 在终端里进入该目录,然后输入`coffee test.coffee`就可以看到结果了


### 最后
* 执行环境为`nodejs`
* 所有公用方法有‘$’前缀
* 所有私有方法有‘_’前缀
* 开发文件使用coffee, 非js