# Created by alejandrov at 12/11/26

# language: es

Característica: 2.1.2 Notificar cuando el efectivo del cajero sea insuficiente
  Como operador autorizado de Produbanco
  Quiero recibir notificaciones cuando el efectivo de mis cajeros asignados alcance un nivel crítico
  Para notificar y coordinar su reabastecimiento con los responsables

  Antecedentes:
    Dado que Bob es un operador autorizado registrado en el sistema
    Y el cajero A está asignado a Bob
    Y Bob está disponible
    Y el cajero A está activo
    Y el monto mínimo definido es de 1000 dólares
    Y la capacidad máxima del cajero A es de 5000 dólares

  Escenario: Notificación cuando el efectivo está por debajo del mínimo
    Dado que el cajero A tiene 1500 dólares disponibles
    Cuando el efectivo del cajero A disminuye a 900 dólares
    Entonces el sistema envía una notificación a Bob
    Y la notificación indica que el cajero A está por debajo del monto mínimo definido
    Y muestra el monto disponible de 900 dólares

  Escenario: Notificación cuando el efectivo alcanza el monto mínimo
    Dado que el cajero A tiene 1500 dólares disponibles
    Cuando el efectivo del cajero A disminuye a 1000 dólares
    Entonces el sistema envía una notificación a Bob
    Y la notificación indica que el cajero A ha alcanzado el monto mínimo definido

  Escenario: No enviar notificación cuando el efectivo es suficiente
    Dado que el cajero A tiene 3000 dólares disponibles
    Cuando el efectivo del cajero A disminuye a 2000 dólares
    Entonces el sistema no envía una notificación de efectivo insuficiente a Bob
