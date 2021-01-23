---
title: Simple Moisture Monitor
description: A moisture sensor to alert you when you need to water your plants.
---


```
#define moistureData A1
#define moisturePower 3
#define ledRPin 11
#define ledBPin 10
#define ledGPin 9

void setup() {
  Serial.begin(9600);
  pinMode(moisturePower, OUTPUT);
  digitalWrite(moisturePower, LOW);
  pinMode(ledRPin, OUTPUT);
  pinMode(ledGPin, OUTPUT);
  pinMode(ledBPin, OUTPUT);
  digitalWrite(ledRPin, HIGH);
  digitalWrite(ledGPin, HIGH);
  digitalWrite(ledBPin, HIGH);
}

void loop() {
  digitalWrite(moisturePower, HIGH);
  delay(100);
  int moistureRead = analogRead(moistureData);
  digitalWrite(moisturePower, LOW);
  int moistureValue = 1024 - moistureRead;
  Serial.print("MOISTURE READING");
  Serial.println(moistureValue);

  if (moistureValue > 700) {
    digitalWrite(ledGPin, LOW);
    digitalWrite(ledRPin, HIGH);
  } else {
    digitalWrite(ledGPin, HIGH);
    digitalWrite(ledRPin, LOW);
  }
  delay(400);
}
```
