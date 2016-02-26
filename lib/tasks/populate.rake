namespace :db do
  desc "Create dummy data"
  task :populate => :environment do
    %w(db:populate_default_admin).each do |t|
      Rake::Task[t].invoke
      puts "done populating. Please check your data"
    end
  end

  desc "Create default Admin"
  task :populate_default_admin => :environment do
    User.create(
      first_name: "John",
      last_name: "Doe",
      email: "admin@example.com",
      password: "admin123",
      user_type: 0
    )
    User.create(
      first_name: "Tony",
      last_name: "Stark",
      email: "supervisor@example.com",
      password: "password",
      user_type: 1
    )
    User.create(
      first_name: "Bruce",
      last_name: "Wayne",
      email: "trainee@example.com",
      password: "password",
      user_type: 2
    )
    puts "done populating default users"
  end
end