FROM node:22-alpine

RUN apk add --no-cache tini

ENV NODE_ENV=production
WORKDIR /app

COPY package.json pnpm-lock.yaml ./
RUN npm install --omit=dev --ignore-scripts=false

COPY . .

EXPOSE 3000
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["node", "app.js"]
