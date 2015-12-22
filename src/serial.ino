void setup()                    // run once, when the sketch starts
{
  Serial.begin(9600);           // set up Serial library at 9600 bps
  Serial.println("Hello world!");  // prints hello with ending line break
  pinMode(10, OUTPUT);
  pinMode(11, OUTPUT);
  analogWrite(10, 255);
  analogWrite(11, 255);
}

void loop()
{
  int first;
  int second;
  while (Serial.available() > 0) {
      Serial.println("a");
    first = Serial.parseInt();
      Serial.println(first);
    second = Serial.parseInt();
      Serial.println(second);
      Serial.println("b");
    //while (Serial.read() != '\n');
    //if (Serial.read() == '\n') {
    if (first > 0 && second > 0) {
      first = constrain(first, 0, 255);
      second = constrain(second, 0, 255);
      analogWrite(10, first);
      analogWrite(11, second);
      Serial.println("OK");
    }
  }
}
