## Overview

Boeing has some big problems at fundamental levels, and it's been known to be bad for a long time.

I started growing concerned. I don't really want to fly on Boeing 737-anything. 

How much of the modern flying airliner fleet is built by Boeing? 

What percentage of modern commercial airtravel is on a plane manufactured by Boeing?

Oh, and I want to learn some D3, and this seems like a good way to go.

## Inspiration

- [People & Power - On a wing and a prayer (youtube documentary)](https://www.youtube.com/watch?v=IaWdEtANi-0)
- [Boeing 737 Next Generation (subject of documentary)](https://en.wikipedia.org/wiki/Boeing_737_Next_Generation)

This will be a sinatra app that takes some data, serves it to a page running D3, and applies a tutorial's worth of effort to "doing something" with that data. I'm more-or-less "live-streaming" this process, so someone else can follow my steps.

## Scraping Data

###  U.S. Fleet 2019 | By (Model|Manufacturer)

http://www.fi-aeroweb.com/US-Commercial-Aircraft-Fleet.html

### Associated documentation

- [Boeing 737 Next Generation (subject of documentary)](https://en.wikipedia.org/wiki/Boeing_737_Next_Generation)


--------------------

I'm first going to gather the raw data that I'll use later to visualize stuff. 

I'd like to store some data as a CSV, read it in as an `OpenStruct` (for practice?) and then return some of that data in a structured, JSON-happy way that I can consume with D3 visualizations.



# Step 1: Get some data

I want to gather the data from:

[http://www.fi-aeroweb.com/US-Commercial-Aircraft-Fleet.html](http://www.fi-aeroweb.com/US-Commercial-Aircraft-Fleet.html)

Maybe I can copy-paste?

Bleh. The data looks hard to get at with Nokogiri, too.

OK, I'm going to save this as a text file, write a little script to convert it into some legible format that can then be read into an app.

```
# 	

Manufacturer 	

Aircraft Model 	

2019 	

2018 	

CHANGE	

ALL
Boeing
Boeing
Airbus
Airbus
Boeing
Bombardier
Embraer
Airbus
Boeing
Bombardier
Cessna
Embraer
Bombardier
Boeing
Boeing
Airbus
Boeing
Boeing
McDonnell Douglas
Embraer
Embraer
Boeing
Boeing
McDonnell Douglas
Boeing
Airbus
McDonnell Douglas
Boeing
Airbus
Airbus
Boeing
McDonnell Douglas
Embraer
Airbus
Boeing
Boeing
Boeing
Bombardier
Boeing
Boeing
Airbus
Boeing
ATR
Boeing
Boeing
ATR
Boeing
McDonnell Douglas
Bombardier
Lockheed
Boeing
McDonnell Douglas
Airbus
Boeing
Bombardier
Boeing
Douglas
Boeing
Boeing
McDonnell Douglas
McDonnell Douglas
Gulfstream
Boeing
Boeing
Gulfstream
Convair
Gulfstream
Convair
Boeing
Gulfstream
Gulfstream
Dassault
Dassault
Airbus
Cessna
Boeing
CASA
Dassault
Cessna
Embraer
McDonnell Douglas
Hawker
Embraer
Curtiss
Pilatus
Airbus
Gulfstream
Dassault
Cessna
Hawker
Cessna
Gulfstream
Gulfstream
Bombardier
Bombardier
Bombardier
Hawker
Piper
Saab

ALL
737-800
737-700
A320
A321
757-200
CRJ200
E175
A319
737-900ER
CRJ900
C208B
E170
CRJ700
767-300ER
767-300F
A300-600
777-200ER
717-200
MD-11F
ERJ-145
E190
747-400F
737 MAX 8
MD-90-30
777F
A330-200
MD-88
787-9
A320neo
A321neo
767-300
MD-83
ERJ-140
A330-300
777-300ER
757-300
767-400ER
DHC-8-400
767-200
787-8
A220-100
747-400
ATR 42
737-900
747-8F
ATR 72
777-200
DC-10-10F
Global Express
L-382G
737-400
DC-10-30F
A350-900
737 MAX 9
Challenger 300
727-200
DC-6
777-200LR
787-10
DC-9-15F
DC-9-30F
G650/G650ER
737-300
737-200
GIV
CV-580
G550
CV-5800
767-200ER
G200
GV
Falcon 2000
Falcon 900
A330-900
750 Citation X
737-500
CN235
Falcon 20
560XL Citation Excel
ERJ-135
MD-82
800XP
EMB 120
C-46
PC-12
A310
G450
Falcon 7X
210
4,000
525A CitationJet
G150
G-II
Learjet 45
Challenger 604
Learjet 60
850XP
PA-32
SF-340A

7,381
826
579
559
424
398
362
354
347
345
296
238
233
197
158
155
120
113
111
108
92
80
64
58
53
52
49
47
47
47
45
42
42
40
40
40
37
37
36
35
32
28
27
25
24
24
21
19
14
14
14
13
13
13
13
12
11
11
10
10
9
8
8
7
6
6
6
6
6
5
5
4
4
4
4
3
3
3
3
3
3
2
2
2
2
2
1
1
1
1
1
1
1
1
1
1
1
0
0
0

7,356
827
586
521
398
397
386
311
346
323
275
240
215
273
131
129
120
113
111
108
160
80
56
50
65
42
49
84
45
40
19
44
43
59
40
38
37
37
44
25
32
4
25
25
24
19
21
19
22
21
14
32
13
11
10
19
12
12
10
3
9
8
8
9
9
8
7
7
5
5
1
6
4
2
0
4
3
3
3
2
1
4
3
3
2
1
10
3
2
1
1
1
1
1
1
0
0
1
1
1 
```