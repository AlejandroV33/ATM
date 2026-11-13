# language: es
Característica: 2.2.1 Detectar fallas del cajero automático
  Como operador autorizado de Produbanco
  Quiero que el sistema detecte fallas en los cajeros
  Para identificar problemas que afecten su funcionamiento

  Antecedentes:
    Dado que el cajero A está registrado en el sistema
    Y el sistema de monitoreo está disponible

  Escenario: Detectar una falla en el dispensador
    Dado que el cajero A está activo
    Cuando el dispensador de efectivo presenta una falla
    Entonces el sistema detecta el problema
    Y registra la falla del dispensador
    Y marca al cajero A como fuera de servicio

  Escenario: Detectar una falla en el lector de tarjetas
    Dado que el cajero A está activo
    Cuando el lector de tarjetas deja de funcionar
    Entonces el sistema detecta el problema
    Y registra la falla del lector
    Y marca al cajero A como fuera de servicio

  Escenario: Cajero funcionando correctamente
    Dado que el cajero A está activo
    Cuando el sistema verifica sus componentes
    Y todos funcionan correctamente
    Entonces el sistema mantiene al cajero A como activo
    Y no registra nuevas fallas
