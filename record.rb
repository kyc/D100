require 'rubygems'
require 'rufus/scheduler'

AUDIO_SOURCE = 'http://66.55.135.147:8000/Channel1'
FFMPEG_PATH  = '/usr/local/bin/ffmpeg'

def gen_cmd(time,name)
  timestamp   =  Time.now.strftime("%Y%m%d-%S")
  record_name = "#{timestamp}/#{name}-#{timestamp}.mp3"
  record_time =   (3600 * time) + 1 
  "/bin/mkdir -p #{timestamp};#{FFMPEG_PATH} -i #{AUDIO_SOURCE} -acodec copy -t #{record_time} '#{record_name}'"
end

scheduler = Rufus::Scheduler.start_new



scheduler.cron '*/3 17 * * 1-5' do
  puts gen_cmd(2.5,'teacup')
end


# 风波里的茶杯
scheduler.cron '30 7 * * 1-5' do
  system(gen_cmd(2.5,'teacup'))
end

# 开心快活人
scheduler.cron '0 10 * * 1-5' do
  system(gen_cmd(3,'happy'))
end

#事有QK
scheduler.cron '0 13 * * 1-5' do
  system(gen_cmd(2,'QK'))
end

#为食show
scheduler.cron '0 15 * * 1-5' do
  system(gen_cmd(1.5,'show'))
end

#世界公民
scheduler.cron '30 16 * * 1-5' do
  system(gen_cmd(1.5,'world'))
end


#十级自由风
scheduler.cron '0 18 * * 1-5' do
  system(gen_cmd(2,'free'))
end


#音乐节目
scheduler.cron '0 20 * * 1-5' do
  system(gen_cmd(2,'music'))
end

#霎时冲动
scheduler.cron '0 22 * * 1-5' do
  system(gen_cmd(2,'impulse'))
end

scheduler.join 
