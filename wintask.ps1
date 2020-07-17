$limit = 7
$path = "d:/lab/ip_cam/videos/"

gci $path| where{-not $_.PsIsContainer}| sort CreationTime -desc| select -Skip $limit| Remove-Item -Force

$StartDate=GET-DATE

$date=$StartDate.ToString("yyyy-MM-dd_HH-mm-ss")

$EndDate=(get-date -hour 23 -minute 59 -second 59)

$duration = ($EndDate-$StartDate).ToString("hh':'mm':'ss")
echo $duration > D:\lab\ip_cam\log.txt

d:/lab/tools/ffmpeg-4.2.2-win64-static/bin/ffmpeg.exe -i "rtsp://192.168.0.60:554/user=admin&password=&channel=1&stream=0.sdp?real_stream--rtp-caching=1" -t "$duration" -acodec aac -vcodec h264_qsv "$path$date.mp4" *>> D:\lab\ip_cam\log.txt