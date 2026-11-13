# Created by alejandrov at 12/11/26

# language: es

Característica: Notificar cuando el efectivo del cajero sea insuficiente
  Como operador autorizado de Produbanco
  Quiero recibir notificaciones cuando el efectivo de mis cajeros asignados alcance un nivel crítico
  Para coordinar su reabastecimiento con los responsables

  Antecedentes:
    Dado que Bob es un operador autorizado registrado en el sistema
    Y el cajero A está asignado a Bob
    Y el servicio de notificaciones está disponible
    Y el cajero A está activo
    Y el monto mínimo total definido es de 1000 dólares
    Y la capacidad máxima del cajero A es de 5000 dólares
    Y el cajero A contiene subceldas para billetes de distintas denominaciones
    Y cada subcelda tiene un monto mínimo definido

  Escenario: Notificar cuando el efectivo total está por debajo del mínimo
    Dado que el cajero A tiene 1500 dólares disponibles
    Cuando el efectivo total disminuye a 900 dólares
    Entonces el sistema envía una notificación a Bob
    Y la notificación indica que el cajero A tiene efectivo insuficiente
    Y muestra el monto total disponible de 900 dólares

  Escenario: Notificar cuando una subcelda alcanza su monto mínimo
    Dado que la subcelda de billetes de 20 dólares tiene un monto mínimo de 200 dólares
    Y la subcelda contiene 300 dólares
    Cuando el efectivo de la subcelda disminuye a 200 dólares
    Entonces el sistema envía una notificación a Bob
    Y la notificación identifica la subcelda de billetes de 20 dólares
    Y muestra el monto disponible de 200 dólares

  Escenario: Notificar cuando una subcelda está por debajo del mínimo
    Dado que la subcelda de billetes de 10 dólares tiene un monto mínimo de 100 dólares
    Y la subcelda contiene 150 dólares
    Cuando el efectivo de la subcelda disminuye a 90 dólares
    Entonces el sistema envía una notificación a Bob
    Y la notificación indica que la subcelda de billetes de 10 dólares tiene efectivo insuficiente
    Y muestra el monto disponible de 90 dólares

  Escenario: No notificar cuando el efectivo es suficiente
    Dado que el cajero A tiene 3000 dólares disponibles
    Y todas sus subceldas tienen efectivo por encima de sus montos mínimos
    Cuando el efectivo total disminuye a 2500 dólares
    Y todas las subceldas permanecen por encima de sus montos mínimos
    Entonces el sistema no envía notificaciones de efectivo insuficiente a Bob

  Escenario: Notificar cuando varias subceldas tienen efectivo insuficiente
    Dado que la subcelda de billetes de 10 dólares está por debajo de su monto mínimo
    Y la subcelda de billetes de 20 dólares está por debajo de su monto mínimo
    Cuando el sistema verifica el efectivo disponible
    Entonces el sistema envía una notificación a Bob
    Y la notificación identifica ambas subceldas
    Y muestra el monto disponible de cada una

