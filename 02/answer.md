# Ответы

## Задание 1

![5341600961924895433](https://github.com/user-attachments/assets/af2d9366-bce3-4f79-a195-81f22f799557)

![5341600961924895436](https://github.com/user-attachments/assets/b305f109-bac5-406d-bf05-f10d7ae5f64d)

### Вопрос 2

Ошибка связана с тем, что standart-v4 не существует. Исправил на "standard-v3":
```
│ Error: Error while requesting API to create instance: client-request-id = 96bfd7a8-675a-46ae-8a26-ccc06a722302 client-trace-id = ae7a347a-3631-46de-b232-29c6fa0d9953 rpc error: code = FailedPrecondition desc = Platform "standart-v4" not found
│ 
│   with yandex_compute_instance.platform,
│   on main.tf line 15, in resource "yandex_compute_instance" "platform":
│   15: resource "yandex_compute_instance" "platform" {
│ 
```

Далее ошибка cвязана с тем, что core_fraction имеет значение 5, когда допустимо 20, 50, 100. Исправил на 20.:
```
 Error: Error while requesting API to create instance: client-request-id = 71aae73d-dc5e-44fc-9f12-ccea6b45969c client-trace-id = 6ddcfb28-d50a-4762-b6de-e0d344a27eef rpc error: code = InvalidArgument desc = the specified core fraction is not available on platform "standard-v3"; allowed core fractions: 20, 50, 100
│ 
│   with yandex_compute_instance.platform,
│   on main.tf line 15, in resource "yandex_compute_instance" "platform":
│   15: resource "yandex_compute_instance" "platform" {
│
```

Далее ошибка cвязана с тем, что cores имеет значение 1, когда разрешено 2, 4. Исправил на 2.:
```
│ Error: Error while requesting API to create instance: client-request-id = f9266be3-ddb9-4d78-b914-1216746abfaf client-trace-id = 29990dd2-b3df-4e0d-a0c4-3bfcf4ade683 rpc error: code = InvalidArgument desc = the specified number of cores is not available on platform "standard-v3"; allowed core number: 2, 4
│ 
│   with yandex_compute_instance.platform,
│   on main.tf line 15, in resource "yandex_compute_instance" "platform":
│   15: resource "yandex_compute_instance" "platform" {
│ 
```

### Вопрос 6
Параметры `preemptible = true` и `core_fraction = 5` заметно снижают денежные затраты.

`preemptible = true` - настраивает прерываемость ВМ-ки, если она не будет использоваться, тем самым снижая затраты денежных средств.
`core_fraction = 5` - настраивает потребление CPU (5%) что снижает стоимость данной ВМ.

## Задание 4

![5341600961924895435](https://github.com/user-attachments/assets/7a876db9-0494-4fb7-8082-304e9b291136)

