## План

 * Ingress Controller
 * Ingress
 * Secret
 * TLS
 * LoadBalancer Service
 * Network Policies
 * PersistentVolumes
 * PersistentVolumeClaims

## Что было сделано

 * Снова поднял кластер
 * Втянул в него все, что наработали в прошлом дз
 * Попробовал поскейлить в ноль kube-dns-autoscaler и kube-dns
   * Обнаружил, что kube-dns теперь нет
   * Попробовал прибить coredns, прибилось
   * Пинганул из post-пода comment, получил "unknown host"
   * Вернул dns-autoscaler, пинганул еще раз, адрес нашелся
 * Отредактировал ui-service.yml, заменил NodePort на LoadBalancer
   * Открыл браузер
 * Установил ingress controller
 * Создал ui-ingress.yml, установил, увидел, что на 1.22+ его apiVersion уже работать не будет
 * https://9to5answer.com/get-error-quot-unknown-field-quot-servicename-quot-in-io-k8s-api-networking-v1-ingressbackend-quot-when-switch-from-v1beta1-to-v1-in-kubernetes-ingress - погуглил, перетащил формат спецификации
 * Посмотрел список ingress
```
❯ kubectl get ingress -n dev
NAME   CLASS    HOSTS   ADDRESS        PORTS   AGE
ui     <none>   *       158.160.8.60   80      7m56s
```
 * `get ingress` без нэймспэйса ничего не показывает.

--- 18:48 16.10 перерыв

## 23.10 18:16

 * Поднял, все, что было нужно, стал ждать, когда поднимется ingress
 * Не дождался, обнаружил, что часть подов подохла с сообщением "слишком много подов"
 * Удалил кластер, попробовал пересоздать
 * По умолчанию количество подов в узле выбралось больше ста
 * Перезапустил, попробовал ui-ingress из методички, получил 503

## 24.10 19:40

 * Вернул LoadBalancer в ui-service.yml и после этого ingress стал его показывать
 * Дальше делать не стал, в методичке упоминается gcloud, к которому доступа нет
