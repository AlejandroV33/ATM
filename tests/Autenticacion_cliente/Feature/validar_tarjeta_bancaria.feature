# language: es
Característica: 3.1.1 Validar tarjeta bancaria
  Como cliente de Produbanco
  Quiero que el cajero valide mi tarjeta bancaria
  Para acceder de forma segura a los servicios disponibles

  Antecedentes:
    Dado que el cajero A está activo
    Y el lector de tarjetas funciona correctamente
    Y el sistema de validación está disponible

  Escenario: Validar una tarjeta vigente
    Dado que Bob tiene una tarjeta registrada y vigente
    Cuando Bob introduce su tarjeta en el cajero
    Entonces el sistema reconoce la tarjeta
    Y solicita ingresar el PIN

  Escenario: Rechazar una tarjeta vencida
    Dado que Bob tiene una tarjeta vencida
    Cuando Bob introduce su tarjeta en el cajero
    Entonces el sistema rechaza la tarjeta
    Y muestra un mensaje indicando que está vencida
    Y no permite continuar con la autenticación

  Escenario: Rechazar una tarjeta no registrada
    Dado que Bob tiene una tarjeta no registrada en el banco
    Cuando Bob introduce su tarjeta en el cajero
    Entonces el sistema rechaza la tarjeta
    Y muestra un mensaje indicando que no es válida
    Y no permite continuar con la autenticación
