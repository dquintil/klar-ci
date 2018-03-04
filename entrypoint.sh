#!/bin/sh
/clair 2>&1 >/dev/null &

aws_env(){
  export AWS_DEFAULT_REGION="${AWS_DEFAULT_REGION:-$AWS_REGION}"
  DOCKER_LOGIN=`aws ecr get-login`
  unset AWS_ACCESS_KEY_ID
  unset AWS_SECRET_ACCESS_KEY

  PASSWORD=`echo $DOCKER_LOGIN | cut -d' ' -f6`
  
  export REGISTRY=`echo $DOCKER_LOGIN | cut -d' ' -f9 | sed "s/https:\/\///"`
  export DOCKER_USER=AWS
  export DOCKER_PASSWORD=${PASSWORD}
}

[ -z "$AWS_ACCESS_KEY_ID" -o -z "$AWS_SECRET_ACCESS_KEY" ] || aws_env

exec "$@"
