namespace :db do
  desc 'Check to see if the database already exists'
  task :exists do
    begin
      Rake::Task['environment'].invoke
      ActiveRecord::Base.connection
    rescue
      exit 1
    else
      exit 0
    end
  end
end