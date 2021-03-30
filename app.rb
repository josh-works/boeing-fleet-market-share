require 'sinatra'
require 'csv'

get "/" do
  erb :index
end

post "/sponsors" do
  File.open("production.log", "a") do |file|
    file.puts params
  end
end

get "/sponsors" do
  File.open("production.log").read
end

get "/api/top-models-by-number" do
  load_csv_data
end

def load_csv_data
  csv = DataGetter.get_top_models_by_number
  csv.to_json
end

class DataGetter
  def self.get_top_models_by_number
    file_path = 'data/top-10-models-by-number.csv'
    rows = CSV.read(file_path, headers: true, header_converters: :symbol)
    
    results = []
    rows.map do |row|
      results << row.to_hash
    end
    results
  end
end