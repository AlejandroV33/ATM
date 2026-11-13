# language: es
Característica: 2.2.2 Notificar fallas del cajero al banco
  Como operador autorizado de Produbanco
  Quiero recibir notificaciones de las fallas detectadas
  Para coordinar su revisión y reparación

  Antecedentes:
    Dado que Bob es un operador autorizado registrado en el sistema
    Y el cajero A está asignado a Bob
    Y el servicio de notificaciones está disponible

  Escenario: Notificar una falla detectada
    Dado que el cajero A está activo
    Cuando el sistema registra una falla en el dispensador
    Entonces el sistema envía una notificación a Bob
    Y la notificación identifica al cajero A
    Y describe la falla detectada

  Escenario: No notificar cuando el cajero funciona correctamente
    Dado que el cajero A está activo
    Cuando el sistema verifica sus componentes
    Y no detecta ninguna falla
    Entonces el sistema no envía notificaciones de fallas a Bob

  Escenario: Registrar una notificación que no pudo enviarse
    Dado que el cajero A presenta una falla registrada
    Cuando el servicio de notificaciones deja de estar disponible
    Entonces el sistema registra la notificación como pendiente
    Y conserva la información de la falla
