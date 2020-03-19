#!/bin/tcsh
#포트포워딩 필수
#html5 video tag 사용시 http
#vlc 등 동영상 프로그램 tcp

set myip=192.168.0.10
set port=9060
set width=320
set height=240

gst-launch\
  v4l2src !\
  ffmpegcolorspace !\
  video/x-raw-yuv,width=${width},height=${height},framerate=\(fraction\)30/1 !\
  theoraenc !\ oggmux !\
  tcpserversink host=${myip} port=${port} sync=false
