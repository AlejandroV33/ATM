# language="gherkin" 
# language: es
Característica: 3.2.2 Expulsar tarjeta al finalizar la operación
  Como cliente de Produbanco
  Quiero recuperar mi tarjeta al finalizar una operación
  Para evitar olvidarla en el cajero automático

  Antecedentes:
    Dado que Bob es un cliente registrado de Produbanco
    Y ha ingresado una tarjeta válida
    Y ha verificado correctamente su PIN
    Y el mecanismo de expulsión funciona correctamente

  Escenario: Expulsar tarjeta después de un retiro exitoso
    Dado que Bob ha retirado dinero exitosamente
    Cuando selecciona la opción de finalizar
    Entonces el sistema cierra su sesión
    Y el cajero expulsa la tarjeta
    Y muestra un mensaje solicitando retirar la tarjeta

  Escenario: Expulsar tarjeta después de consultar el saldo
    Dado que Bob ha consultado su saldo disponible
    Cuando selecciona la opción de finalizar
    Entonces el sistema cierra su sesión
    Y el cajero expulsa la tarjeta
    Y muestra un mensaje solicitando retirar la tarjeta

  Escenario: Expulsar tarjeta al cancelar una operación
    Dado que Bob ha iniciado una operación de retiro
    Cuando selecciona la opción de cancelar
    Entonces el sistema cancela la operación
    Y cierra su sesión
    Y el cajero expulsa la tarjeta
