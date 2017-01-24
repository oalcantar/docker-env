.PHONY: up down stop start install update build serve create-database drop-database exec echo

# source ".env"
# APPLICATIONS_PATH :=./applications
# export APPLICATIONS_PATH

MAKEPATH := $(abspath $(lastword $(MAKEFILE_LIST)))
PWD := $(dir $(MAKEPATH))
APPLICATIONS_PATH := ~/code/kichink
APP := uikit

# applications paths
ifeq ($(APP),micuenta)
	APP_PATH := $(APPLICATIONS_PATH)/micuenta.kichink.com
	NODE_PORT := 9020
else ifeq ($(APP),login)
	APP_PATH := $(APPLICATIONS_PATH)/login.kichink.com
	NODE_PORT := 9050
else ifeq ($(APP),checkout)
	APP_PATH := $(APPLICATIONS_PATH)/checkout.kichink.com
	NODE_PORT := 9070
else ifeq ($(APP),kontrol)
	APP_PATH := $(APPLICATIONS_PATH)/kontrol.kichink.com
	NODE_PORT := 5000
else
	APP_PATH := $(APPLICATIONS_PATH)/UIKIT
	NODE_PORT := 9010
endif

# instala las imagenes de apache, php, node e inicializa la configuracion
# del archivos docker-composer.yml
# build:
# 	@docker build -f ./build/apache-php/Dockerfile -t kichink/apache-php:latest ./build/apache-php
# 	@docker build -f ./build/node-utils/Dockerfile -t kichink/node-utils:latest ./build/node-utils
# 	@docker-compose up -d

# Levanta los contenedores de apache, php, mysql, redis, node
up:
	@docker-compose up -d

# Destruye los contenedores de apache, php, mysql y redis
down:
	@docker-compose down

# Detiene los contenedores de apache, php, mysql y redis
stop:
	@docker-compose stop

# Inicializa los contenedores de apache, php, mysql y redis
start:
	@docker-compose start

# Comando para instalar las dependencias de npm y bower
install:
	@echo Instalando: $(APP)
	@echo Path: $(APP_PATH)"\n"
	@docker run -it --rm \
	-v $(APP_PATH):/app \
	-w /app \
	kichink/node-utils \
	sh -c "npm install && bower install"

# Comando para actualizar las dependencias de npm y bower
update:
	@echo Actualizando: $(APP)
	@echo Path: $(APP_PATH)"\n"
	@docker run -it --rm \
	-v $(APP_PATH):/app \
	-w /app \
	kichink/node-utils \
	sh -c "npm update && bower update"

# Comando para realizar el build mediante grunt
build:
	@echo Build: $(APP)
	@echo Path: $(APP_PATH)"\n"
	@docker run -it --rm \
	-v $(APP_PATH):/app \
	-w /app \
	kichink/node-utils \
	sh -c "grunt build"

# Comando para levantar el servidor de la app mediante grunt y el
# puerto indicado
serve:
	@echo App Serve: $(APP)
	@echo Path: $(APP_PATH)"\n"
	@docker run -it --rm \
	--name $(APP) \
	-p $(NODE_PORT):$(NODE_PORT) \
	-v $(APP_PATH):/app \
	-w /app \
	kichink/node-utils \
	sh -c "grunt serve"

# Comando para crear la base de datos en el contenedor de mysql
create-database:
	@echo Creando la base de datos"\n"
	@docker exec kichink_db_1 bash \
	-c 'echo "CREATE DATABASE Kichink_Prod_AWS_201210" | mysql -u root -proot'

# Comando para eliminar la base de datos en el contenedor de mysql
drop-database:
	@echo Eliminando la base de datos"\n"
	@docker exec kichink_db_1 bash \
	-c 'echo "DROP DATABASE Kichink_Prod_AWS_201210" | mysql -u root -proot'

# Comando para ejecutar un comando RAW pasando el parametro COMMAND
COMMAND := node -v
exec:
	@echo APP: $(APP)
	@echo Path: $(APP_PATH)"\n"
	@echo Ejecutando comando: $(COMMAND)"\n"
	@docker run -it --rm \
	-v $(APP_PATH):/app \
	-w /app \
	kichink/node-utils \
	sh -c "$(COMMAND)"

echo:
	$(APPLICATIONS_PATH)
