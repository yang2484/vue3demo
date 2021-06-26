FROM node:10

# 设置工作目录
WORKDIR /home/group

COPY package.json /home/group/package.json
COPY package-lock.json /home/group/package-lock.json

RUN npm i --registry=https://registry.npm.taobao.org

# 拷贝所有源代码到工作目
COPY . /home/group

# 暴露容器端口
EXPOSE 3000

CMD npm run dev