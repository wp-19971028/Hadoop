# 从Linux本地上传一个文本文件到hdfs的/目录下

~~~sh
#在/export/data/目录中创建a.txt文件，并写入数据
cd /export/data/
touch a.txt
echo "hello" > a.txt 

#将a.txt上传到HDFS的根目录
hadoop fs -put a.txt  /
~~~

1、通过页面查看

 通过NameNode页面.进入HDFS：

node1:50070

![1619875603962](./assets\1619875603962.png)

# 遇到的问题

[root@node1 data]# hadoop fs -put b.txt  /
21/05/01 21:09:52 WARN hdfs.DFSClient: DataStreamer Exception
org.apache.hadoop.ipc.RemoteException(java.io.IOException): 



- 停止集群 stop-all.sh

- 删除这个目录(三台都要)

  - ![1619875792471](./assets\1619875792471.png)

- 初始化

  - hadoop namenode -format

- 启动

- start-all.sh

  ## 计算π

  ~~~sh
  #运行mapreduce的example任务
  hadoop jar /export/server/hadoop-2.7.5/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.5.jar pi 2 10000
  ~~~

  ![1619877152742](./assets\1619877152742.png)
