# -*- coding:utf-8 -*-
#10분마다 온도 센서 값을 받아와 db에 저장
#run_check_t.py
import os
import glob
import time
import datetime
import MySQLdb

os.system('modprobe w1-gpio')
os.system('modprobe w1-therm')

base_dir = '/sys/bus/w1/devices/'
device_folder = glob.glob(base_dir + '28*')[0]
device_file = device_folder + '/w1_slave'

def read_temp_raw():
    f = open(device_file, 'r')
    lines = f.readlines()
    f.close()
    return lines
 
def read_temp():
    lines = read_temp_raw()
    while lines[0].strip()[-3:] != 'YES':
        time.sleep(0.2)
        lines = read_temp_raw()
    equals_pos = lines[1].find('t=')
    if equals_pos != -1:
        temp_string = lines[1][equals_pos+2:]
        temp_c = float(temp_string) / 1000.0 #섭씨
        temp_f = temp_c * 9.0 / 5.0 + 32.0 #화씨
        #return temp_c, temp_f # 섭씨, 화씨 값 반환
        return temp_c
	
while True:
	#print(read_temp())	#온도 값 출력
	temp = read_temp()
	print temp
	#오늘 날짜 
	today = datetime.datetime.now()
	print today
	
	conn = MySQLdb.connect(host="tix.mooo.com", user="pi", passwd="0987", db = "aquadb")
	cursor = conn.cursor() #쿼리를 날리기 위해 커서를 지정
	cursor.execute("insert into gahui_t(temperature, time) value('%s', '%s')" % (temp, today))
	conn.commit()
	
	print "save complete."

	time.sleep(600) #10분마다 온도 데이터 기록
	
	cursor.close ()
	conn.close ()
	
def read_temp_raw():
	catdata = subprocess.Popen(['cat',device_file], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
	out,err = catdata.communicate()
	out_decode = out.decode('utf-8')
	lines = out_decode.split('\n')
	return lines
