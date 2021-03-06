#!/bin/bash

set -e

# Деплоим призма-схему
deploy-api-schema.sh

# Проверяем наличие схемы
# Пока ее не будет, дальнейшее выполнение нельзя делать
# while [ ! -f "src/schema/generated/api.fragments.js" ]; do
#   >&2 echo "Schema still not deployed from api service - sleeping"
#   sleep 5
# done

# >&2 echo "Deployed schema exists - executing command"

if [ $ENV_MODE = "production" ] ; then

  yarn prisma:deploy;
  yarn generate:types;
  yarn build;
  # yarn react-scripts --max-old-space-size=3000 build

fi
