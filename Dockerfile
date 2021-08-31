FROM centos:latest

# 编译安装时所需依赖
#RUN yum install -y \
#	gcc gcc-c++ \
#	pcre pcre-devel \
#	openssl openssl-devel \
#	zlib zlib-devel git crontabs
#RUN dnf group install -y "Development Tools"

# 添加文件夹
ADD . /root/server

# 安装服务器
RUN bash /root/server/install.sh

EXPOSE 8080 8443

# 启动服务
CMD ["/root/server/openresty/nginx/sbin/nginx","-c","/root/server/nginx.conf","-p","/root/server/nginx","-g","daemon off;"]
