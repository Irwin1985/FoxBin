**********************************************************************
Define Class FoxBinTest As FxuTestCase Of FxuTestCase.prg
**********************************************************************

	#If .F.
		Local This As FoxBinTest Of FoxBinTest.prg
	#Endif

	icTestPrefix = "test"
	oFoxBin = .Null.
	cProcAct = ""
&& ======================================================================== &&
&& Function Setup
&& ======================================================================== &&
	Function Setup
		This.cProcAct = Set("Procedure")
		Set Procedure To "..\FoxBin" Additive
		This.oFoxBin = Createobject("FoxBin")
	Endfunc
&& ======================================================================== &&
&& Function TearDown
&& ======================================================================== &&
	Function TearDown
		This.oFoxBin = .Null.
		cProcAct = This.cProcAct
		Clear Class FoxBin
		Release Procedure FoxBin.prg
		Set Procedure To (cProcAct)
	Endfunc
&& ======================================================================== &&
&& Function TestObject
&& ======================================================================== &&
	Function TestObject
		If This.AssertNotNull(This.oFoxBin, "test failed")
			This.PrintOk("TestObject")
		Endif
	EndFunc
&& ======================================================================== &&
&& Function TestObject
&& ======================================================================== &&
	Function TestGetVersion
		This.Messageout("Version = " + This.oFoxBin.GetVersion())
		This.PrintOk("TestGetVersion")
	EndFunc
&& ======================================================================== &&
&& Function TestDec2Bin
&& ======================================================================== &&
	Function TestDec2Bin
		Local lc34Bin As String, ln34Dec as integer
		ln34Dec = 34
		lc34Bin = "0010 0010"
		If this.AssertEquals(This.oFoxBin.Dec2Bin(ln34Dec), lc34Bin, "test failed")
			this.PrintOk("TestDec2Bin")
		EndIf
	EndFunc
&& ======================================================================== &&
&& Function TestDec2Hex
&& ======================================================================== &&
	Function TestDec2Hex
		Local lc34Hex As String, ln34Dec as integer
		ln34Dec = 34
		lc34Hex = Transform(ln34Dec, "@0x")
		If this.AssertEquals(This.oFoxBin.Dec2Hex(ln34Dec), lc34Hex, "test failed")
			this.PrintOk("TestDec2Hex")
		EndIf
	EndFunc
&& ======================================================================== &&
&& Function TestHex2Bin
&& ======================================================================== &&
	Function TestHex2Bin
		Local lc34Bin As String, ln34Hex as integer
		ln34Hex = "0x22"
		lc34Bin = "0010 0010"
		If this.AssertEquals(This.oFoxBin.Hex2Bin(ln34Hex), lc34Bin, "test failed")
			this.PrintOk("TestHex2Bin")
		EndIf
	EndFunc
&& ======================================================================== &&
&& Function TestHex2Dec
&& ======================================================================== &&
	Function TestHex2Dec
		Local lc34Hex As String, ln34Dec as integer
		lc34Hex = "0x22"
		ln34Dec = 34
		If this.AssertEquals(This.oFoxBin.Hex2Dec(lc34Hex), ln34Dec, "test failed")
			this.PrintOk("TestHex2Dec")
		EndIf
	EndFunc
&& ======================================================================== &&
&& Function TestBin2Dec
&& ======================================================================== &&
	Function TestBin2Dec
		Local lc34Bin As String, ln34Dec as integer
		ln34Dec = 34
		lc34Bin = "0010 0010"
		If this.AssertEquals(This.oFoxBin.Bin2Dec(lc34Bin), ln34Dec, "test failed")
			this.PrintOk("TestBin2Dec")
		EndIf
	EndFunc
&& ======================================================================== &&
&& Function TestBin2Hex
&& ======================================================================== &&
	Function TestBin2Hex
		Local lc34Bin As String, lc34Hex as integer
		lc34Hex = "0x22"
		lc34Bin = "0010 0010"
		If this.AssertEquals(This.oFoxBin.Bin2Hex(lc34Bin), lc34Hex, "test failed")
			this.PrintOk("TestBin2Hex")
		EndIf
	EndFunc
&& ======================================================================== &&
&& Protected Function PrintOk
&& ======================================================================== &&
	Protected Function PrintOk(tcFuncName As String) As void
		This.Messageout(tcFuncName + "(Ok)")
	Endfunc
EndDefine