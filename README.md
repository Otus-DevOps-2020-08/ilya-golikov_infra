[![Build Status](https://travis-ci.com/Otus-DevOps-2020-08/ilya-golikov_infra.svg?branch=master)](https://travis-ci.com/Otus-DevOps-2020-08/ilya-golikov_infra)

# ilya-golikov_infra

ilya-golikov Infra repository

## Задание к лекции 13

- Создана ветка ansible-4;

- Установлен Vagrant;

- Роли доработаны и протестированы в Vagrant;

- В Vagrantfile добавлена конфигурация, настраивающая nginx;

- Установлена molecule, роль db протестирована с помощью molecule;

- Добавлен тест, проверящий работу mongodb на 27017 порту;


## Задание к лекции 12

- Создана ветка ansible-3;

- Конфигурация db и app теперь в виде ролей;

- Созданы ansible окружения: prod и stage;

- Директория ansible настроена согласно best practics;

- Добавлена роль nginx;

- Добавлен плейбук для создания пользователей, данные с именами и паролями зашифрованы с помощью ansible-vault;

- Динамические inventory настроены для каждого окружения;

- Добавлены скрипты в travis, выполняющие проверки: packer validate, terraform validate, tflint и ansible-lint;

## Задание к лекции 11

- Создана ветка ansible-2;

- Создано 3 варианта деплоя приложения: Один плейбук - один сценарий, Один плейбук - несколько сценариев, несколько плейбуков;

- Провижен в пакере теперь выполняется через ansible;

- Использован скрипт, создающий динамический репозиторий, написанный на прошлом задании;

## Задание к лекции 10

- Создана ветка ansible-1;

- Установлен ansible через pip3;

- Запущена инфраструктура из stage окружения, соданная в прошлом задании;

- Создан inventory в ini формате;

- Создан файл настроек ansible.cfg

- Создан inventory в yaml формате;

- Написан простой плейбук;

- Написан скрипт, генерирующий инвентори в json формате.

## Задание к лекции 9

- Создана ветка terraform-2;

- Созданы модули для деплоя db и app;

- Созданы окружения stage и prod;

- Создан бекенд S3 в бакете для хранения стейт файла;

- Настроен провижен, разворачивающий приложение;

## Задание к лекции 8

### Выполненные действия

- Создана ветка terraform-1;

- Установлен Terraform;

- Настроен провайдер Yandex Cloud;

- Описан ресурс для создания инстанса Reddit app;

- Переменные вынесены в отдельный файл;

- Внешний адрес выводится через outputs.tf;

- Описано ресурс для создания load-balancer'а;

- Увеличено количество создаваемых инстансов Reddit app до двух с помощью переменной count;

## Задание к лекции 7

### Выполненные действия

- Создана ветка packer-base в репозитории;

- Скрипты с прошлого ДЗ перенесены в config-scripts;

- Установлен Packer;

- Создан сервисный аккаунт, делегированы права, создан и экспортирован account-key;

- Создан шаблон ubuntu16.json для packer;

- Созданы скрипты для provision образа;

- Выполнена проверка шаблона и запущена сборка;

- Исправлена ошибка, из-за которой сборка образа завершалась ошибкой `Build 'yandex' errored: Failed to find instance ip address: instance has no one IPv4 external address.`;

- Создана ВМ на основе собранного образа;

- Установлено и проверено приложение reddit;

- Переменные `service_account_key_file`, `folder_id` и `source_image_family` вынесены в отдельный файл variables.json;

- Добавлены дополнительные опции builder'а: `zone`, `disk_name`,`disk_size_gb` и `image_description`;

- Создан bake образ, с установленным приложением reddit;

- Создан скрипт create-reddit-vm.sh для создания машины с помощью cli;

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
