set :output, "#{path}/log/cron_log.log"
every 1.day, :at => '00:00' do
    runner "UserMailer.remember_email.deliver"
end