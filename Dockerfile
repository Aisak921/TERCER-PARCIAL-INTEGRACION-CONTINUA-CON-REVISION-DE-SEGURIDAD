# Imagen base ligera y soportada
FROM node:20-alpine

# Crear usuario no root para ejecutar la app
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Directorio de trabajo
WORKDIR /usr/src/app

# Copiar solo definición de dependencias
COPY package*.json ./

# Instalar dependencias de producción (no requiere package-lock.json)
RUN npm install --only=production

# Copiar el resto del código de la aplicación
COPY . .

# Ejecutar con usuario no root
USER appuser

# Exponer el puerto de la aplicación
EXPOSE 3000

# Comando de inicio
CMD ["npm", "start"]
