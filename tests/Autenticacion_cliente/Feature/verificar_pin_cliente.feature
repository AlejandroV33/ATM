# language: es
Característica: 3.1.2 Verificar PIN del cliente
  Como cliente de Produbanco
  Quiero verificar mi identidad mediante un PIN
  Para acceder de manera segura a mi cuenta bancaria

  Antecedentes:
    Dado que Bob es un cliente registrado de Produbanco
    Y ha introducido una tarjeta válida
    Y su tarjeta no está bloqueada
    Y el sistema solicita ingresar el PIN

  Escenario: Verificar PIN correcto
    Dado que el PIN registrado de Bob es "1234"
    Cuando Bob ingresa el PIN "1234"
    Entonces el sistema valida su identidad
    Y permite acceder al menú principal del cajero

  Escenario: Rechazar PIN incorrecto
    Dado que el PIN registrado de Bob es "1234"
    Y no ha realizado intentos fallidos
    Cuando Bob ingresa el PIN "4321"
    Entonces el sistema rechaza el PIN
    Y muestra un mensaje de PIN incorrecto
    Y permite realizar otro intento

  Escenario: Cancelar la verificación del PIN
    Dado que Bob se encuentra en la pantalla de ingreso del PIN
    Cuando selecciona la opción de cancelar
    Entonces el sistema cancela la autenticación
    Y no permite acceder a su cuenta
    Y expulsa la tarjeta
