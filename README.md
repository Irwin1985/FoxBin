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
## License
FoxBin is released under the MIT Licence.
