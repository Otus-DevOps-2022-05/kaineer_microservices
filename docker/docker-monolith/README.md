## 2022.08.03

### 20:50

Лог пришлось хорошенько поредактировать (был слишком длинным).

### 20:55

Вы серьёзно, писать текстушку в лог? FML

### 21:08

Как и следовало ожидать, содержимое container inspect
имеет ссылку на image и описывает конфигурацию хоста,
на котором контейнер запущен.

Ясное дело образ не может содержать этих деталей, т.к. является только заготовкой контейнера.

За прошедшие пару недель слышал много разных вариантов объяснений взаимоотношений образа и
контейнера. Приведу своё: можно сказать, что image - это исполняемый файл, лежащий на диске,
а container - экземпляр выполняемой программы, загруженной в память (тут, конечно, не совсем точно)
и в которой всё готово для её выполнения.

Удивительным образом контейнер в любой момент м.б. остановлен и это довольно выгодно отличает
его от программы (другой такой среды исполнения я ещё не знаю).

### 21:16

`docker system df` жрёт удивительное количество времени.

```
TYPE            TOTAL     ACTIVE    SIZE      RECLAIMABLE
Images          20        5         7.888GB   4.178GB (52%)
Containers      6         0         2.957GB   2.957GB (100%)
Local Volumes   7         0         387.5MB   387.5MB (100%)
Build Cache     0         0         0B        0B
```
