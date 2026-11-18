import behave.runner
from behave import given, when, then

from src.entidades.operador import Operador
from src.entidades.atm import ATM
from src.entidades.subcelda import Subcelda
from src.entidades.notificador import Notificador

@given("que existe un operador autorizado registrado en el sistema")
def step_impl(context: behave.runner.Context):
    context.operador = Operador()


@given("tiene asignado el cajero {atm_nombre}")
def step_impl(context: behave.runner.Context, atm_nombre: str):
    context.atm = ATM(atm_nombre)
    context.operador.asignar_atm(context.atm)

    assert context.atm.operador_asignado == context.operador


@given("el servicio de notificaciones está disponible")
def step_impl(context: behave.runner.Context):
    context.notificador = Notificador()
    context.notificador.activar()


@given("el cajero {atm_nombre} está activo")
def step_impl(context: behave.runner.Context, atm_nombre: str):
    assert context.atm.nombre == atm_nombre

    context.atm.activar()


@given("el monto mínimo total definido es de {monto_minimo:d} dólares")
def step_impl(context: behave.runner.Context, monto_minimo: int):
    context.atm.establecer_monto_minimo(monto_minimo)


@given("el cajero {atm_nombre} tiene las siguientes subceldas configuradas:")
def step_impl(context: behave.runner.Context, atm_nombre: str):
    assert context.atm.nombre == atm_nombre

    for fila in context.table:
        subcelda = Subcelda(
            tipo_billete=int(fila["tipo_billete"]),
            cantidad_maxima=int(fila["cantidad_maxima"]),
            monto_minimo=int(fila["monto_minimo"])
        )

        context.atm.agregar_subcelda(subcelda)


@given("que las subceldas del cajero {atm_nombre} contienen:")
def step_impl(context: behave.runner.Context, atm_nombre: str):
    assert context.atm.nombre == atm_nombre

    for fila in context.table:
        tipo_billete = int(fila["tipo_billete"])
        cantidad_actual = int(fila["cantidad_actual"])

        subcelda = context.atm.obtener_subcelda(tipo_billete)
        subcelda.establecer_cantidad(cantidad_actual)


@when("se retiran {monto:d} dólares del cajero {atm_nombre}")
def step_impl(context: behave.runner.Context, monto: int, atm_nombre: str):
    assert context.atm.nombre == atm_nombre
    context.monto_retiro = monto


@when("se extraen {cantidad_1:d} billetes de {tipo_1:d} dólares y {cantidad_2:d} billetes de {tipo_2:d} dólares")
def step_impl(context: behave.runner.Context,
              cantidad_1: int, tipo_1: int,
              cantidad_2: int, tipo_2: int):

    billetes = {
        tipo_1: cantidad_1,
        tipo_2: cantidad_2
    }

    context.atm.retirar_dinero(
        context.monto_retiro,
        billetes
    )
    context.atm.verificar_efectivo(context.notificador)


@when("el sistema verifica el efectivo disponible por subcelda")
def step_impl(context: behave.runner.Context):
    context.atm.verificar_efectivo_por_subcelda(
        context.notificador
    )


@when("el sistema verifica el efectivo disponible")
def step_impl(context: behave.runner.Context):
    context.atm.verificar_efectivo(context.notificador)


@then("el sistema envía una notificación al operador autorizado")
def step_impl(context: behave.runner.Context):
    assert context.notificador.notificacion_enviada()

    context.notificacion = (
        context.notificador.obtener_ultima_notificacion()
    )

    assert context.notificacion.destinatario == context.operador


@then("la notificación indica que el cajero {atm_nombre} tiene efectivo total insuficiente")
def step_impl(context: behave.runner.Context, atm_nombre: str):
    assert context.notificacion.atm_nombre == atm_nombre
    assert context.notificacion.efectivo_total_insuficiente is True


@then("la notificación identifica las subceldas que alcanzaron su monto mínimo")
def step_impl(context: behave.runner.Context):
    subceldas_esperadas = {
        subcelda.tipo_billete
        for subcelda in context.atm.subceldas
        if subcelda.tipo_billete * subcelda.cantidad_actual
        <= subcelda.monto_minimo
    }

    assert len(subceldas_esperadas) > 0
    assert set(context.notificacion.subceldas_criticas) == subceldas_esperadas


@then("muestra el mensaje")
def step_impl(context: behave.runner.Context):
    mensaje_esperado = context.text.strip().strip('"')

    assert context.notificacion.mensaje == mensaje_esperado


@then("el sistema no envía notificaciones de efectivo insuficiente al operador autorizado")
def step_impl(context: behave.runner.Context):
    assert not context.notificador.notificacion_enviada()
