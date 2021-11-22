### Задание 4
#### Задание 4.1
1. Код с решением поместить в файл `my_array_rotate.rb` в папку с домашним заданием `hometask-4`.
2. Рacширить класс `Array` методaми `lab_rotate` и `lab_rotate!`, которые реализуют циклический сдвиг.  
   Метод `lab_rotate` циклически сдвигает массив без изменения объекта.  
   Метод `lab_rotate!` циклически сдвигает массив c изменением объекта.  
   В качестве аргумента метод принимает число элементов, на которое нужно сдвинуть массив.  
   Если число положительное, то массив циклически сдвигается влево.  
   Если число отрицательное, то массив циклически сдвигается вправо.  
   По умолчанию массив циклически сдвигается на 1 элемент влево.  
   Задание подразумевает самостоятельную реализацию циклического сдвига, т.е. использовать [Array#rotate](https://ruby-doc.org/core-3.0.2/Array.html#method-i-rotate) или [Array#rotate!](https://ruby-doc.org/core-3.0.2/Array.html#method-i-rotate-21) нельзя.  
   C ростом размера сдвига скорость циклического сдвига, реализованного в `Array#lab_rotate` и `Array#lab_rotate!`, не должна значительно отличаться от скорости сдвига, реализованного в `Array#rotate` или `Array#rotate!` соответственно.  
   С помощью модуля [Benchmark](https://ruby-doc.org/stdlib-2.5.3/libdoc/benchmark/rdoc/Benchmark.html) произвести сравнение производительности `Array#lab_rotate` и `Array#lab_rotate!` c `Array#rotate` и `Array#rotate!` соответственно.  
   Сравнение описать в файле `my_array_rotate_benchmark.rb`.

Пример работы программы:
```
$ irb
irb(main):001:0> require './my_array_rotate.rb'
=> true
irb(main):002:0> arr = (1..7).to_a
=> [1, 2, 3, 4, 5, 6, 7]
irb(main):003:0> arr.lab_rotate
=> [2, 3, 4, 5, 6, 7, 1]
irb(main):004:0> arr
=> [1, 2, 3, 4, 5, 6, 7]
irb(main):005:0> arr.lab_rotate!(-3)
=> [5, 6, 7, 1, 2, 3, 4]
irb(main):006:0> arr
=> [5, 6, 7, 1, 2, 3, 4]
```

#### Задание 4.2
1. Код с решением поместить в файл `my_hash.rb` в папку с домашним заданием `hometask-4`.
2. Реализовать класс `MyHash` подобно классу [Hash](https://ruby-doc.org/core-3.0.2/Hash.html).  
   Для класса `MyHash` необходимо реализовать следующие операции:
* Запись по ключу
* Чтение по ключу
* Удаление пары ключ-значение
* Подсчет размера хэша
* Очищение всех пар ключ-значение без создание нового объекта.  
  Класс должен быть расширен модулем [Enumerable](https://ruby-doc.org/core-3.0.2/Enumerable.html).  
  Задание подразумевает самостоятельную реализацию хэша, т.е. использовать [Hash](https://ruby-doc.org/core-3.0.2/Hash.html) нельзя.  
  C ростом числа пар ключ-значение скорост записи и чтения по ключу не должна значительно отличаться от стандартной имплементации [Hash](https://ruby-doc.org/core-3.0.2/Hash.html).  
  С помощью модуля [Benchmark](https://ruby-doc.org/stdlib-2.5.3/libdoc/benchmark/rdoc/Benchmark.html) произвести сравнение производительности реализаванных операций `MyHash` с операциями в `Hash`.  
  Сравнение описать в файле `my_hash_benchmark.rb`.

Пример работы программы:
```
$ irb
irb(main):001:0> require './my_hash.rb'
=> true
irb(main):002:0> my_hash = MyHash.new
=> #<MyHash:0x00007ff1d38a3d98 ... >
irb(main):003:0> my_hash['hello'] = 'world'
=> "world"
irb(main):004:0> my_hash['hello']
=> "world"
irb(main):005:0> my_hash['foo']
=> nil
irb(main):006:0> my_hash.each do |k, v|
irb(main):007:1* print "#{k} => "
irb(main):008:1> puts v
irb(main):009:1> end
hello => world
=> #<MyHash:0x00007ff1d38a3d98 ... >
```
