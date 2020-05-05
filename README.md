# FoxBin

`FoxBin` is a Visual FoxPro Class library that converts from/to Decimal, Hex and Binary.

## Installation
```
Just copy the FoxBin prg anywhere into your project PATH folder.
```
## Simple Test
```xBase
// declare the FoxBin Prg
Set Procedure to "FoxBin" Additive

// Instantiate FoxBin Object
=AddProperty(_vfp, "FoxBin", CreateObject("FoxBin"))
// The binary output is splitted into Nibbles
_vfp.FoxBin.Dec2Bin(1985) //‭0111 1100 0001‬
```
## Built-in Functions
```xBase
// Decimal to Binary
_vfp.FoxBin.Dec2Bin(1985) //‭0111 1100 0001‬
// Decimal to Hex
_vfp.FoxBin.Dec2Hex(1985) //‭0x000007C1
// Hex to Binary
_vfp.FoxBin.Hex2Bin("0x000007C1") //‭0111 1100 0001
// Hex to Decimal
_vfp.FoxBin.Hex2Dec("0x000007C1") //1985
// Binary to Decimal
_vfp.FoxBin.Bin2Dec("0111 1100 0001‬") //‭1985
// Binary to Hex
_vfp.FoxBin.Bin2Hex("0111 1100 0001"‬) //‭0x7C1
```

## License
FoxBin is released under the MIT Licence.
