String estado;
PImage imagen1, imagen2, imagen3;

//OJO aca hay que poner texto boton para poner algo en el//
String texto1, texto2, texto3, textoBoton;

int tiempoPantalla;
int tiempoInicio;

//boton. xboton es el valor de x, yboton el valor de y, diamboton el valor del diametro. los valores se ponen en el void setup
int xBoton, yBoton, diamBoton;
//

float unoX;
float velX;
float tamTexto2;
color colorTexto3; // Variable para el color del texto en la pantalla tres
int Color3; // Duración de cambio de color en frames


void setup() {
  size(640, 480); 
  background(255);
  
  estado = "pantallauno";
  
  imagen1 = loadImage("portada.jpg");
  imagen2 = loadImage("personaje.jpg");
  imagen3 = loadImage("social.jpg");
  
  texto1 = "Mundo Gaturro es un juego en línea para niños, este fue creado por el historietista argentino Nik en el año 2010";
  texto2 = "Se trata de un mundo virtual donde los jugadores adoptan un avatar gatuno. Este avatar es completamente personalizable, se les puede crear un hogar e incluso adoptar mascotas. Los personajes mas destacados son Gaturro y Agatha.";
  texto3 = "El juego ofrece una variedad de actividades, como juegos, misiones y socialización con otros jugadores.";
  
  // texto el boton
  textoBoton = "Reiniciar presentacion";
  //
  
  tiempoPantalla = 1200;
  tiempoInicio = frameCount;
  
  unoX = 0;
  velX = 0.5;
  tamTexto2 = 10;
  colorTexto3 = color(0);
  Color3 = 50; 
  
  // VALORES DEL BOTON, Cambiable//
  xBoton = 595;
  yBoton = 425;
  diamBoton = 90;
  //
  
  //el boton se pone dentro del estado de pantallatres dentro de void draw, atenta cuando bajes//
  
}

void draw() {
  background(255);  
   // ESTADOS uno
   
  if (estado.equals("pantallauno")) {
    image(imagen1, 0, 0, 640, 300);
    fill(0);
    textSize(25);
    if (unoX >= width){
      velX = -0.5;
    } unoX = unoX + velX;
      text(texto1, unoX, 350, 600, 100);
  } 
  //Pantalla dos
    else if (estado.equals("pantallados")) {
    image(imagen2, 0, 0, 640, 300);
    fill(0);
    textSize(tamTexto2);
    tamTexto2 += 0.01;
    if (tamTexto2 > 80) {
      tamTexto2 = 80;
    }
    text(texto2, 0, 350, 600, 100);
  }
  
  //Pantalla tres
  
    else if (estado.equals("pantallatres")) {
    image(imagen3, 0, 0, 640, 300); 
    fill(colorTexto3);
    textSize(20);
    text(texto3, 0, 350);
    fill(0);
    
    //EJECUCION DE BOTON
    
    ellipse(xBoton, yBoton, diamBoton, diamBoton);
    fill(255,0,0);
    textSize(13);
    text(textoBoton, 558, 413, 120, 300 ); 
    
    //ANIMACION TEXTO
    if (frameCount % Color3 == 0) {
      colorTexto3 = color(random(255), random(255), random(255));
    }
    
    }
    if (frameCount - tiempoInicio >= tiempoPantalla) {
    cambioPantalla();
  }
  
  println(mouseX, mouseY);
}

void cambioPantalla() {
  // Cambio de pantallas
  if (estado.equals("pantallauno")) {
    estado = "pantallados";
  } else if (estado.equals("pantallados")) {
    estado = "pantallatres";
  }
  tiempoInicio = frameCount;
}

void mousePressed() {
  // Cambiar de pantalla al hacer clic en el botón en la pantalla tres
  if (estado == "pantallatres" && dist(mouseX, mouseY, xBoton, yBoton) < diamBoton / 2) {
    estado = "pantallauno";
  }
}
