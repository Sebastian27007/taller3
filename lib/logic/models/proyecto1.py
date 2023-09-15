from PIL import Image

imagen = Image.open("nombre_de_la_imagen.png")

def area(imagen):
 BACKGROUND = (255,255,255) # fondo blanco
 Mpq = 0.0 #contador del area
 for v in range(imagen.height): # recorrido de la imagen
    for u in range(imagen.width):
        if(imagen.getpixel((u,v)) != BACKGROUND):
        Mpq = Mpq + 1 # si pixel no es de fondo suma 1
 return Mpq