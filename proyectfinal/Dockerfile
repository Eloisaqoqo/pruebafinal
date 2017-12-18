FROM microsoft/mssql-server-linux:latest



# Creamo un directorio
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Instakamos las dependencias
#guardamos 
COPY package.json /usr/src/app/


# creamos la app, y la ejecutamos
COPY . /usr/src/app

# empezamos con los permisos para el script (import-data)
RUN chmod +x /usr/src/app/import-data.sh

# puerto en donde se abrira el programa
EXPOSE 8080

CMD /bin/bash ./entrypoint.sh
