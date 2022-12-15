#include <SoftwareSerial.h>

const int buttonPin = 2;

SoftwareSerial bluetooth(10, 11); //RX, TX
char input[] = " ";
int buttonState = 0;
int timesNotified = 0;

void setup() {
    pinMode(buttonPin, INPUT);
    Serial.begin(9600);
    bluetooth.begin(9600);
}

void loop() {
    buttonState = digitalRead(buttonPin);

    if(buttonState == HIGH) {
        sendSignal();
    }

    sendReset();
}

void sendSignal() {
    bluetooth.print(timesNotified);
    bluetooth.print(";");
    Serial.println("timesNotified");
    timesNotified++;
    delay(20);
}

void sendReset() {
    bluetooth.print(timesNotified);
    bluetooth.print(";");
}