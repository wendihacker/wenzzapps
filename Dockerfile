FROM node:20-alpine

WORKDIR /app

COPY package.json package-lock.json* ./
RUN npm ci --only=production || npm install --production

COPY sync.js ./
COPY frontend ./frontend

EXPOSE 4000

CMD ["node", "sync.js"]
