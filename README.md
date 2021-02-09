## Деплой java прилажения "hello" (tomcat9) 

### Задача:
Упаковать Java приложение в Docker- контейнер. Процесс сборки производить также в контейнере.

### Запуск
```docker build . -t mytomcat9```

```docker run -d -p 8080:8080 mytomcat9 ```

### Проверка
В браузере http://localhost:8080/hello-1.0