ROLE = 'weekly_workshop'
namespace :db do
  desc "Create missing PG roles"
  task :create_user do
    sh "createuser --createdb --login #{ROLE}|| echo role #{ROLE} already exists."
  end
end
