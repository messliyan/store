FROM kkarczmarczyk/node-yarn

WORKDIR /usr/src/app/
USER root
COPY package.json ./
RUN yarn

COPY ./ ./

CMD ["npm", "run", "dev"]
