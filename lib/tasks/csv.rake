require 'csv'
require 'ruby-progressbar'

namespace :import do
  desc "Imports sales data from CSV files"
  task csv: :environment do
    puts 'Importing merchants from CSV...'
    merchantprogress = ProgressBar.create(title: 'Merchants', starting_at: 0, format: "\e[0;32m%t: |%B|\e[0m", length: 79, total: 100)
  	CSV.foreach('./lib/merchants.csv', headers: true, header_converters: :symbol) do |row|
      merchantprogress.increment
  		Merchant.create(row.to_h)
  	end
    puts "Finished importing merchants. #{Merchant.count} added.\n\n"

    puts 'Importing items from CSV...'
    itemprogress = ProgressBar.create(title: 'Items', starting_at: 0, format: "\e[0;32m%t: |%B|\e[0m", length: 79, total: 2483)
  	CSV.foreach('./lib/items.csv', headers: true, header_converters: :symbol) do |row|
      itemprogress.increment
      row[:unit_price] = row[:unit_price].to_f / 100
  		Item.create(row.to_h)
  	end
    puts "Finished importing items. #{Item.count} items added.\n\n"

    puts 'Importing customers from CSV...'
    customerprogress = ProgressBar.create(title: 'Customers', starting_at: 0, format: "\e[0;32m%t: |%B|\e[0m", length: 79, total: 1000)
    CSV.foreach('./lib/customers.csv', headers: true, header_converters: :symbol) do |row|
      customerprogress.increment
      Customer.create(row.to_h)
    end
    puts "Finished importing customers. #{Customer.count} customers added.\n\n"

    puts 'Importing invoices from CSV...'
    invoiceprogress = ProgressBar.create(title: 'Invoices', starting_at: 0, format: "\e[0;32m%t: |%B|\e[0m", length: 79, total: 4843)
  	CSV.foreach('./lib/invoices.csv', headers: true, header_converters: :symbol) do |row|
      invoiceprogress.increment
  		Invoice.create(row.to_h)
  	end
    puts "Finished importing invoices. #{Invoice.count} invoices added.\n\n"

    puts "Importing invoice items from CSV..."
    invoiceitemprogress = ProgressBar.create(title: 'Invoice Items', starting_at: 0, format: "\e[0;32m%t: |%B|\e[0m", length: 79, total: 21687)
  	CSV.foreach('./lib/invoice_items.csv', headers: true, header_converters: :symbol) do |row|
      invoiceitemprogress.increment
      row[:unit_price] = row[:unit_price].to_f / 100
  		InvoiceItem.create(row.to_h)
  	end
    puts "Finished importing invoice items. #{InvoiceItem.count} invoice items added.\n\n"

    puts "Importing transactions from CSV..."
    transactionprogress = ProgressBar.create(title: 'Transactions', starting_at: 0, format: "\e[0;32m%t: |%B|\e[0m", length: 79, total: 5595)
  	CSV.foreach('./lib/transactions.csv', headers: true, header_converters: :symbol) do |row|
      transactionprogress.increment
  		Transaction.create(row.to_h)
  	end
    puts "Finished importing transactions. #{Transaction.count} transactions added.\n\n"
  end
end
