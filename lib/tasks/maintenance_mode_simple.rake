namespace :maintenance do
  desc "Enable maintenance mode"
  task :start do
    File.write(Rails.root.join('tmp', 'maintenance.yml'), "enabled: true")
    puts "Maintenance mode enabled"
  end

  desc "Disable maintenance mode"
  task :stop do
    File.delete(Rails.root.join('tmp', 'maintenance.yml')) if File.exist?(Rails.root.join('tmp', 'maintenance.yml'))
    puts "Maintenance mode disabled"
  end
end
