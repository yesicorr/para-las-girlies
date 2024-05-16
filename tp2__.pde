String estado;
PImage imagen1, imagen2, imagen3;
String texto1;
String texto2;
String texto3;
float unoX, dosX, tresX;
float velX, veldosX, veltresX;
int tiempoPantalla;
int tiempoInicio;

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
  
  unoX = 0;
  dosX = 0;
  tresX = 0;
  velX = 0.5;
  veldosX = 0.5;
  veltresX = 0.5;
  
  tiempoPantalla = 1800;
  tiempoInicio = 0;
}

void draw() {
  background(255);  
  
  if (estado.equals("pantallauno")) {
    
    image(imagen1, 0, 0, 640, 300);
    fill(0);
    textSize(25);
    if (unoX >= width){
    velX = -0.5;
}
    unoX = unoX + velX;
    text(texto1, unoX, 350, 600, 100);
    
    
  } else if (estado.equals("pantallados")) {
    image(imagen2, 0, 0, 640, 300);
    fill(0);
    textSize(20);
    dosX = dosX + veldosX;
     text(texto2, dosX, 350, 600, 100);
     
  } else if (estado.equals("pantallatres")) {
    image(imagen3, 0, 0, 640, 300); 
    fill(0);
    textSize(20);
    tresX = tresX + veltresX;
    text(texto3, tresX, 350, 600, 100);
  }
  
  if (frameCount - tiempoInicio > tiempoPantalla) {
    siguientePantalla();
  }
  
  println(mouseX,mouseY);
}

void siguientePantalla() {
  //cambio de pantallas. EVENTOS 
  
  if (estado.equals("pantallauno")) {
    estado = "pantallados";
  } else if (estado.equals("pantallados")) {
    estado = "pantallatres";
  } else if (estado.equals("pantallatres")) {
    estado = "pantallauno";
  }
  tiempoInicio = frameCount; // Reiniciar el tiempo
}
