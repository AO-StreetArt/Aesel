#!/bin/bash

# Env-Specific variables

# Database Variables
export MONGO_INIT_USER=mongo
export MONGO_INIT_PW=password
export MONGO_CLYMAN_USER=mongo
export MONGO_CLYMAN_PW=password
export MONGO_ADRESTIA_USER=mongo
export MONGO_ADRESTIA_PW=password
export MONGO_PROJECTS_USER=mongo
export MONGO_PROJECTS_PW=password
export MONGO_KELONA_USER=mongo
export MONGO_KELONA_PW=password
export NEO4J_USER=neo4j
export NEO4J_PW=password

# Crazy Ivan Variables
export IVAN_UN=ivan
export IVAN_PW=password
export IVAN_HASH_PW=ivanHash
export IVAN_OUT_AES_KEY=
export IVAN_OUT_AES_IV=
export IVAN_OUT_AES_PASSWORD=
export IVAN_OUT_AES_SALT=
export IVAN_REGISTRATION_AES_KEY=
export IVAN_REGISTRATION_AES_IV=
export IVAN_REGISTRATION_AES_PASSWORD=
export IVAN_REGISTRATION_AES_SALT=
export IVAN_IN_AES_KEY=
export IVAN_IN_AES_IV=
export IVAN_IN_AES_PASSWORD=
export IVAN_IN_AES_SALT=

# CLyman Variables
export CLYMAN_UN=clyman
export CLYMAN_PW=password
export CLYMAN_HASH_PW=clymanHash
export CLYMAN_OUT_AES_KEY=
export CLYMAN_OUT_AES_IV=
export CLYMAN_OUT_AES_PASSWORD=
export CLYMAN_OUT_AES_SALT=
export CLYMAN_IN_AES_KEY=
export CLYMAN_IN_AES_IV=
export CLYMAN_IN_AES_PASSWORD=
export CLYMAN_IN_AES_SALT=

# Kelona Variables
export KELONA_UN=kelona
export KELONA_PW=kelona

# AeselProjects Variables
export PROJECTS_UN=projects
export PROJECTS_PW=projects

# Adrestia Variables
export ADRESTIA_INIT_UN=aesel
export ADRESTIA_INIT_PW=password

# SSL Variables
export PEM_PASSWORD=password
export AESEL_DOMAIN=local
export SSL_BASE_DIR=/var/ssl
export SSL_KEYSTORE_PW=password

# Network Variables
export NETWORK_INTERFACE_ADDRESS=

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
    printf "Starting Secure Aesel Components\n"
    docker-compose -f deployment/full/compose/$OPT/docker-compose.yml up -d
  fi
fi

exit 0
