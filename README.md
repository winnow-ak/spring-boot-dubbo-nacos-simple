
# springboot-dubbo-nacos-simple
## 项目介绍
SpringBoot版本:2.1.3

Dubbo版本:2.7.0

Dubbo-nacos版本：2.7.1

Nacos版本:1.0.0

JDK版本:1.8

## 搭建步骤
#### 1.服务器搭建docker
未安装docker情况下，执行docs文件夹下的install_docker.sh脚本文件，
#### 2.搭建MySQL
1.搭建在宿主机上，具体为什么不搭建Docker,自行品

2.防火墙开发3306端口

3.开启远程服务登录

#### 3.搭建nacos
1.修改docs/install.nacos.sh 中mysql服务器地址和密码

2.执行docs/nacos.sql

3.执行docs文件夹下的install_nacos.sh脚本文件，


#### 4.搭建搭建spring-boot项目

1.创建maven项目
```
 parent:
    simple-biz
    simple-consumer
    simple-provider
```
parent的pom.xml文件加入以下配置实现动态切换环境变量
```xml
    <profiles>
        <profile>
            <id>dev</id>
            <properties>
                <!-- profileActive 自定义字段 对应配置文件 spring.profiles.active=@profileActive@ -->
                <profileActive>dev</profileActive>
            </properties>
            <!-- 不指定默认激活该配置环境 -->
            <activation>
                <activeByDefault>true</activeByDefault>
            </activation>
        </profile>
        <profile>
            <id>test</id>
            <properties>
                <profileActive>test</profileActive>
            </properties>
        </profile>
        <profile>
            <id>prod</id>
            <properties>
                <profileActive>prod</profileActive>
            </properties>
        </profile>
    </profiles>
    
    <build>
        <resources>
            <resource>
                <directory>src/main/resources</directory>
                <filtering>true</filtering>
                <includes>
                    <include>application.yaml</include>
                    <include>application-${profileActive}.yaml</include>
                </includes>
            </resource>
        </resources>
    </build>
```
2.启动项目指定环境配置
##### 1.maven profile 指定环境
使用maven打包时通过-P参数，-P后跟上profile的唯一id，如
```shell script
 mvn clean package -Ptest
``` 

##### 2.mac 检查端口是否被启动
```shell script
lsof -i tcp:8081
```
##### centos 查看端口
```shell script
netstat -ntlp
```

# spring-boot-dubbo-nacos-simple
spring-boot-dubbo-nacos 案例,nacos 使用docker 部署
