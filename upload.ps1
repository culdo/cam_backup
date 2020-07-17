$path = "d:/lab/ip_cam/videos/"

$upload_file = Get-ChildItem -Path $path -Name *.mp4 | where{$_.LastWriteTime -ge (Get-Date).AddDays(-1)}

D:\lab\tools\rclone-v1.51.0-windows-amd64\rclone.exe copy "$path$upload_file" gdrive:lab_cam
