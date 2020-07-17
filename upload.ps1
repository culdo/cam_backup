$path = "d:/lab/ip_cam/videos/"
cd $path

$upload_files = (Get-ChildItem *.mp4 | where {$_.LastWriteTime -ge (Get-Date).AddDays(-1)}).Name

foreach ($i in $upload_files) {
    #"$path$i"
    D:\lab\tools\rclone-v1.51.0-windows-amd64\rclone.exe copy "$path$i" gdrive:lab_cam -P
}
