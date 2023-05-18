REM Start qemu on windows.
@ECHO OFF

START qemu\qemu.exe -L qemu/ -no-kqemu -m 128 -localtime -soundhw es1370 -kernel linux24 -initrd minirt24.gz -hda KNOPPIX/knoppix -append "qemu vga=791 quiet noscsi nousb nofirewire atapicd noideraid noacpi acpi=off noapm noagp ide1=noprobe ide2=noprobe nomce frugal" 

CLS
EXIT


