#!/bin/bash

# Env-Specific variables

# Database Variables
export MONGO_INIT_USER=mongo
export MONGO_INIT_PW=root
export NEO4J_USER=neo4j
export NEO4J_PW=admin

# Crazy Ivan Variables
export IVAN_UN=ivan
export IVAN_PW=th1rds3cr3t
export IVAN_HASH_PW=ivanHashPassword
export IVAN_OUT_AES_KEY=1393812869195417E6A266DC042A17CF8AD9B1652D740E667DFC15D0FAEB7352
export IVAN_OUT_AES_IV=F9625F6F5C5E48AF25220C73DA68A344
export IVAN_OUT_AES_PASSWORD=th1rds3cr3t
export IVAN_OUT_AES_SALT=DE58008F64A44829
export IVAN_REGISTRATION_AES_KEY=7134C6351598C63EDD21368130480A4ABC9AA35CEDAB6817A00186A9BE9643DE
export IVAN_REGISTRATION_AES_IV=545D1665611DE4C401F60E35E88B34AE
export IVAN_REGISTRATION_AES_PASSWORD=b1gs3cr3t
export IVAN_REGISTRATION_AES_SALT=2ED8B9B8EBCAB8AF
export IVAN_IN_AES_KEY=F5C18B0613F578BFC4ACF00867A8A2E0512EDE180197241C40FB60E2201A5B6B
export IVAN_IN_AES_IV=8753F0BB2C932972822A54E3B2C622C1
export IVAN_IN_AES_PASSWORD=an0th3rs3cr3t
export IVAN_IN_AES_SALT=0AF46FFAD408DEE9

# CLyman Variables
export CLYMAN_UN=clyman
export CLYMAN_PW=f0urths3cr3t
export CLYMAN_HASH_PW=clymanHashPassword
export CLYMAN_OUT_AES_KEY=F5C18B0613F578BFC4ACF00867A8A2E0512EDE180197241C40FB60E2201A5B6B
export CLYMAN_OUT_AES_IV=8753F0BB2C932972822A54E3B2C622C1
export CLYMAN_OUT_AES_PASSWORD=an0th3rs3cr3t
export CLYMAN_OUT_AES_SALT=0AF46FFAD408DEE9
export CLYMAN_IN_AES_KEY=7134C6351598C63EDD21368130480A4ABC9AA35CEDAB6817A00186A9BE9643DE
export CLYMAN_IN_AES_IV=545D1665611DE4C401F60E35E88B34AE
export CLYMAN_IN_AES_PASSWORD=b1gs3cr3t
export CLYMAN_IN_AES_SALT=2ED8B9B8EBCAB8AF

# Kelona Variables
export KELONA_UN=kelona
export KELONA_PW=kelonaAdmin

# AeselProjects Variables
export PROJECTS_UN=projects
export PROJECTS_PW=projectsAdmin

# SSL Variables
export PEM_PASSWORD=password
export AESEL_DOMAIN=local
export SSL_BASE_DIR=/var/ssl

export CURRENT_UID=$(id -u):$(id -g)
printf $CURRENT_UID
printf "\n"

OPT="-h"

if [ "$#" -gt 0 ]; then
  OPT=$1
fi

if [ $OPT = "-h" ]; then
  printf "aesel.sh is a helper script for starting up basic Aesel environments.\n"
  printf "It is not intended to be used for Production deployments.\n"
  printf "\n"
  printf "Valid options for running aesel.sh are:\n"
  printf "'-h' : Show this help dialogue."
  printf "'dev' : Start an unsecured development cluster with only the minimal services.\n"
  printf "'db' : Start database instances (Mongo & Neo4j).\n"
  printf "'cluster' : Start a Scene-Cluster (CLyman & Crazy Ivan).\n"
  printf "'core' : Start core, stateless back-end services (Adrestia, Kelona, Projects).\n"
else
  printf "Setting fixed IP Address:\n"
  export NETWORK_INTERFACE_NAME=$(route | grep '^default' | grep -o '[^ ]*$')
  export NETWORK_INTERFACE_ADDRESS=$(ip addr show $NETWORK_INTERFACE_NAME | grep -Po 'inet \K[\d.]+')
  printf $NETWORK_INTERFACE_NAME
  printf "\n"
  printf $NETWORK_INTERFACE_ADDRESS
  printf "\n"
  if [ $OPT = "dev" ]; then
    printf "Starting Unsecured Aesel Development Cluster\n"
    docker-compose -f deployment/min/compose/docker-compose.yml up -d
  else
    if [ $OPT = "cluster" ]; then
      printf "Copying ssl.properties files into SSL Base Directory.\n"
      mkdir -p $SSL_BASE_DIR/ivan/
      mkdir -p $SSL_BASE_DIR/clyman/
      cp deployment/full/config/ivan/ssl.properties $SSL_BASE_DIR/ivan/
      cp deployment/full/config/clyman/ssl.properties $SSL_BASE_DIR/clyman/
    fi
    if [ $OPT = "core" ]; then
      printf "Copying auth0.properties files into Auth0 Base Directory.\n"
      mkdir -p /var/auth0/
      cp deployment/full/config/adrestia/auth0.properties /var/auth0/auth0.properties
    fi
    printf "Starting Secure Aesel Components\n"
    docker-compose -f deployment/full/compose/$OPT/docker-compose.yml up -d
  fi
fi

exit 0
