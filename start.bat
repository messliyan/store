@echo off
cd store-admin-ui
@echo off
start npm run dev
start /min /w mshta vbscript:setTimeout("window.close()",5000)
cd ..
start /min /w mshta vbscript:setTimeout("window.close()",5000)
cd vue-store-master
start npm run dev
cd ..
cd bin
redis-server
cd ..
