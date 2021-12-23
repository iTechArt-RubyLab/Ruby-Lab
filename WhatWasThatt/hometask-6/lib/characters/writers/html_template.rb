# frozen_string_literal: true

module HtmlTemplate
  def template
    hash = { a: 5, k: 6 }
    %(
  <html>
    <head><title>Ruby Toys -- <%= 2 %></title></head>
    <body>
      <ul>
        <%= hash %>
      </ul>
    </body>
  </html>
).gsub(/^  /, '')
  end
end
