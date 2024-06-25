#include <SoftwareSerial.h>
#include <LiquidCrystal.h>
#include "MQ135.h" // Ensure this library is installed
#include "DHT.h" // Ensure this library is installed
#include "MQ2.h" // Ensure this library is installed

#define DEBUG true

// Pins
const int sensorPin = A0; // MQ135
const int buzzerPin = 8; // Assuming the buzzer is connected to pin 8
const int dhtPin = 7; // DHT11
const int mq2Pin = A1; // MQ-2

// Sensor objects
MQ135 gasSensor(sensorPin); // Initialize the MQ135 sensor
DHT dht(dhtPin, DHT11); // Initialize the DHT11 sensor
MQ2 mq2(mq2Pin); // Initialize the MQ-2 sensor
LiquidCrystal lcd(12, 11, 5, 4, 3, 2); // (RS, E, D4, D5, D6, D7)

void setup() {
    Serial.begin(9600); // Start Serial communication before anything else
    while (!Serial) { 
        ; // Wait for serial port to connect. Needed for native USB
    }
    pinMode(buzzerPin, OUTPUT); // Buzzer indicator
    digitalWrite(buzzerPin, LOW); // Ensure the buzzer is off initially

    // Initialize LCD
    lcd.clear();
    lcd.begin(16, 2);
    lcd.setCursor(0, 0);
    lcd.print("AA14 Team         ");
    lcd.setCursor(0, 1);
    lcd.print("Sensors Warming Up");
    delay(1500);
    lcd.clear();

    // Initialize sensors
    dht.begin(); // Initialize the DHT sensor
    mq2.begin(); // Initialize the MQ-2 sensor

    pinMode(sensorPin, INPUT); // Gas sensor input
    pinMode(mq2Pin, INPUT); // MQ-2 sensor input
}

void loop() {
    double air_quality = gasSensor.getPPM();
    double smoke_level = mq2.readSmoke();
    double co_level = mq2.readCO();
    float temperature = dht.readTemperature();
    float humidity = dht.readHumidity();

    // Print sensor values to Serial Monitor for debugging
    Serial.print(air_quality);
    Serial.print(" ");
    Serial.print(smoke_level, 4);
    Serial.print(" ");
    Serial.print(co_level,4);
    Serial.print(" ");
    Serial.print(temperature);
    Serial.print(" ");
    Serial.print(humidity);
    Serial.println();
    // Update LCD
    lcd.setCursor(0, 0);
    lcd.print("AQI: ");
    lcd.print(air_quality, 1);
    lcd.print("PPM     ");
    lcd.setCursor(0, 1);
    lcd.print("T:");
    lcd.print(temperature, 1);
    lcd.print("C H:");
    lcd.print(humidity, 1);
    lcd.print("%    ");

    // Handle buzzer based on air quality, smoke, and CO levels
    if (air_quality <= 1000 && smoke_level <= 200 && co_level <= 200) {
        digitalWrite(buzzerPin, LOW); // Turn off buzzer
    } else if ((air_quality > 1000 && air_quality <= 2000) || 
               (smoke_level > 200 && smoke_level <= 500) || 
               (co_level > 200 && co_level <= 500)) {
        digitalWrite(buzzerPin, HIGH); // Turn on buzzer
       }

    delay(1000); // Delay to allow sensors to update
}