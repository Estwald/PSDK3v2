PSDK3 v2
========

Basado en el trabajo de Estwald, Marioga y otros sceners y en librerías como PSL1GHT, Tiny3D y PS3 Soundlib, PSDK3 pretende ser un entorno
estable de programación de homebrew en PS3 bajo Windows, sin influencias externas que amenacen la integridad de las librerías, ni de las 
aplicaciones que se construyen con ellas, cuando alguien decide cambiarlo todo, rompiendo la compatibilidad con las aplicaciones creadas 
con esas librerías y provocando un claro perjuicio. Aquí el lema es "si algo funciona, no lo toques" y se pueden añadir cosas, pero no
restar, ni toquetear pijoteramente el código.

Que hacer:

- Baja el ZIP (en el boton).

- Crea en raiz de C: la carpeta "PSDK3v2" y descomprime dentro el contenido (puede instalarse en otras unidades o directorios cambiando 
los ficheros Make*.bat, si se prefiere, a posteriori)

- Extrae el fichero MinGW.7z (yo uso IZArc) y tendrás la carpeta "MinGW" con el entorno para hacer Make, etc.

- En PSDK3v2\MinGW\msys\1.0\etc edita el fichero "profile" y al final, donde pone "export PS3SDK="/c/PSDK3v2""
cambia la ruta por la que vayas a utilizar, si quieres lanzar la consola (msys.bat) con las variables de entorno
necesarias.

- Extrae ps3dev.7z y tendrás la carpeta "ps3dev" con los compiladores de PS3, las librerías necesarias ya compiladas
y las utilidades 

Lo que contiene el proyecto:

- MinGW: entorno MinGW/MSYS montado específicamente para trabajar con las herramientas de PS3.

- ps3dev: contiene los compiladores, las librerías externas compiladas y otras herramientas de apoyo, como la scetool 
para firmar aplicaciones (en sustitucion de las de geohot), crear paquetes, así como algunas DLL necesarias. 

- psl1ght: contiene la libreria psl1ght ya compilada

- libraries-src: contiene los códigos fuentes de PSL1GHT, Tiny3D y PS3 Soundlib

- project: contiene los códigos fuentes de los ejemplos y los ficheros .bat para crear los ejecutables

Cambiando la ruta de instalación desde C: a otra
-------------------------------------------------

Aparte de los cambios mencionados antes en /etc/profile (solopara la consola), si editas los Make*.bat y cambias:

set PS3SDK=/F/PSDK3v2
set WIN_PS3SDK=F:/PSDK3v2

por la ruta correspondiente, bastará.

Compilando
----------

Make_clean.bat -> Borra todos los ficheros compilados, excepto los .pkg

Make_SELF.bat -> Crea un .self firmado con las keys 3.40 (mediante scetool)

Make_EBOOT.BIN.bat -> Crea el self NPDRM EBOOT.BIN de la aplicación. Esto es interesante, si se actualiza vía FTP un .pkg 
                      ya instalado

Make_PKG.bat -> Crea el .pkg para instalar la aplicación.

La "scetool" requiere un fichero con keys que usa una ruta relativa. Por ese motivo se ha incluido la utilidad "fake_scetool"
para apoyarla.

ppu_rules ha sido modificado convenientemente para usar esa aplicación. Por defecto, contiene las keys en "SCETOOL_FLAGS". Se puede
sobrecargar definiendo con SCETOOL_FLAGS := y añadir más parámetros con SCETOOL_FLAGS += . Las keys 3.40 funcionan en los CFW que usamos
y por eso las he escogido.

Los Makefile de referencia los tienes en los ejemplos de project/sample. En concreto, "fireworks3D" es un ejemplo de utilización conjunta
de Tiny3D y la PS3 Soundlib y las librerías necesarias

Espero que estas herramientas os sean útiles en vuestros proyectos.

Saludos
