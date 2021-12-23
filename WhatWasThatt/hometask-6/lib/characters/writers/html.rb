# frozen_string_literal: true
# # frozen_string_literal: true

# require 'erb'
# require_relative 'html_template'

# module Characters
#   module Writers
#     class Html
#       include HtmlTemplate

#       def initialize(name, hash)
#         @name = name
#         @hash = hash
#       end

#       def call
#         rhtml = ERB.new(template).run
#       end
#     end
#   end
# end

# # Characters::Writers::Html.new('zxc', { a: 4, b: 5 }).call
