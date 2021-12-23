# frozen_string_literal: true

require 'erb'
require 'prawn'
require 'pdfcrowd'

module Characters
  module Writers
    # service to create pdf file with characters names and links
    class Pdf
      def initialize(names, hash)
        @names = names
        @hash = hash
      end

      def call
        file_generator
      end

      private

      attr_accessor :names, :hash

      def file_generator
        # Create template.
        template = '
        <%# ignore numerous minor requests -- focus on priorities %>
        % hash.each do |name|
          -- <%=name.first%> *link* <%=name.last%>
        % end
        '.gsub(/^  /, '')
        message = ERB.new(File.read(template), trim_mode: '>')
        parsed_data = message.result

        begin
          client = Pdfcrowd::HtmlToPdfClient.new('demo', 'ce544b6ea52a5621fb9d55f8b542d14d')
          client.convertStringToFile(parsed_data, "#{name}.pdf")
        rescue Pdfcrowd::Error => e
          warn "Pdfcrowd Error: #{e}"
          raise
        end
      end
    end
  end
end
