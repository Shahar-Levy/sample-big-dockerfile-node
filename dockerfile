FROM node:8.16
WORKDIR /
RUN yarn
COPY . ./
RUN yarn build

# installing stuff just because
RUN apt-get update
# seperate RUN lines for more diffs 
RUN apt-get install -y \
  bzr \
  cvs \
  git \
  mercurial \
  subversion 

COPY /build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]