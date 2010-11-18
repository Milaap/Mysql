namespace :user do
  task :details => :environment do
    @users = User.all(:conditions => {:confirmed_at => { '$gt' => (Time.now - 60 * 60 * 24 * 15), '$lt' => Time.now}})
    MilaapMailer.send_info(@users).deliver
  end
end

