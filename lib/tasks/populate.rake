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
      user_type: 0,
      avatar: File.open(File.join(Rails.root, "/app/assets/images/seed/default.jpg"))
    )
    User.create(
      first_name: "Tony",
      last_name: "Stark",
      email: "supervisor@example.com",
      password: "password",
      user_type: 1,
      avatar: File.open(File.join(Rails.root, "/app/assets/images/seed/default.jpg"))
    )
    User.create(
      first_name: "Bruce",
      last_name: "Wayne",
      email: "trainee@example.com",
      password: "password",
      user_type: 2,
      avatar: File.open(File.join(Rails.root, "/app/assets/images/seed/default.jpg"))
    )
    puts "done populating default users"
  end
end