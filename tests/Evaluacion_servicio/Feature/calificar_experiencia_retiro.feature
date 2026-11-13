# language: es
Característica: 1.1.1 Calificar la experiencia del retiro
  Como cliente de Produbanco
  Quiero calificar mi experiencia al retirar dinero
  Para ayudar al banco a mejorar la calidad del servicio

  Antecedentes:
    Dado que Bob es un cliente de Produbanco
    Y ha realizado una operación de retiro
    Y el sistema de calificaciones está disponible

  Escenario: Calificar exitosamente la experiencia
    Dado que Bob ha completado un retiro exitoso
    Cuando selecciona una calificación de 5 estrellas
    Entonces el sistema registra la calificación
    Y muestra un mensaje de agradecimiento

  Escenario: Calificar una experiencia insatisfactoria
    Dado que Bob ha completado un retiro exitoso
    Cuando selecciona una calificación de 1 estrella
    Entonces el sistema registra la calificación
    Y muestra un mensaje de agradecimiento

  Escenario: Omitir la calificación
    Dado que Bob ha completado un retiro exitoso
    Cuando decide omitir la calificación
    Entonces el sistema no registra ninguna calificación
    Y permite finalizar la sesión 