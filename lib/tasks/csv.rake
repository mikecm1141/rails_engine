require 'csv'

namespace :csv do
  desc "TODO"
  task import_csv: :environment do
  	CSV.foreach('./lib/merchants.csv', headers: true, header_converters: :symbol) do |row|
  		Merchant.create(row.to_h)
  	end

  	CSV.foreach('./lib/items.csv', headers: true, header_converters: :symbol) do |row|
  		Item.create(row.to_h)
  	end

    CSV.foreach('./lib/customers.csv', headers: true, header_converters: :symbol) do |row|
      Customer.create(row.to_h)
    end

  	CSV.foreach('./lib/invoices.csv', headers: true, header_converters: :symbol) do |row|
  		Invoice.create(row.to_h)
  	end

  	CSV.foreach('./lib/invoice_items.csv', headers: true, header_converters: :symbol) do |row|
  		InvoiceItem.create(row.to_h)
  	end

  	CSV.foreach('./lib/transactions.csv', headers: true, header_converters: :symbol) do |row|
  		Transaction.create(row.to_h)
  	end
  end
end
