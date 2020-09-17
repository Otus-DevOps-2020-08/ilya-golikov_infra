# ilya-golikov_infra

ilya-golikov Infra repository

## Задание к лекции 6

### Данные для подключения

testapp_IP = 84.201.134.44

testapp_port = 9292

### Создание инстанса

```
yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --metadata-from-file user-data=./startup.yml
```

## Задание к лекции 5

### Данные для подключения

bastion_IP = 84.201.173.102

someinternalhost_IP = 10.130.0.26

#### Подключение одной командой:

```ssh -i ~/.ssh/appuser -AJ appuser@bastion_IP appuser@someinternalhost_IP```

#### Подключение через алиасы

```
Host bastion
    HostName bastion_IP
    User appuser
    IdentityFIle ~/.ssh/appuser
    ForwardAgent yes

Host someinternalhost
    HostName someinternalhost_IP
    User appuser
    IdentityFile ~/.ssh/appuser
    ForwardAgent yes
    ProxyJump bastion
```
