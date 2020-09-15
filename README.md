# ilya-golikov_infra

ilya-golikov Infra repository

# Задание к лекции 5

## Данные для подключения

bastion_IP = 84.201.173.102

someinternalhost_IP = 10.130.0.26

### Подключение одной командой:

```ssh -i ~/.ssh/appuser -AJ appuser@bastion_IP appuser@someinternalhost_IP```

### Подключение через алиасы

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
