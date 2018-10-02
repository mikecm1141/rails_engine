require 'csv'

namespace :csv do
  desc "TODO"
  task import_csv: :environment do
  	CSV.foreach('./lib/merchants.csv', headers: true, header_converters: :symbol) do |row|
  		Merchant.create(row.to_h)
  	end
  end
end
