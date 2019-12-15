* located in ~/.local/share/OpenSCAD

Various elements for building OpenSCAD Models

Just use

```
include <any_element_of_libraries.scad>
```

# Models

## crosskill

## packomat

## Smaragd

Smaragd module is in two parts, `smaragd.scad` which original parts and `smaragd_assemblies.scad` which contains semi-finished products

Just include the assemblies module to design a smaragd:
```
$fn=200;
include <smaragd_assemblies.scad>

union() {
    _large_frame(0,0);
    _support_rouleaux_et_disques(70);
    _support_rouleaux_et_disques(-70);
    _large_barre_disque(70, -70);
    _rouleau_simple();
    _3points();
}
```