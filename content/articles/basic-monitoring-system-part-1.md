---
title: Basic Monitoring System
description: Using sensors to collect data
---


Code
```

#define tempAmbientData A3
#define tempGrowLightData A2
#define moisture1Data A6
#define moisture1Power 3
#define moisture2Data A5
#define moisture2Power 4
#define checkGrowLightData 5

void setup() {
  Serial.begin(9600);
  pinMode(moisture1Power, OUTPUT);
  pinMode(moisture2Power, OUTPUT);
  digitalWrite(moisture1Power, LOW);
  digitalWrite(moisture2Power, LOW);
}

void loop() {
  digitalWrite(moisture1Power, HIGH);
  delay(50);
  int moisture1Read = analogRead(moisture1Data);
  digitalWrite(moisture1Power, LOW);
  int moisture1Value = 1024 - moisture1Read;
  Serial.print("MOISTURE_1 ");
  Serial.println(moisture1Value);
  delay(500);

  digitalWrite(moisture2Power, HIGH);
  delay(50);
  int moisture2Read = analogRead(moisture2Data);
  digitalWrite(moisture2Power, LOW);
  int moisture2Value = 1024 - moisture2Read;
  Serial.print("MOISTURE_2 ");
  Serial.println(moisture2Value);
  delay(500);

  int tempAmbientRead = analogRead(tempAmbientData);
  float tempAmbientValue = tempAmbientRead * (5000 / 1024.0);
  Serial.print("TEMP_AMBIENT ");
  Serial.println(tempAmbientValue / 10);

  int tempGrowLightRead = analogRead(tempGrowLightData);
  float tempGrowLightValue = tempGrowLightRead * (5000 / 1024.0);
  Serial.print("TEMP_GROWLIGHT ");
  Serial.println(tempGrowLightValue / 10);

  int checkGrowLightRead = digitalRead(checkGrowLightData);
  Serial.print("CHECK_GROWLIGHT ");
  if ( checkGrowLightRead == HIGH ) {
    Serial.println("0");
  } else {
    Serial.println("1");
  }

  delay(60000);
}
```
