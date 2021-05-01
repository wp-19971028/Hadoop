# 启动zk
 zkServer.sh  start
# 查看zk的状态
 zkServer.sh  status

# 在node1上执行格式化指令 (慎用)
hadoop namenode -format


# 启动HDFS
start-dfs.sh

# 启动Yarn
start-yarn.sh

# 启动历史任务服务进程
mr-jobhistory-daemon.sh start historyserver

# 全部开启

start-all.sh

# 全部关闭
stop-all.sh

停止集群：
stop-dfs.sh
stop-yarn.sh
mr-jobhistory-daemon.sh stop historyservers

# 如果在启动之后，有些服务没有启动成功，则需要查看启动日志，Hadoop的启动日志在每台主机的/export/server/hadoop-2.7.5/logs/目录，需要根据哪台主机的哪个服务启动情况去对应的主机上查看相应的日志，以下是node1主机的日志目录.