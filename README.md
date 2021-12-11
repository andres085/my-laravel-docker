# Trabajo Final Curso Docker de Martinez Andrés Fernando

### Obtener proyecto para comenzar.
Puede obtener el proyecto usando el comando:
```
# HTTPS
git clone https://github.com/andres085/my-laravel-docker.git
# SSH
git@github.com:andres085/my-laravel-docker.git
```

## Configuración y puesta en marcha
Ingresar a la carpeta del proyecto
```
cd my-laravel-docker
```
Ejecutar el script start.sh dentro de la carpeta bin para descargar Laravel y realizar una copia del archivo de ejemplo para variables de entorno para Docker y Laravel
```
chmod +x ./bin/start.sh

./start.sh
```
Ejecutar el segundo script first-start.sh dentro de bin para instalar las dependencias de Laravel y cambiar los permisos
```
chmod +x ./bin/first-start.sh

./first-start.sh
```
Revisar el archivo .env y declarar las variables a gusto personal, tanto dentro de la carpeta raíz para Docker, asi como dentro de src/ para Laravel

### Levantar ambiente con docker-compose
Si está usando docker-compose, una vez que ya clonó el repositorio.
```
# construir imagen (opcional)
docker-compose build
# up daemon
docker-compose up -d
```

Si quiere usar un docker-compose para produccion, editar el archivo docker-composeprod.yml a docker-compose.yml para disponer tambien de un cron para respaldar la base de datos, por defecto viene configurado para que respalde cada un minuto. En caso de querer modificar el tiempo, se debe hacer en el archivo crontab.conf dentro del directorio cron, y en el archivo script.sh se deben copiar las credenciales de mysql tal cual figuran en el archivo .env. Los respaldos a la base de datos son guardados dentro de backup/mysql

```
# construir imagen (opcional)
docker-compose build
# up daemon
docker-compose up -d
```

### Importar archivo SQL con datos de producción
Si debe importar un archivo sql, puede hacerlo de la siguiente manera. 
Ingresar a phpmyadmin con la url https://localhost:8001/ e importar uno de los archivos de respaldo ubicados en la carpeta backup/mysql
```
$ docker cp backupfile.sql yii2-mysql:/
$ docker exec -ti yii2-mysql bash
# dentro del contenedor #
$ mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} < /backupfile.sql
```

## Variables de entorno
Las variables de entorno de .env se explican a continuación:

- **MYSQL_USER**: usuario de mysql
- **MYSQL_PASSWORD**: contraseña para el usuario
- **MYSQL_ROOT_PASSWORD**: contraseña para root
- **MYSQL_DATABASE**: base de datos para Laravel
- **DB_HOST**: nombre del servicio en docker-compose
