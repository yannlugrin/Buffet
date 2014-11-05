
local myname, ns = ...


ns.itemdb, ns.bests, ns.allitems = {}, {}, {}


local function ProcessLine(t, value, id, ...)
	if id then
		t[tonumber(id)] = tonumber(value) or 0
		ns.allitems[tonumber(id)] = tonumber(value) or 0
		return ProcessLine(t, value, ...)
	end
end

local function ProcessData(...)
	local t = {}
	for i=1,select("#", ...) do
		local line = select(i, ...)
		if line and line ~= "" then
			ProcessLine(t, string.split(" ", line))
		end
	end
	return t
end

local function DB(name, raw)
	ns.bests[name] = {}
	ns.itemdb[name] = ProcessData(string.split("\n", raw))
end


DB("bandage", [[
66 1251
114 2581
161 3530
301 3531
400 6450
640 6451
800 8544
1104 8545
1360 14529
2000 14530
2800 21990
3400 21991
4800 34721
5800 34722
4100 38640
17400 53049
26000 53050
35000 53051
55000 72985
125000 72986
]])

DB("hppot", [[
80 118
160 4596 858
320 929
400 737
520 1710
670 11562
800 18839 3928
1400 13446 28100 31838 31839 31852 31853
1920 43569
2000 22829 23822 32947 33092 33934 39327 39327 39671 43531
2200 34440
3300 40077
3600 33447 41166
8000 57193
10000 57191 63300
120000 76094 76097 80040 88416 89640
]])

DB("mppot", [[
160 2455
320 3385
400 737
500 43570
520 3827
800 6149
1050 40067
1200 13443 18841
1800 13444 28101 31840 31841 31854 31855
2200 34440
2400 22832 23823 32948 33093 33935 43530
3200 31677
4300 33448 40077 42545
8000 57193
10000 57192
30000 76094 76098 89641
]])

DB("water", [[
60 1401
151 159 60269
294 2682 3448
315 21071
436 1179 17404 49365 49601 63530 90659
835 1205 19299 90660 9451
882 21153
1344 10841 1708 17405 4791 61382
1992 1645 19300 63023
2934 23161 23585 24006 38429 8766
4200 18300 24007 32455
4410 13724 19301 20031
5100 28399 29454 32722 38430
7200 27860 29395 29401 30457 32453 32668 33042 33053 34780 35954 37253 38431 40357 44750
9180 33444 38698 43086
12960 33445 34759 34760 34761 39520 41731 42777 43236
15000 45932
19200 56164 58274 59229
45000 58256 59029 59230
72000 63122
96000 58257 62672 62675 63251 68140
100000 75026 75037 81924 85501 86026
150000 75038
200000 74636 81923 88532 88578
]])

DB("food", [[
30 11109 6299
50 19696 19994 19995 19996 21235
61 117 16166 17344 19223 2070 20857 23495 2679 2681 30816 4536 4540 4604 4656 5057 60267 60268 60375 60377 60378 60379 6290 7097 787 961 9681
155 21071
243 12238 1326 16167 17119 17406 18633 19304 2287 24072 27230 414 4537 4541 4592 4605 49600 5066 5095 62909 6316 6316 67230 6890
294 2682 2682 3448 3448 5473
552 16170 19305 2685 3770 422 4538 4542 4593 4606 5478 5526 57518 62910 63692 63693 65730 65731 7228 733
567 21153
874 13755 16169 1707 17407 17407 18632 19224 3771 4539 4544 4594 4607 61383 63692 6807 8364
1392 13546 13893 13930 16168 16766 17408 18255 18635 19306 21030 21552 3927 4599 4601 4602 4608 63691 6887 9681
2148 11415 11444 13724 13933 13933 13935 16171 19225 21031 21033 22324 23160 24338 41751 67270 67271 67272 67273 8932 8948 8950 8952 8953 8957
2550 20031
4320 24408 27661 27854 27855 27856 27857 27858 27859 28486 29393 29412 30458 30610 32722 38427
4410 19301
7500 29394 29448 29449 29450 29451 29452 29453 30355 32685 32686 33048 33053 34780 38428
13200 33443 33449 33451 33452 33454 35949 37252 40356 40358 40359 42428 42430 42432 42433 44608 44609 44749
15000 34747 34759 34760 34761 35947 35948 35950 35951 35952 35953 38706 40202 41729 42429 42431 42434 42778 43087 44049 44071 44072 44607 44722
18000 45932
22500 56165 58275 58276 58277 58278 58279 58280 59227 59231 74609
67500 58226 58258 58260 58262 58264 58266 58268 59228 59232 62676
96000 58259 58261 58263 58265 58267 58269 62677 63122
100000 75026 81175 81889 81917 81919 81922 82448 82450 83097 85504 86026 86057
200000 74641 81916 81918 81920 81921 82449 82451 86508 88398 90135
300000 75038
]])

DB("percfood", [[
50 19696 19994 19995 19996 21235
75 20388 20389 20390
100 21215 21537
999 65500 65515 65516 65517 43518 43523 65499 80610
]])

DB("percwater", [[
60 19997 21241
75 20388 20389 20390 21537
100 21215
999 65500 65515 65516 65517 43518 43523 65499 80610
]])
