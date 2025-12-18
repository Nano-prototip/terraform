# Ответы

## Задание 1

### Вопрос 1. 
Все зависимости были установлены через `terraform init`

### Вопрос 2. 
Секретную информацию можно хранить в файле `personal.auto.tfvars`. В дирректории `.terraform/` хранится кэш провайдеров и модулей, а *.tfstate.* это хранение состояния инфраструктуры, там хранится результат применения tf-скриптов.

### Вопрос 3.
"result": "3BP8qpOi8MmH5TXk"

### Вопрос 4.
Объяснение по ошибкам:

Terraform ожидает, что будет указан как тип, так и имя ресурса. В нашем случае был просто указан тип ресурса:
```
│ Error: Missing name for resource
│ 
│   on main.tf line 23, in resource "docker_image":
│   23: resource "docker_image" {
│ 
│ All resource blocks must have 2 labels (type, name). 
```

В Terraform нельзя, чтобы имя ресурса начиналось с цифры:
```
│ Error: Invalid resource name
│ 
│   on main.tf line 28, in resource "docker_container" "1nginx":
│   28: resource "docker_container" "1nginx" {
│ 
│ A name must start with a letter or underscore and may contain only letters, digits, underscores, and dashes.
```
Terraform не смог найти подобные данные, здесь опечатка:
```
│ Error: Reference to undeclared resource
│ 
│   on main.tf line 30, in resource "docker_container" "nginx":
│   30:   name  = "example_${random_password.random_string_FAKE.resulT}"
│ 
│ A managed resource "random_password" "random_string_FAKE" has not been declared in the root module.
```

### Вопрос 5. 

Исправленный tf в файле `answer5-terraform.tf`
Вывод команды `docker ps` находится в файле `answer5-docker.md`

### Вопрос 6. 

Ключ `-auto-approve` автоматически подтверждает план выполнения Terraform без какого-либо интерактивного запроса. Это означает, что Terraform немедленно начнет создавать, изменять или удалять инфраструктурные ресурсы, пропуская критически важный шаг ручной проверки.
Пригодится если terraform участвует в CI/CD (автоматизация), может использоваться в тестовых средах, либо нужен для выполнения определенного шага раз в какое-то время (например запуск программ вне рабочее время).

Вывод команды `docker ps` находится в файле `answer6-docker.md`

### Вопрос 7. 
Все ресурсы уничтожены. Содержимое стейта в файле `answer7-terraform.tfstate`

### Вопрос 8.
Образ не удалился, потому что в описании ресурса для образа установлено следующее:
```
keep_locally = true
```

Ответ из [документации](https://library.tf/providers/kreuzwerker/docker/latest/docs/resources/image#optional):
```
keep_locally (Boolean) If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation.
```
