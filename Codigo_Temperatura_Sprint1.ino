int pinoSensor = 0;
int valorLido = 0;
float temperatura = 0;
//int linha = 0;

void setup(){
  Serial.begin(9600);
  //Serial.println("CLEARDATA");
  //Serial.println("LABEL,hora,temperatura,linha")
  //Serial.println("Temperatura");
}
void loop(){
  valorLido = analogRead(pinoSensor);
  temperatura = (valorLido * 0.00488);
  temperatura = temperatura * 100;
  //linha++;
  //Serial.print("DATA, TIME, ");
  Serial.println(temperatura);
  //Serial.print(",");
  //Serial.println(linha);

  //if (linha > 100)

  {
   // linha = 0;
    //Serial.println("ROW,SET,2");
  }
  delay(100);
}
