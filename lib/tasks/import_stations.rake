#this imports station data from a CSV file, use after importing station data
#useage: rake db:import_stations["notes/station-data.csv"]

namespace :db do
    desc "Import station data from csv file" 
    task :import_stations, [:filename] => :environment do |task, args|
        require 'csv'

        puts "Importing station data..."

        CSV.parse(File.read(args[:filename]), headers: true).each do |row|
            import_station(row.to_hash)
        end
    end

    def import_station(item)
        station = Station.new({
            identifier: item["identifier"],
            name:       item["name"],
            address:    item["address"]})
        if station.save
            puts "sucessfully imported #{item["name"]}\n"
        else
            puts "failed import:  #{item["name"]}\n"
        end
    end

end