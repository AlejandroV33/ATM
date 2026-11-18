# Created by alejandrov at 12/11/26
# language: es

Característica: Notificar cuando el efectivo del cajero sea insuficiente
  Como operador autorizado de Produbanco
  Quiero recibir notificaciones cuando el efectivo de mis cajeros asignados alcance un nivel crítico
  Para coordinar su reabastecimiento con los responsables

  Antecedentes:
    Dado que existe un operador autorizado registrado en el sistema
    Y tiene asignado el cajero "A"
    Y el cajero "A" está activo
    Y el cajero "A" tiene la siguiente capacidad por subcelda:
      | tipo_billete | cantidad_maxima | monto_minimo |
      | 5            | 200             | 100          |
      | 10           | 200             | 200          |
      | 20           | 100             | 200          |

#  Escenario: El efectivo total está por debajo del mínimo
#    Dado que las subceldas del cajero A contienen:
#      | tipo_billete | cantidad_actual |
#      | 5            | 100             |
#      | 10           | 50              |
#      | 20           | 25              |
#    Cuando se retiran 700 dólares del cajero A
#    Y se extraen 20 billetes de 10 dólares y 25 billetes de 20 dólares
#    Entonces el sistema envía una notificación al operador autorizado
#    Y la notificación indica que el cajero A tiene efectivo total insuficiente
#    Y muestra el mensaje
#      """
#      "Se requieren 100 billetes de 5 dólares, 170 billetes de 10 dólares y 100 billetes de 20 dólares para abastecer el cajero A"
#      """
  Escenario: Una o varias subceldas alcanzan un nivel crítico
    Dado que las subceldas del cajero A contienen:
      | tipo_billete | cantidad_actual |
      | 5            | 20              |
      | 10           | 20              |
      | 20           | 10              |
    Cuando el sistema verifica el efectivo disponible por subcelda
    Entonces el sistema actualiza el estado del sistema a "DESABASTECIDO" y envía el siguiente mensaje al operador
      """
      "Se requieren 180 billetes de 5 dólares, 180 billetes de 10 dólares y 90 billetes de 20 dólares para abastecer el cajero A"
      """
  Escenario: El efectivo es suficiente
    Dado que las subceldas del cajero A contienen:
      | tipo_billete | cantidad_actual |
      | 5            | 100             |
      | 10           | 100             |
      | 20           | 50              |
    Cuando el sistema verifica el efectivo disponible
    #Entonces el sistema no envía notificaciones de efectivo insuficiente al operador autorizado

    Entonces el sistema envía una notificación al operador autorizado
    """
    "No se requiere abastecer el cajero A, ya que todas las subceldas tienen suficiente efectivo"
    """