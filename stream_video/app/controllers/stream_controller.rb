class StreamController < ApplicationController

	require 'streamio-ffmpeg'

	def convert_video 
		url_video = "http://192.168.0.101:8080/video"
		url_audio = "http://192.168.0.101:8080/audio.wav"

		# tmp directory
		path = Rails.root.join('tmp')
		# create sub-directory as md5 hash based on URL
		sub_dir = Digest::MD5.hexdigest(url_video)
		# append sub_dir on the path
		destination_path = path.join(sub_dir) 
		timeout_in_seconds = 1

		Thread.new do
			system("timeout -s KILL 30 wget --limit-rate=200000k -P #{destination_path} #{url_audio} ")
		end

		#system("timeout -s KILL 60 wget --limit-rate=20k -P #{destination_path} #{url} ")
		system("timeout -s KILL 30 wget --limit-rate=200000k -P #{destination_path} #{url_video} ")

		puts "\nDone Video Download"

		#system("ffmpeg -i #{destination_path}/video -vcodec h264 -acodec aac -strict -2 #{destination_path}/output.mp4")
		system("ffmpeg -i #{destination_path}/video -c:v libx264 -crf 23 -preset medium -c:a libfdk_aac -vbr 4 -movflags +faststart -vf scale=-2:720,format=yuv420p #{destination_path}/output2.mp4")
		system("ffmpeg -i #{destination_path}/output2.mp4 -vf setpts=3*PTS -an #{destination_path}/s2.mp4")

		puts "DONE"
		"""
		movie = FFMPEG::Movie.new(path_to_input_file)
     	options = '-threads 2 -s 320x240 -r 30.00 -threads 1 -pix_fmt yuv420p -g 300 -qmin 3 -b 512k -async 50 -acodec libmp3lame -ar 11025 -ac 1 -ab 16k'
     	movie.transcode('/output.flv', options)
     	"""
	end
end
