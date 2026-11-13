# language: es
Característica: 3.2.1 Bloquear tarjeta después de varios intentos fallidos
  Como cliente de Produbanco
  Quiero que mi tarjeta se bloquee después de varios intentos fallidos de PIN
  Para proteger mi cuenta contra accesos no autorizados

  Antecedentes:
    Dado que Bob es un cliente registrado de Produbanco
    Y ha introducido una tarjeta válida
    Y su tarjeta no está bloqueada
    Y el sistema permite un máximo de 3 intentos fallidos de PIN

  Escenario: Bloquear tarjeta al tercer intento fallido
    Dado que Bob ha ingresado incorrectamente su PIN 2 veces
    Cuando ingresa un PIN incorrecto por tercera vez
    Entonces el sistema bloquea la tarjeta de Bob
    Y muestra un mensaje indicando que la tarjeta ha sido bloqueada
    Y no permite realizar operaciones bancarias

  Escenario: Permitir otro intento antes de alcanzar el límite
    Dado que Bob ha ingresado incorrectamente su PIN 1 vez
    Cuando ingresa nuevamente un PIN incorrecto
    Entonces el sistema registra el segundo intento fallido
    Y muestra un mensaje de PIN incorrecto
    Y permite realizar un último intento

  Escenario: Reiniciar intentos fallidos después de ingresar el PIN correcto
    Dado que Bob ha ingresado incorrectamente su PIN 2 veces
    Cuando ingresa su PIN correcto
    Entonces el sistema valida su identidad
    Y reinicia el contador de intentos fallidos
    Y permite acceder al menú principal
