# klar-ci

[coreos/clair](https://github.com/coreos/clair) docker container extended with [optiopay/klar](https://github.com/optiopay/klar) for ease of use within [gitlab-ci](https://about.gitlab.com/features/gitlab-ci-cd/).

## dockerhub with gitlab-ci
```yaml
services:
  - name: arminc/clair-db
    alias: postgres
image: rsteube/klar-ci

nginx:
  script: klar-ci nginx
```

## amazon ecr with gitlab-ci

```yaml
variables:
  #AWS_ACCESS_KEY_ID
  #AWS_SECRET_ACCESS_KEY
  AWS_REGION: eu-central-1
services:
  - name: arminc/clair-db
    alias: postgres
image: rsteube/klar-ci

nginx:
  script: klar-ci nginx
 
oauth2-proxy:
  script: klar-ci oauth2-proxy
```
