require_relative 'config.rb'

page = Config.new.config('https://onliner.by')

doc = Nokogiri::HTML(page)

REGEX_FOR_LINK = /http[s]?:\/\/(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*(),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+/

# первый блок новостей

# название статей

all_news_from_first_block = doc.xpath("//*[@id='container']/div/div/div/div/div[2]") #ссылка на все новости первого блока
titles_from_first_block = all_news_from_first_block.text # назване новости и непонятные символы, надо убрать через регулярки
delete_all_spaces = titles_from_first_block.gsub("\n","") # удаление всех переносов

# картинки из первого блока

links_for_all_pictires_of_first_block =
(doc.xpath("//*[@id='widget-1-1']").to_s).scan(REGEX_FOR_LINK).last,
(doc.xpath("//*[@id='widget-5-1']").to_s).scan(REGEX_FOR_LINK).last,
(doc.xpath("//*[@id='widget-9-1']").to_s).scan(REGEX_FOR_LINK).last,
(doc.xpath("//*[@id='widget-2-1']").to_s).scan(REGEX_FOR_LINK).last,
(doc.xpath("//*[@id='widget-6-1']").to_s).scan(REGEX_FOR_LINK).last,
(doc.xpath("//*[@id='widget-10-1']").to_s).scan(REGEX_FOR_LINK).last

#текст статьи из первого блока

#text_of_first_block_number_one = doc.xpath("//*[@id='container']/div/div[2]/div/div/div[4]/div[1]/div[1]/div/div/div/div[1]/div[2]/div[4]/div")

# второй блок новостей

# название новостей из второго раздела

all_titles_news_from_second_block =
(doc.xpath (" //*[@id='widget-1-10']/div[2]/a/h3")).children.text,
(doc.xpath (" //*[@id='widget-2-10']/div[2]/a/h3")).children.text,
(doc.xpath (" //*[@id='widget-3-10']/div[2]/a/h3")).children.text,
(doc.xpath (" //*[@id='widget-4-10']/div/a/h3")).children.text,
(doc.xpath ("//*[@id='widget-5-10']/div[1]/a/h3")).children.text,
(doc.xpath (" //*[@id='widget-1-10']/div[2]/a/h3")).children.text

# картинки из второго блока

links_for_all_pictires_of_second_block =
(doc.xpath("//*[@id='widget-1-10']/div[1]/picture").to_s).scan(REGEX_FOR_LINK).last,
(doc.xpath("//*[@id='widget-2-10']/div[1]/picture").to_s).scan(REGEX_FOR_LINK).last,
(doc.xpath("//*[@id='widget-3-10']/div[1]/picture").to_s).scan(REGEX_FOR_LINK).last,
(doc.xpath("//*[@id='widget-4-10']/div[1]/picture").to_s).scan(REGEX_FOR_LINK).last,
(doc.xpath("//*[@id='widget-5-10']/div[1]/picture").to_s).scan(REGEX_FOR_LINK).last

#текст статьи из второго блока

____

# третий блок новостей

# название статей

all_titles_news_from_third_block =
(doc.xpath ("//*[@id='container']/div/div/div/div/div[5]/ul/li[1]/a/div/span[1]")).children.text,
(doc.xpath ("//*[@id='container']/div/div/div/div/div[5]/ul/li[2]/a/div/span[1]")).children.text,
(doc.xpath ("//*[@id='container']/div/div/div/div/div[5]/ul/li[3]/a/div/span[1]")).children.text,
(doc.xpath ("//*[@id='container']/div/div/div/div/div[5]/ul/li[4]/a/div/span[1]")).children.text

# картинки из третьего блока

links_for_all_pictires_of_third_block =
(doc.xpath("//*[@id='container']/div/div/div/div/div[5]/ul/li[1]/a/picture").to_s).scan(REGEX_FOR_LINK).last,
(doc.xpath("//*[@id='container']/div/div/div/div/div[5]/ul/li[2]/a/picture").to_s).scan(REGEX_FOR_LINK).last,
(doc.xpath("//*[@id='container']/div/div/div/div/div[5]/ul/li[3]/a/picture").to_s).scan(REGEX_FOR_LINK).last,
(doc.xpath("//*[@id='container']/div/div/div/div/div[5]/ul/li[4]/a/picture").to_s).scan(REGEX_FOR_LINK).last

# текст статьи из третьего блока
# //*[@id='container']/div/div[2]/div/div/div[4]/div[1]/div[1]/div/div/div/div[1]/div[2]/div[4]/div/p
# "//*[@id='container']"
