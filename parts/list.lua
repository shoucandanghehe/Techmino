local sin,cos=math.sin,math.cos
snapLevelValue={1,10,20,40,60,80}
title={
	{
		53,		60,
		1035,	0,
		964,	218,
		660,	218,
		391,	1300,
		231,	1154,
		415,	218,
		0,		218,
	},
	{
		716,	290,
		1429,	290,
		1312,	462,
		875,	489,
		821,	695,
		1148,	712,
		1017,	902,
		761,	924,
		707,	1127,
		1106,	1101,
		1198,	1300,
		465,	1300,
	},
	{
		1516,	287,
		2102,	290,
		2036,	464,
		1598,	465,
		1322,	905,
		1395,	1102,
		1819,	1064,
		1743,	1280,
		1286,	1310,
		1106,	902,
	},
	{
		2179,	290,
		2411,	290,
		2272,	688,
		2674,	666,
		2801,	290,
		3041,	290,
		2693,	1280,
		2464,	1280,
		2601,	879,
		2199,	897,
		2056,	1280,
		1828,	1280,
	},
	{
		3123,	290,
		3480,	290,
		3496,	480,
		3664,	290,
		4017,	294,
		3682,	1270,
		3453,	1280,
		3697,	578,
		3458,	843,
		3304,	842,
		3251,	561,
		3001,	1280,
		2779,	1280,
	},
	{
		4088,	290,
		4677,	290,
		4599,	501,
		4426,	502,
		4219,	1069,
		4388,	1070,
		4317,	1280,
		3753,	1280,
		3822,	1068,
		3978,	1068,
		4194,	504,
		4016,	504,
	},
	{
		4747,	290,
		4978,	295,
		4921,	464,
		5186,	850,
		5366,	290,
		5599,	295,
		5288,	1280,
		5051,	1280,
		5106,	1102,
		4836,	709,
		4641,	1280,
		4406,	1280,
	},
	{
		5814,	290,
		6370,	295,
		6471,	415,
		6238,	1156,
		6058,	1280,
		5507,	1280,
		5404,	1154,
		5635,	416,
	-- 	-- 5814,	290,
	-- 	-- 5878,	463,
		5770,	542,
		5617,	1030,
		5676,	1105,
		5995,	1106,
		6100,	1029,
		6255,	541,
		6199,	465,
		5878,	463,
	},
}
for _,C in next,title do
	for i=1,#C do
		C[i]=C[i]*.1626
	end
end
--[[
title2={}
for i=1,#title do title2[i]=title[i]end
title2[5]={
	3123,	290,
	3480,	290,
	3496,	480,
	3664,	290,
	4017,	294,
	3682,	1270,

	3652,	1270,
	3678,	1240,
	3682,	1230,
	3648,	1230,
	3644,	1240,
	3665,	1240,
	3631,	1280,

	3453,	1280,
	3697,	578,
	3458,	843,
	3304,	842,
	3251,	561,
	3001,	1280,
	2779,	1280,
}
]]
title_fan={}
for i=1,8 do
	local L={}
	title_fan[i]=L
		for j=1,#title[i]do
		L[j]=title[i][j]
	end
	for j=1,#L,2 do
		local x,y=L[j],L[j+1]--0<x<3041, 290<y<1280
		x,y=-(x+240+y*.3)*.002,(y-580)*.9
		x,y=y*cos(x),-y*sin(x)--Rec-Pol-Rec
		L[j],L[j+1]=x,y+300
	end
end

customID={
	"drop","lock",
	"wait","fall",
	"next","hold",
	"sequence","visible",
	"target",
	"freshLimit",
	"opponent",
	"bg","bgm",
}
customRange={
	drop={1e99,180,60,40,30,25,20,18,16,14,12,10,9,8,7,6,5,4,3,2,1,.5,.25,.125,0},
	lock={0,1,2,3,4,5,6,7,8,9,10,12,14,16,18,20,25,30,40,60,180,1e99},
	wait={0,1,2,3,4,5,6,7,8,10,15,20,30,60},
	fall={0,1,2,3,4,5,6,7,8,10,15,20,30,60},
	next={0,1,2,3,4,5,6},
	hold={true,false,true},
	sequence={"bag","his4","rnd","loop","fixed"},
	visible={"show","time","fast","none"},
	target={10,20,40,100,200,500,1000,1e99},
	freshLimit={0,8,15,1e99},
	opponent={0,1,2,3,4,5,11,12,13,14,15,16},
	bg={"none","bg1","bg2","rainbow","aura","rgb","glow","matrix"},
	bgm={"blank","way","race","newera","push","reason","infinite","secret7th","secret8th","rockblock"},
}
local function T(s,t)return love.graphics.newText(setFont(s),t)end
drawableText={
	question=T(100,"?"),
	bpm=T(15,"BPM"),kpm=T(15,"KPM"),
	speedLV=T(20,"speed level"),
	atk=T(20,"Attack"),
	eff=T(20,"Efficiency"),
	tsd=T(35,"TSD"),
	line=T(25,"Lines"),
	techrash=T(25,"Techrash"),
	grade=T(25,"Grade"),
	wave=T(30,"Wave"),
	rpm=T(35,"RPM"),
	nextWave=T(30,"Next"),
	combo=T(20,"Combo"),
	mxcmb=T(20,"Max Combo"),
	pc=T(20,"Perfect Clear"),
	ko=T(25,"KO"),
	D=T(100,"D"),C=T(100,"C"),B=T(100,"B"),A=T(100,"A"),S=T(100,"S"),


	modeName=T(30),levelName=T(30),


	anykey=T(40),
	replaying=T(20),
	next=T(40),hold=T(40),
	win=T(120),finish=T(120),
	gameover=T(100),pause=T(120),

	custom=T(80),sequence=T(80),
	setting_game=T(80),setting_video=T(80),setting_sound=T(80),
	setting_control=T(70),setting_skin=T(70),
	preview=T(40),
	keyboard=T(25),joystick=T(25),
	ctrlSetHelp=T(30),
	musicRoom=T(80),nowPlaying=T(50),
	VKTchW=T(30),VKOrgW=T(30),VKCurW=T(30),
	noScore=T(45),highScore=T(30),
}