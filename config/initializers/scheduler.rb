require 'rufus-scheduler'

# Let's use the rufus-scheduler singleton
#
s = Rufus::Scheduler.singleton


# Stupid recurrent task...
#
s.every '300s' do
  Testimony.update_rank
  puts "Twitter Checado"
end