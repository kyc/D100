require 'rubygems'
require 'rufus/scheduler'

AUDIO_SOURCE = 'http://66.55.135.147:8000/Channel1'
FFMPEG_PATH  = '/usr/bin/ffmpeg'

def gen_cmd(time,name)
  timestamp   =  Time.now.strftime("%Y%m%d-%S")
  record_name = "#{timestamp}/#{name}-#{timestamp}.mp3"
  record_time =   (3600 * time) + 1 
  "/bin/mkdir -p #{timestamp};#{FFMPEG_PATH} -i #{AUDIO_SOURCE} -acodec copy -t #{record_time} '#{record_name}'"
end

scheduler = Rufus::Scheduler.start_new


# 风波里的茶杯
scheduler.cron '0 8 * * 1-5' do
  system(gen_cmd(2.5,'teacup'))
end

# 开心快活人
scheduler.cron '30 10 * * 1-5' do
  system(gen_cmd(2.5,'happy'))
end

#政本清源
scheduler.cron '0 13 * * 1-5' do
  system(gen_cmd(2,'zbqy'))
end

#焦点新闻
scheduler.cron '0 15 * * 1-5' do
  system(gen_cmd(1,'jiaodian'))
end

#为食show
scheduler.cron '00 16 * * 1-5' do
  system(gen_cmd(1.5,'show'))
end


#十级自由风
scheduler.cron '30 17 * * 1-5' do
  system(gen_cmd(2.5,'free'))
end


#怒汉系列
scheduler.cron '0 20 * * 1-5' do
  system(gen_cmd(2,'luhan'))
end

#人间锦言
scheduler.cron '0 22 * * 1-5' do
  system(gen_cmd(1,'renjian'))
end

#霎时冲动
scheduler.cron '0 23 * * 1-5' do
  system(gen_cmd(2,'impulse'))
end

#风波里的茶杯 周六
scheduler.cron '0 8 * * 6' do
  system(gen_cmd(2,'teacup'))
end

#龙凤大茶楼
scheduler.cron '0 10 * * 6' do
  system(gen_cmd(3,'lf'))
end

#琪文遁甲
scheduler.cron '0 13 * * 6' do
  system(gen_cmd(3,'fs'))
end

#音乐真情人
scheduler.cron '0 18 * * 6' do
  system(gen_cmd(3,'music'))
end

#好友感觉
scheduler.cron '0 21 * * 6' do
  system(gen_cmd(3,'friend'))
end

#sunday还可以
scheduler.cron '0 10 * * 7' do
  system(gen_cmd(3,'sunday'))
end

#对冲人生路
scheduler.cron '0 13 * * 7' do
  system(gen_cmd(2,'road'))
end

#女皇头
scheduler.cron '0 21 * * 7' do
  system(gen_cmd(3,'queen'))
end

scheduler.join 
