&& ======================================================================== &&
&& Class FoxBin
&& ======================================================================== &&
Define Class FoxBin As Custom
	Dimension aTable(16)
	Hidden version
&& ======================================================================== &&
&& Function Init
&& ======================================================================== &&
	Function Init
		This.version = "2020.05.05"
		This.FillTable()
	EndFunc
&& ======================================================================== &&
&& Function Dec2Bin
&& ======================================================================== &&
	Function Dec2Bin(tnDec As Integer) As Integer
		Local lnQuotient As Integer, lnReminder As Integer, lcReminder As String
		lnQuotient 	= 0
		lnReminder	= 0
		lcReminder	= ""
		Do While .T.
			lnQuotient 	= Int(tnDec / 2)
			lnReminder 	= Mod(tnDec, 2)
			tnDec 		= lnQuotient
			lcReminder 	= lcReminder + Alltrim(Str(lnReminder))
			If lnQuotient = 0
				Exit
			Endif
		Enddo
		Return Alltrim(This.SortBinary(lcReminder))
	Endfunc
&& ======================================================================== &&
&& Function Dec2Hex
&& ======================================================================== &&
	Function Dec2Hex(tnDec As Integer) As Variant
		Return Transform(tnDec, "@0x")
	Endfunc
&& ======================================================================== &&
&& Function Hex2Bin
&& ======================================================================== &&
	Function Hex2Bin(tnHex As Integer) As Variant
		Return This.Dec2Bin(Evaluate(Alltrim(Transform(tnHex))))
	Endfunc
&& ======================================================================== &&
&& Function Hex2Dec
&& ======================================================================== &&
	Function Hex2Dec(tnHex As String) As Variant
		Return Evaluate(Alltrim(Transform(tnHex)))
	Endfunc
&& ======================================================================== &&
&& Function Bin2Dec
&& ======================================================================== &&
	Function Bin2Dec(tcBin As String) As Integer
		Return This.Hex2Dec(This.Bin2Hex(tcBin))
	EndFunc
&& ======================================================================== &&
&& Function Bin2Hex
&& ======================================================================== &&
	Function Bin2Hex(tcBin As String) As Integer
		lcNibble = This.SetNibble(Strtran(tcBin, Space(1)))
		lcChunk  = ""
		For i = 1 To Getwordcount(lcNibble, Space(1))
			Try
				nDec 	= Ascan(This.aTable, Getwordnum(lcNibble, i, Space(1))) - 1
				lcChunk = lcChunk + This.FromAToF(nDec)
			Catch
			EndTry
		EndFor
		lcChunk = "0x" + lcChunk
		Return lcChunk
	EndFunc
&& ======================================================================== &&
&& Protected Function SortBinary
&& ======================================================================== &&
	Protected Function SortBinary(tcBinData As String) As String
		Local lcBinary As String
		lcBinary = ""
		For i = Len(tcBinData) To 1 Step -1
			lcBinary = lcBinary + Substr(tcBinData, i, 1)
		Endfor
		Return This.SetNibble(lcBinary)
	Endfunc
&& ======================================================================== &&
&& Protected Function SetNibble
&& ======================================================================== &&
	Protected Function SetNibble(tcBin As String)
		Local lcNibble As String, lcResult As String
		lcNibble = ""
		lcResult = ""
		Do While Len(tcBin) > 0
			lcNibble = This.GetNibble(@tcBin)
			If Len(lcNibble) < 4
				lcNibble = Padl(lcNibble, 4, "0")
			Endif
			lcResult = lcNibble + Space(1) + lcResult
		Enddo
		Return lcResult
	Endfunc
&& ======================================================================== &&
&& Protected GetNibble
&& ======================================================================== &&
	Protected Function GetNibble(tcBinary As String)
		Local lcRes As String
		lcRes = ""
		For j=Len(tcBinary) To 1 Step -1
			lcRes 	 = Substr(tcBinary, j, 1) + lcRes
			tcBinary = Substr(tcBinary, 1, j-1)
			Do Case
			Case Len(lcRes) = 4 And Len(tcBinary) > 0
				Return lcRes
			Case Len(lcRes) < 4 And Empty(Len(tcBinary))
				Return lcRes
			Case Len(lcRes) = 4 And Empty(Len(tcBinary))
				Return lcRes
			Endcase
		Endfor
	Endfunc
&& ======================================================================== &&
&& Protected Function FillTable
&& ======================================================================== &&
	Protected Function FillTable As Void
		With This
			.aTable[1]  = "0000"
			.aTable[2]  = "0001"
			.aTable[3]  = "0010"
			.aTable[4]  = "0011"
			.aTable[5]  = "0100"
			.aTable[6]  = "0101"
			.aTable[7]  = "0110"
			.aTable[8]  = "0111"
			.aTable[9]  = "1000"
			.aTable[10] = "1001"
			.aTable[11] = "1010"
			.aTable[12] = "1011"
			.aTable[13] = "1100"
			.aTable[14] = "1101"
			.aTable[15] = "1110"
			.aTable[16] = "1111"
		Endwith
	Endfunc
&& ======================================================================== &&
&& Protected Function FromAToF
&& ======================================================================== &&
	Protected Function FromAToF(tnDecimal) As String
		Local lcResult As String
		lcResult = ""
		If tnDecimal >= 10
			Do Case
			Case tnDecimal = 10
				lcResult = "A"
			Case tnDecimal = 11
				lcResult = "B"
			Case tnDecimal = 12
				lcResult = "C"
			Case tnDecimal = 13
				lcResult = "D"
			Case tnDecimal = 14
				lcResult = "E"
			Case tnDecimal = 15
				lcResult = "F"
			Endcase
		Else
			lcResult = Alltrim(Str(tnDecimal))
		Endif
		Return lcResult
	EndFunc
&& ======================================================================== &&
&& GetVersion
&& ======================================================================== &&
	Function GetVersion
		Return This.Version
	EndFunc
Enddefine