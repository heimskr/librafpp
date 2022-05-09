prefix=PREFIX
libdir=${prefix}/lib
includedir=${prefix}/include

Name: libraf
Description: Library to print Raf
URL: https://github.com/heimskr/librafpp
Version: 1.1.0
Libs: -L${libdir} -lrafpp
Cflags: -I${includedir}
