
�
��
	FullAdder
clock" 
reset

io_a

io_b

io_cin

io_sum

io_cout
?2#
a_xor_bR

io_a

io_b�FullAdder.scala 16:22?2#
_TR
	
a_xor_b


io_cin�FullAdder.scala 17:21?2#
a_and_bR

io_a

io_b�FullAdder.scala 19:22C2'
	b_and_cinR

io_b


io_cin�FullAdder.scala 20:24C2'
	a_and_cinR

io_a


io_cin�FullAdder.scala 21:24D2(
_T_1 R
	
a_and_b

	b_and_cin�FullAdder.scala 22:22A2%
_T_2R

_T_1

	a_and_cin�FullAdder.scala 22:340z



io_sum

_T�FullAdder.scala 17:103z

	
io_cout

_T_2�FullAdder.scala 22:11
��
Adder4
clock" 
reset

io_A

io_B

io_Cin

io_Sum

io_Cout
,*
Adder0	FullAdder�Adder4.scala 17:22,*
Adder1	FullAdder�Adder4.scala 23:22,*
Adder2	FullAdder�Adder4.scala 29:22,*
Adder3	FullAdder�Adder4.scala 35:2272
_TR

io_A
0
0�Adder4.scala 18:2292 
_T_1R

io_B
0
0�Adder4.scala 19:2292 
_T_2R

io_A
1
1�Adder4.scala 24:2292 
_T_3R

io_B
1
1�Adder4.scala 25:22P2:
s14R2:



Adder1io_sum:



Adder0io_sum�Cat.scala 29:5892 
_T_4R

io_A
2
2�Adder4.scala 30:2292 
_T_5R

io_B
2
2�Adder4.scala 31:22@2*
s2$R":



Adder2io_sum

s1�Cat.scala 29:5892 
_T_6R

io_A
3
3�Adder4.scala 36:2292 
_T_7R

io_B
3
3�Adder4.scala 37:22B2,
_T_8$R":



Adder3io_sum

s2�Cat.scala 29:58/z



io_Sum

_T_8�Adder4.scala 39:10?z&

	
io_Cout:



Adder3io_cout�Adder4.scala 40:11)z"
:



Adder0clock	

clock�
 )z"
:



Adder0reset	

reset�
 7z
:



Adder0io_a

_T�Adder4.scala 18:159z 
:



Adder0io_b

_T_1�Adder4.scala 19:15=z$
:



Adder0io_cin


io_Cin�Adder4.scala 20:17)z"
:



Adder1clock	

clock�
 )z"
:



Adder1reset	

reset�
 9z 
:



Adder1io_a

_T_2�Adder4.scala 24:159z 
:



Adder1io_b

_T_3�Adder4.scala 25:15Jz1
:



Adder1io_cin:



Adder0io_cout�Adder4.scala 26:17)z"
:



Adder2clock	

clock�
 )z"
:



Adder2reset	

reset�
 9z 
:



Adder2io_a

_T_4�Adder4.scala 30:159z 
:



Adder2io_b

_T_5�Adder4.scala 31:15Jz1
:



Adder2io_cin:



Adder1io_cout�Adder4.scala 32:17)z"
:



Adder3clock	

clock�
 )z"
:



Adder3reset	

reset�
 9z 
:



Adder3io_a

_T_6�Adder4.scala 36:159z 
:



Adder3io_b

_T_7�Adder4.scala 37:15Jz1
:



Adder3io_cin:



Adder2io_cout�Adder4.scala 38:17
Adder4