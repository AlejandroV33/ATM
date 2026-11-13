# language: es
Característica: 1.1.2 Registrar comentarios del cliente
  Como cliente de Produbanco
  Quiero registrar comentarios sobre el servicio del cajero
  Para comunicar sugerencias o inconvenientes al banco

  Antecedentes:
    Dado que Bob es un cliente de Produbanco
    Y ha finalizado una operación en el cajero
    Y el sistema de comentarios está disponible

  Escenario: Registrar un comentario exitosamente
    Dado que Bob selecciona la opción de comentarios
    Cuando ingresa el comentario "El servicio fue rápido"
    Y confirma su envío
    Entonces el sistema guarda el comentario
    Y muestra un mensaje de confirmación

  Escenario: Intentar enviar un comentario vacío
    Dado que Bob selecciona la opción de comentarios
    Cuando intenta enviar un comentario vacío
    Entonces el sistema muestra un mensaje solicitando ingresar un comentario
    Y no registra ningún comentario

  Escenario: Cancelar el registro de un comentario
    Dado que Bob ha escrito un comentario
    Cuando selecciona la opción de cancelar
    Entonces el sistema descarta el comentario
    Y permite finalizar la sesión
