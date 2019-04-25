埋点统计的方案
第一步：创建一个Manager来管理埋点
1）里面实现UMSAgent的注册（startWithAppKey:）
2）实现一些业务逻辑的方法（比如，发送事件，页面的统计，h5的统计,等等）
第二步：把eventId用 Config 来进行管理
第三步：Runtime 写一个工具类（区分类方法，和实例方法 例如RunTimeUtil）
第四步：Runtime的method_exchangeImplementations等接口将方法(设为M)的实现互相交换
  优点：1.与工程基本解耦，避免引入了“脏代码”
       2.维护配置表比维护散落在工程各个角落的代码简单


