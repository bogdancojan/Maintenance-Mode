namespace :maintenance do
  desc "Enable maintenance mode"
  task :start do
    FileUtils.touch(Rails.root.join('tmp', 'maintenance.yml'))
    puts "Maintenance mode enabled"
  end

  desc "Disable maintenance mode"
  task :stop do
    FileUtils.rm(Rails.root.join('tmp', 'maintenance.yml'))
    puts "Maintenance mode disabled"
  end
end
