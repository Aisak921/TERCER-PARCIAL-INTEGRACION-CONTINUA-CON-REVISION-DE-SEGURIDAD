FROM node:20-alpine

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /usr/src/app

COPY package*.json ./

# Instalar dependencias de producción (no requiere package-lock.json)
RUN npm install --omit=dev

COPY . .

USER appuser

EXPOSE 3000

CMD ["npm", "start"]
