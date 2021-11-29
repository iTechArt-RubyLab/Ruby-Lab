# frozen_string_literal: true

ONLINER = 'https://onliner.by'

MAIN_NEWS_ONE = '//div[@class="b-tiles-outer "]/div/div/div/a[@class="b-tile-main"]/@href'

MAIN_NEWS_TWO = '//div[@class="b-tiles-outer "]/div/div/div/div/a[@class="b-tile-main"]/@href'

MAIN_NEWS_THREE = '//div[@class="b-tiles-outer "]/div/div/div/div/div/a[@class="b-tile-main"]/@href'

MAIN_NEWS_FOUR = '//div[@class="b-tiles-outer "]/div/div/div/div/div/div/a[@class="b-tile-main"]/@href'

CATALOG = '//div[@class="b-catalog-layer"]/div/div/div/div[@style="display: block;"]/a[@class="b-tile-main"]/@href'

MONEY = '//ul[@class="b-opinions-main-2"]/li/div/a/@href'

TITLE = '//div[@class="news-header__title"]/h1/text()'

TEXT = '//div[@class="news-text"]/p'

IMAGE = '//div[@class="news-header__preview"]/div[@class="news-header__image"]/@style'

IMG = '//div[@class="news-header__preview"]/div[@class="news-header__image"]/@style'

REGEX_FOR_LINK = %r{https?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*(),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+}.freeze
