namespace :db do
  desc "Create dummy data"
  task :populate => :init_env do
    %w(db:populate_default_admin).each do |t|
      Rake::Task[t].invoke
      puts "done populating. Please check your data"
    end
  end

  desc "Create default Admin"
  task :populate_default_admin => :init_env do
    User.create(
      first_name: "John",
      last_name: "Doe",
      email: "admin@example.com",
      password: "admin123",
      user_type: "supervisor",
      admin: true
      avatar: File.open(File.join(Rails.root, "/app/assets/images/seed/default.jpg"))
    )
    puts "done populating default admin"
  end
end