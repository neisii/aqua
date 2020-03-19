# -*- coding:utf-8 -*-
#run_check_f.py
import time
import datetime
import MySQLdb
import RPi.GPIO as GPIO
from time import localtime, strftime

p1 = 18 #조명
p2 = 23 #히터
p3 = 24 #쿨러

GPIO.setmode(GPIO.BCM)
GPIO.setup(p1, GPIO.OUT)
GPIO.setup(p2, GPIO.OUT)
GPIO.setup(p3, GPIO.OUT)

###################### 무한 반복 #######################
while True:
	####### DB 세팅 #######
	conn = MySQLdb.connect(host="tix.mooo.com", user="pi", passwd="0987", db = "aquadb")
	cursor = conn.cursor() #쿼리를 날리기 위해 커서를 지정

	########### 조명 제어 ############
	####### 조명 옵션 구하기 #######
	cursor.execute("select ck1 from gahui_c") #조명 옵션을 체크한다.
	ck1 = cursor.fetchone()
	ck11 = list(ck1)
	op1 = ck11[0]
	
	if(op1 == "yes"):
		print "LIGHT OPTION yes"
		####### 현재 시 분 구하기 #######
		now = strftime("%H:%M:%S", localtime())
		n2 = now[0:2] #12:20:13
		n3 = now[3:5]
		n4 = now[6:8]
		n5 = n2+n3+n4
		
		####### 조명 타이머 제어 #######
		cursor.execute("select cltimes from gahui_c") #타이머 시작 시간을 가져온다.
		cltimes = cursor.fetchone()
		li_times = list(cltimes)
		s1 = li_times[0]
		s2 = s1[0:2]
		s3 = s1[3:5]
		s4 = s1[6:8]
		s5 = s2+s3+s4
		
		cursor.execute("select cltimee from gahui_c") #타이머 종료 시간을 가져온다.
		cltimee = cursor.fetchone()
		li_timee = list(cltimee)
		e1 = li_timee[0]
		e2 = e1[0:2]
		e3 = e1[3:5]
		e4 = e1[6:8]
		e5 = e2+e3+e4
		
		print "NOW", now,"START", s1,"END", e1
		
		#time 00~24
		#cmp(x,y) x가 크면 1, y가 크면 -1
		re1 = cmp(s5, e5) #시작, 종료 비교
		re2 = cmp(n5, s5) #현재, 시작
		re3 = cmp(n5, e5) #현재, 종료
		
		if(re1 ==1):
			print "START > END"
			if((re2 == -1 and re3 == -1) or (re2 == 1 and re3 == -1)):
				cursor.execute("update gahui_c set chlight='on'")
				conn.commit()
				GPIO.output(p1, True)
				print "1. LIGHT on"
			else:
				cursor.execute("update gahui_c set chlight='off'")
				conn.commit()
				GPIO.output(p1, False)
				print "1. LIGHT off"
		else:
			print "START < END"
			if((re2 == 1 and re3 == -1)):
				cursor.execute("update gahui_c set chlight='on'")
				conn.commit()
				GPIO.output(p1, True)
				print "2. LIGHT on"
			else:
				cursor.execute("update gahui_c set chlight='off'")
				conn.commit()
				GPIO.output(p1, False)
				print "2. LIGHT off"
	#	break
	else: #조명 타이머가 yes가 아니라도
		print "LIGHT OPTION no"
		cursor.execute("select chlight from gahui_c")
		chlight = cursor.fetchone()
		light = list(chlight)
		if(light[0] == "on"): #조명이 on이면 조명을 켠다.
			GPIO.output(p1, True)
		else:
			GPIO.output(p1, False)


	########### 히터 쿨러 제어 ############
	####### 히터 쿨러 옵션 구하기 #######
	cursor.execute("select ck2 from gahui_c") #히터 쿨러 옵션을 체크한다.
	chheatcool = cursor.fetchone()
	l2 = list(chheatcool)
	op2 = l2[0]
	
	if(op2 == "yes"):
		print "HEATER COOLER OPTION yes"
		####### 히터 및 쿨러 자동 제어 #######
		cursor.execute("select temperature from gahui_t order by time desc limit 1") #최근 온도 데이터 1개만 가져온다.
		temp = cursor.fetchone()
		li_temp = list(temp)
	#	temp = float(li_temp[0]) #문자열을 실수형으로 변환
		temp = li_temp[0]
			
		cursor.execute("select chtemp from gahui_c") #히터 작동 온도
		op1 = cursor.fetchone()
		li_op1 = list(op1)

		cursor.execute("select cctemp from gahui_c") #쿨러 작동 온도
		op2 = cursor.fetchone()
		li_op2 = list(op2)
		
		heat = li_op1[0] #히터 작동 온도
		cool = li_op2[0] #쿨러 작동 온도
		
		print "NOW temp", temp, "HEATER temp", heat, "COOLER temp", cool

		if(temp < heat):
				print "HEATER on"
				cursor.execute("update gahui_c set chheat='on', chcool='off'")
				conn.commit()
				GPIO.output(p2, True)
				GPIO.output(p3, False)
		elif(temp > cool):
				print "COOLER on"
				cursor.execute("update gahui_c set chheat='off', chcool='on'")
				conn.commit()
				GPIO.output(p2, False)
				GPIO.output(p3, True)
		elif ((temp < cool) and (temp > heat)):
				print "HEATER COOLER off"
				cursor.execute("update gahui_c set chheat='off', chcool='off'")
				conn.commit()
				GPIO.output(p2, False)
				GPIO.output(p3, False)

	else: #옵션이 yes가 아니라도
		print "HEATER COOLER OPTION no"
		cursor.execute("select chheat from gahui_c")
		oh = cursor.fetchone()
		heat = list(oh)
		
		cursor.execute("select chcool from gahui_c")
		oc = cursor.fetchone()
		cool = list(oc)
		
		if(heat[0] == "on"): #히터가 on이면 히터를 켠다.
			GPIO.output(p2, True)
		elif(heat[0] == "off"):
			GPIO.output(p2, False)
		if(cool[0] == "on"): #쿨러가 on이면 쿨러를 켠다.
			GPIO.output(p3, True)
		elif(cool[0] == "off"):
			GPIO.output(p3, False)

	time.sleep(1) #1초마다 제어 정보 조회
	
	cursor.close ()
	conn.close ()
	
