# rasa-x-infra
rasa-x infra and deployment scripts for quick evaluation purpose

## Steps
2 quick installations mode on simple instance (docker-compose or k8s with k3s)

* (not provided here): Deploy instance (on openstack,aws,or local PC) with minimum 8GoRAM,>16CPU and 50G Disk, provide internet access (through http_proxy, in case of onpremise private cloud and corporate proxy)
* [quick installation in docker-compose mode](#install-with-docker-compose)
* [quick installation in k8s embedded mode](#install-with-k8s)
* When rasa-x installed, connect on UI and provide a sample NLU data,model,actions from example https://rasa.com/docs/rasa/playground/. Please find a sample data,mdoel in git https://github.com/pli01/rasa-playground
* TODO: script to inject data (curl, api). Note: in opensource version ,git with ssh is only provided (git https only in enterprise version)

## install with docker compose
rasa-x docker-compose install from [rasa-x documentation](https://rasa.com/docs/rasa-x/installation-and-setup/install/docker-compose)
This steps, will install on an instance,  docker, docker-compose, deploy rasa-x  docker-compose.yml file

* [install docker-compose script](./quick-install/install-docker-compose.sh)

## install with k8s

 rasa-x k8s quick  install with k3s from [rasa-x documentation](https://rasa.com/docs/rasa-x/installation-and-setup/install/quick-install-script#embedded-cluster-installation)

For K3S customisation , see options on [K3S documentation](https://www.rancher.co.jp/docs/k3s/latest/en/installation/)

This steps, will install k3s, deploy rasa-x helm file

* [install k8s script](./quick-install/install-k8s.sh)

