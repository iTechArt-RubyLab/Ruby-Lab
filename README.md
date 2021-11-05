# Ruby Lab 2021-2022

## Домашние задания
### Задание 1
1. В папке с домашним заданием `hometask-1` создать файл `hello_world.rb` с кодом, который выводит в консоль "Hello world!".
2. Файл должен быть исполняемым.

### Задание 2
1. Завести аккаунт с почтовым ящиком iTechArt на [codewars](https://www.codewars.com/).
2. Решить онлайн [задание](https://www.codewars.com/kata/56747fd5cb988479af000028/train/ruby).
3. Код с решением поместить в файл `get_middle_charachter.rb` в папку с домашним заданием `hometask-2`.
4. В этот же файл добавить функцию `run_cli`, которая ожидает ввод пользователя.
Пример работы с вводом и выводом был разобран на воркшопе.
Если пользователь ввел `exit!`, программа должна завершиться.
Если пользователь ввел пустую строку, программа должна вывести сообщение об ошибке и ожидать следующий ввод пользователя.
В остальных случаях в консоль выводится результат вызова функции `get_middle` c введенной строкой,
после чего программа ожидает следующий ввод пользователя.
Файл должен быть исполняемым.
Пример работы программы:
```
$ ./get_middle_character.rb
Enter string:

String can not be blank!
Enter string:
test
Middle character: es
Enter string:
exit!
```

## Гайд по оформлению домашнего задания
### Краткое описание
Код каждого домашнего задания должен быть отправлены на проверку в качестве PR (Pull Request).
Только после того, как PR был проверен и одобрен ментором, PR можно мержить.
Задание считается выполненым только после того, как оно было замержено.
Все домашние задания должны находиться в папке с вашим ником в GitHub.

### Инструкция по оформлению
1. [Сделать форк](https://docs.github.com/en/get-started/quickstart/fork-a-repo#forking-a-repository) этого репозитория
2. [Сделать клон](https://docs.github.com/en/get-started/quickstart/fork-a-repo#cloning-your-forked-repository) своего форка
3. [Создать ветку](https://docs.github.com/en/github/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-and-deleting-branches-within-your-repository#creating-a-branch) со своим ником и названием домашнего задания
4. В корне репозитория создать папку с именем своего никнейма в GitHub
5. В своей папке создать папку с названием домашнего задания
6. В папке с домашним заданием создать все необходимые файлы с кодом
7. По завершению задания [добавить изменения](https://github.com/git-guides/git-add), [cоздать](https://github.com/git-guides/git-commit)  [запушить](https://github.com/git-guides/git-push) коммит в свою ветку
8. [Создать PR](https://docs.github.com/en/github/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request-from-a-fork) с домашним заданием для ветки rubylab-2021-2022
9. Скинуть ссылку на PR своему ментору и дождаться его ревью
10. [Замержить](https://docs.github.com/en/github/collaborating-with-pull-requests/incorporating-changes-from-a-pull-request/merging-a-pull-request) PR, если ментор одобрил PR
