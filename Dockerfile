FROM openresty/openresty:alpine

# 添加文件夹
ADD . /root/server

EXPOSE 8080 8443

# 启动服务
CMD ["nginx","-c","/root/server/nginx.conf","-p","/root/server/nginx","-g","daemon off;"]
