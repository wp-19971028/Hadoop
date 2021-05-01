# 1、通过页面查看

 1.1.1.1. **IP访问**

一旦Hadoop集群启动并运行，可以通过web-ui进行集群查看，如下所述：

**查看NameNode页面地址:**

node1:50070

![1619873363001](./assets\1619873363001.png)

查看Yarn集群页面地址:

node1:8088

![1619873496615](./assets\1619873496615.png)

查看MapReduce历史任务页面地址:

node1:19888

![1619873553271](./assets\1619873553271.png)



# 2. 问题

如果node1访问失败但是把node换成IP地址成功

配置方式:

1. 打开Windows的C:\Windows\System32\drivers\etc目录下hosts文件

2. 在hosts文件中添加以下域名映射

~~~sh
192.168.88.161  node1  node1.it.cn

192.168.88.162  node2  node2.it.cn

192.168.88.163  node3  node3.it.cn
~~~

配置完之后，可以将以上地址中的IP替换为主机名即可访问，如果还不能访问，则需要重启Windows电脑，比如访问NameNode，可以使用node1:50070
