# language: es
Característica: 2.1.1 Abastecer cajero automático
  Como encargado autorizado de abastecimiento de Produbanco
  Quiero agregar efectivo a los cajeros asignados
  Para mantener dinero disponible para los clientes

  Antecedentes:
    Dado que Bob es un encargado de abastecimiento autorizado
    Y el cajero A está asignado a Bob
    Y el cajero A tiene una capacidad máxima de 5000 dólares
    Y el cajero A está en modo de mantenimiento

  Escenario: Abastecer cajero exitosamente
    Dado que el cajero A tiene 1000 dólares disponibles
    Cuando Bob agrega 3000 dólares al cajero
    Y confirma el abastecimiento
    Entonces el sistema registra el abastecimiento
    Y el cajero A queda con 4000 dólares disponibles

  Escenario: Abastecer cajero hasta su capacidad máxima
    Dado que el cajero A tiene 2000 dólares disponibles
    Cuando Bob agrega 3000 dólares al cajero
    Y confirma el abastecimiento
    Entonces el sistema registra el abastecimiento
    Y el cajero A queda con 5000 dólares disponibles

  Escenario: Intentar abastecer más de la capacidad máxima
    Dado que el cajero A tiene 4000 dólares disponibles
    Cuando Bob intenta registrar un abastecimiento de 2000 dólares
    Entonces el sistema informa que se supera la capacidad máxima
    Y no confirma el abastecimiento
    Y el monto registrado permanece en 4000 dólares
