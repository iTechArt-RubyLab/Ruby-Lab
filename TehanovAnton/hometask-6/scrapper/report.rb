# frozen_string_literal: true

require 'fileutils'

# ReportCsv
class Report
  attr_reader :data, :config

  REPORTS_PATH = './reports'
  REPORT_EXTENSION = '.csv'

  def initialize(data, config)
    @data = data
    @config = config
  end

  def report
    CSV.open(report_path, 'w') do |csv|
      csv << config['headers']
      data.each do |row|
        csv << row
      end
    end
  end

  private

  def report_path
    "#{site_reports_path}/#{file_name}"
  end

  def site_reports_path
    "#{REPORTS_PATH}/#{config['name']}".tap { |dir_name| FileUtils.mkdir_p(dir_name) }
  end

  def file_name
    Time.now.strftime("%d%m%Y_%H%M%S#{REPORT_EXTENSION}")
  end
end
