#!/bin/bash

# CF 证书配置
echo "请输入CF域名";
read domain;

acme.sh --install-cert -d ohrz.net -d "*.ohrz.net" --fullchain-file cert/l.ohrz.net/ecc.cer --key-file cert/l.ohrz.net/ecc.key

echo "请输加入入允许访问域名";
read allowedDomain;

# 替换域名
sed -i "s/example.com/$domain/g" nginx.conf
# 添加服务器到白名单
echo "https://$allowedDomain    '$allowedDomain';" >> allowed-sites.conf
echo "生成完毕 请使用Docker进行后续工作"
