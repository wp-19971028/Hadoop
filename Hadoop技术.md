## 1. Hadoop介绍

> Hadoop是Apache旗下的一个用java语言实现开源软件框架，是一个开发和运行处理大规模数据的软件平台。允许使用简单的编程模型在大量计算机集群上对大型数据集进行分布式处理。

- 狭义上说，Hadoop指Apache这款开源框架，它的核心组件有：
  - **HDFS**（分布式文件系统）：解决海量数据存储
  - **YARN**（作业调度和集群资源管理的框架）：解决资源任务调度
  - **MAPREDUCE**（分布式运算编程框架）：解决海量数据计算
- 广义上来说，Hadoop通常是指一个更广泛的概念——Hadoop生态圈:
  - HDFS（分布式文件系统）——核心
  - MapReduce（分布式计算框架）——核心
  - Yarn（分布式资源管理器）——核心
  - Spark（分布式计算框架）
  - Tez(DAG计算模型)
  - Hive（基于Hadoop的数据仓库）
  - Pig(ad-hoc脚本）
  - Mahout（数据挖掘算法库）
  - Ambari（安装部署配置管理工具）
  - Oozie(工作流调度器）
  - HBase（分布式列存数据库）
  - Sqoop（数据ETL/同步工具）
  - Flume（日志收集工具）
  -  Zookeeper（分布式协作服务）
  - HCatalog（数据表和存储管理服务）
  - Impala（SQL查询引擎）
  - Presto（分布式大数据SQL查询引擎）



## 2. Hadoop发展简述

> Hadoop是Apache Lucene创始人 Doug Cutting 创建的。最早起源于Nutch，它是Lucene的子项目。Nutch的设计目标是构建一个大型的全网搜索引擎，包括网页抓取、索引、查询等功能，但随着抓取网页数量的增加，遇到了严重的可扩展性问题：如何解决数十亿网页的存储和索引问题。
>
> 2003年Google发表了一篇论文为该问题提供了可行的解决方案。论文中描述的是谷歌的产品架构，该架构称为：谷歌分布式文件系统（GFS）,可以解决他们在网页爬取和索引过程中产生的超大文件的存储需求。
>
> 2004年 Google发表论文向全世界介绍了谷歌版的MapReduce系统。
>
> 同时期，以谷歌的论文为基础，Nutch的开发人员完成了相应的开源实现HDFS和MAPREDUCE，并从Nutch中剥离成为独立项目HADOOP，到2008年1月，HADOOP成为Apache顶级项目，迎来了它的快速发展期。
>
> 2006年Google发表了论文是关于BigTable的，这促使了后来的Hbase的发展。
>
> 因此，Hadoop及其生态圈的发展离不开Google的贡献。

## 3. **Hadoop特性优点**

- **扩容能力（Scalable）**：Hadoop是在可用的计算机集群间分配数据并完成计算任务的，这些集群可用方便的扩展到数以千计的节点中。
- **成本低（Economical）**：Hadoop通过普通廉价的机器组成服务器集群来分发以及处理数据，以至于成本很低。
- **高效率（Efficient）：**通过并发数据，Hadoop可以在节点之间动态并行的移动数据，使得速度非常快。
- **可靠性（Rellable）：**能自动维护数据的多份复制，并且在任务失败后能自动地重新部署（redeploy）计算任务。所以Hadoop的按位存储和处理数据的能力值得人们信赖。

## 4 .Hadoop在国内外的应用

> Google, Yahoo, Facebook,IBM,

## 5 .Hadoop在国内外的应用

> 百度,阿里,华为,腾讯

## 6. **Hadoop的历史版本和发行版公司**

![1619853488293](./assets\1619853488293.png)

###  **1.x的版本架构模型介绍**

![1619853606627](./assets\1619853606627.png)

- **文件系统核心模块**
  - NameNode：集群当中的主节点，管理元数据(文件的大小，文件的位置，文件的权限)，主要用于管理集群当中的各种数据
  - SecondaryNameNode：主要能用于hadoop当中元数据信息的辅助
  - DataNode：集群当中的从节点，主要用于存储集群当中的各种数据
- **数据计算核心模块：**
  - JobTracker：接收用户的计算请求任务，并分配任务给从节点
  - TaskTracker：负责执行主节点JobTracker分配的任务

### 2.x.**的版本架构模型介绍**

 **第一种：NameNode与ResourceManager单节点架构模型**



![1619860179130](./assets\1619860179130.png)

**文件系统核心模块：**

- NameNode：集群当中的主节点，主要用于管理集群当中的各种数据

- secondaryNameNode：主要能用于hadoop当中元数据信息的辅助管理

- DataNode：集群当中的从节点，主要用于存储集群当中的各种数据

**数据计算核心模块:**

- ResourceManager：接收用户的计算请求任务，并负责集群的资源分配

- NodeManager：负责执行主节点APPmaster分配的任务

**第二种：NameNode高可用与ResourceManager单节点架构模型**

![1619860443235](./assets\1619860443235.png)

**文件系统核心模块：**

- NameNode：集群当中的主节点，主要用于管理集群当中的各种数据，其中NameNode可以有两个，形成高可用状态

- DataNode：集群当中的从节点，主要用于存储集群当中的各种数据

- JournalNode：文件系统元数据信息管理

 **数据计算核心模块：**

- ResourceManager：接收用户的计算请求任务，并负责集群的资源分配，以及计算任务的划分

- NodeManager：负责执行主节点ResourceManager分配的任务



**第三种：NameNode单节点与ResourceManager高可用架构模型**

![1619860619562](./assets\1619860619562.png)

**文件系统核心模块：**

- NameNode：集群当中的主节点，主要用于管理集群当中的各种数据

- secondaryNameNode：主要能用于hadoop当中元数据信息的辅助管理

- DataNode：集群当中的从节点，主要用于存储集群当中的各种数据

**数据计算核心模块：**

- ResourceManager：接收用户的计算请求任务，并负责集群的资源分配，以及计算任务的划分，通过zookeeper实现ResourceManager的高可用

- NodeManager：负责执行主节点ResourceManager分配的任务

 l **第四种：NameNode与ResourceManager高可用架构模型**

![1619860713964](./assets\1619860713964.png)

**文件系统核心模块：**

- NameNode：集群当中的主节点，主要用于管理集群当中的各种数据，一般都是使用两个，实现HA高可用

- JournalNode：元数据信息管理进程，一般都是奇数个

- DataNode：从节点，用于数据的存储

 

**数据计算核心模块：**

- ResourceManager：Yarn平台的主节点，主要用于接收各种任务，通过两个，构建成高可用

- NodeManager：Yarn平台的从节点，主要用于处理ResourceManager分配的任务

### **3.x的版本架构和模型介绍**

>  由于Hadoop 2.0是基于JDK 1.7开发的，而JDK 1.7在2015年4月已停止更新，这直接迫使Hadoop社区基于JDK 1.8重新发布一个新的Hadoop版本，即hadoop 3.0。Hadoop 3.0中引入了一些重要的功能和优化，包括HDFS 可擦除编码、多Namenode支持、MR Native Task优化、YARN基于cgroup的内存和磁盘IO隔离、YARN container resizing等。
>
>  Apache hadoop 项目组最新消息，hadoop3.x以后将会调整方案架构，将Mapreduce 基于内存+io+磁盘，共同处理数据。
>
> 改变最大的是hdfs,hdfs 通过最近block块计算，根据最近计算原则，本地block块，加入到内存，先计算，通过IO，共享内存计算区域，最后快速形成计算结果，比Spark快10倍。
>
>  

**Hadoop 3.0新特性**

> Hadoop 3.0在功能和性能方面，对hadoop内核进行了多项重大改进，主要包括：
>
> **通用性**
>
> 1. 精简Hadoop内核，包括剔除过期的API和实现，将默认组件实现替换成最高效的实现。
>
> 2. Classpath isolation：以防止不同版本jar包冲突
>
> 3. Shell脚本重构： Hadoop 3.0对Hadoop的管理脚本进行了重构，修复了大量bug，增加了新特性。
>
>  
>
> **HDFS**
>
> Hadoop3.x中Hdfs在可靠性和支持能力上作出很大改观：
>
> 1.HDFS支持数据的擦除编码，这使得HDFS在不降低可靠性的前提下，节省一半存储空间。
>
> 2.多NameNode支持，即支持一个集群中，一个active、多个standby namenode部署方式。注：多ResourceManager特性在hadoop 2.0中已经支持。
>
>  
>
> **MapReduce**
>
> Hadoop3.X中的MapReduce较之前的版本作出以下更改：
>
> 1.Tasknative优化：为MapReduce增加了C/C++的map output collector实现（包括Spill，Sort和IFile等），通过作业级别参数调整就可切换到该实现上。对于shuffle密集型应用，其性能可提高约30%。
>
> 2.MapReduce内存参数自动推断。在Hadoop 2.0中，为MapReduce作业设置内存参数非常繁琐，一旦设置不合理，则会使得内存资源浪费严重，在Hadoop3.0中避免了这种情况。
>
>  
>
> **HDFS纠删码**
>
> 在Hadoop3.X中，HDFS实现了Erasure Coding这个新功能。Erasure coding纠删码技术简称EC，是一种数据保护技术.最早用于通信行业中数据传输中的数据恢复，是一种编码容错技术。
>
> 它通过在原始数据中加入新的校验数据，使得各个部分的数据产生关联性。在一定范围的数据出错情况下，通过纠删码技术都可以进行恢复。
>
> hadoop-3.0之前，HDFS存储方式为每一份数据存储3份，这也使得存储利用率仅为1/3，hadoop-3.0引入纠删码技术(EC技术)，实现1份数据+0.5份冗余校验数据存储方式。
>
> 与副本相比纠删码是一种更节省空间的数据持久化存储方法。标准编码(比如Reed-Solomon(10,4))会有1.4 倍的空间开销；然而HDFS副本则会有3倍的空间开销。
>
> **MapReduce优化** 
>
> Hadoop3.x中的MapReduce添加了Map输出collector的本地实现，对于shuffle密集型的作业来说，这将会有30%以上的性能提升。
>
> **支持多个NameNodes** 
>
> ​     最初的HDFS NameNode high-availability实现仅仅提供了一个active NameNode和一个Standby NameNode；并且通过将编辑日志复制到三个JournalNodes上，这种架构能够容忍系统中的任何一个节点的失败。
>
> ​    然而，一些部署需要更高的容错度。我们可以通过这个新特性来实现，其允许用户运行多个Standby NameNode。比如通过配置三个NameNode和五个JournalNodes，这个系统可以容忍2个节点的故障，而不是仅仅一个节点。
>
> **默认端口更改**
>
> ​    在hadoop3.x之前，多个Hadoop服务的默认端口都属于Linux的临时端口范围（32768-61000）。这就意味着用户的服务在启动的时候可能因为和其他应用程序产生端口冲突而无法启动。
>
> ​    现在这些可能会产生冲突的端口已经不再属于临时端口的范围，这些端口的改变会影响NameNode, Secondary NameNode, DataNode以及KMS。与此同时，官方文档也进行了相应的改变，具体可以参见 HDFS-9427以及HADOOP-12811。 
>
> Namenode ports: 50470 --> 9871, 50070--> 9870, 8020 --> 9820
>
> Secondary NN ports: 50091 --> 9869,50090 --> 9868
>
> Datanode ports: 50020 --> 9867, 50010--> 9866, 50475 --> 9865, 50075 --> 9864
>
> Kms servers ports: 16000 --> 9600 (原先的16000与HMaster端口冲突)
>
> **YARN 资源类型**
>
> ​    YARN 资源模型（YARN resource model）已被推广为支持用户自定义的可数资源类型（support user-defined countable resource types），不仅仅支持 CPU 和内存。
>
> ​    比如集群管理员可以定义诸如 GPUs、软件许可证（software licenses）或本地附加存储器（locally-attached storage）之类的资源。YARN 任务可以根据这些资源的可用性进行调度。

**Hadoop历史版本**

- 1.x版本系列：hadoop版本当中的第二代开源版本，主要修复0.x版本的一些bug等，该版本已被淘汰

- 2.x版本系列：架构产生重大变化，引入了yarn平台等许多新特性,是现在使用的主流版本。

- 3.x版本系列: 加入多namenode新特性，该版本是最新版本，但是还不太稳定。

 **Hadoop发行版公司**

> Hadoop发行版本分为开源社区版和商业版。
>
> 社区版是指由Apache软件基金会维护的版本，是官方维护的版本体系。
>
> 商业版Hadoop是指由第三方商业公司在社区版Hadoop基础上进行了一些修改、整合以及各个服务组件兼容性测试而发行的版本，比较著名的有cloudera的CDH、mapR、hortonWorks等

> **免费开源版本**Apache:
>
> [**http://hadoop.apache.org/**](http://hadoop.apache.org/)
>
> 优点：拥有全世界的开源贡献者，代码更新迭代版本比较快，
>
> 缺点：版本的升级，版本的维护，版本的兼容性，版本的补丁都可能考虑不太周到，
>
> apache所有软件的下载地址（包括各种历史版本）：
>
> [**http://archive.apache.org/dist/**](http://archive.apache.org/dist/)

> **免费开源版本HortonWorks：**
>
> [**http://hadoop.apache.org/**](http://hadoop.apache.org/)
>
> hortonworks主要是雅虎主导Hadoop开发的副总裁，带领二十几个核心成员成立Hortonworks，核心产品软件HDP（ambari），HDF免费开源，并且提供一整套的web管理界面，供我们可以通过web界面管理我们的集群状态，web管理界面软件HDF网址（[**http://ambari.apache.org/**](http://ambari.apache.org/)），2018年，大数据领域的两大巨头公司Cloudera和Hortonworks宣布平等合并，Cloudera以股票方式收购Hortonworks，Cloudera股东最终获得合并公司60%的股份

> **软件收费版本Cloudera:**
>
> [**https://www.cloudera.com/**](https://www.cloudera.com/)
>
> cloudera主要是美国一家大数据公司在apache开源hadoop的版本上，通过自己公司内部的各种补丁，实现版本之间的稳定运行，大数据生态圈的各个版本的软件都提供了对应的版本，解决了版本的升级困难，版本兼容性等各种问题。



## 7.Hadoop集群简介

- HADOOP集群具体来说包含两个集群：HDFS集群和YARN集群，两者逻辑上分离，但物理上常在一起。
- **HDFS集群负责海量数据的存储，**集群中的角色主要有：
  - NameNode、DataNode、SecondaryNameNode
- **YARN集群负责海量数据运算时的资源调度**，集群中的角色主要有：
  - ResourceManager、NodeManager
- 那mapreduce是什么呢？它其实是一个分布式运算编程框架，是应用程序开发包，由用户按照编程规范进行程序开发，后打包运行在HDFS集群上，并且受到YARN集群的资源调度管理。

