
### Docker

```bash
# 执行命令生成需要的配置文件
bash genConf.sh
# 生成docker镜像
docker build -t jsproxy .
运行镜像
docker run -d --name jsproxy -p 8080:8080 -p 8443:8443 jsproxy
```
