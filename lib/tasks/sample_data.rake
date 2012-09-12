namespace :db do
  desc "Fill database with sample data"
  task :populate=> :environment do

    50.times do
      content = Faker::Lorem.sentence(5)
      Post.create!(:content=> content)
    end

  end
end
