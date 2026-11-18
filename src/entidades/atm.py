from src.entidades.subcelda import Subcelda
from src.entidades.notificador import Notificador
from src.entidades.notificacion import Notificacion

class ATM:

    def __init__(self, nombre: str):
        self.nombre = nombre
        self.activo = False
        self.operador_asignado = None
        self.monto_minimo = 0
        self.subceldas = []

    def activar(self):
        self.activo = True

    def establecer_monto_minimo(self, monto_minimo: int):
        self.monto_minimo = monto_minimo

    def agregar_subcelda(self, subcelda: Subcelda):
        self.subceldas.append(subcelda)

    def obtener_subcelda(self, tipo_billete: int):
        for subcelda in self.subceldas:
            if subcelda.tipo_billete == tipo_billete:
                return subcelda

        raise ValueError("Subcelda no encontrada")

    def calcular_efectivo_total(self):
        return sum(
            subcelda.calcular_monto()
            for subcelda in self.subceldas
        )

    def retirar_dinero(self, monto: int, billetes: dict):
        if not self.activo:
            raise ValueError("El cajero no está activo")

        monto_retiro = sum(
            tipo * cantidad
            for tipo, cantidad in billetes.items()
        )

        if monto <= 0 or monto_retiro != monto:
            raise ValueError("Monto de retiro incorrecto")

        for tipo, cantidad in billetes.items():
            subcelda = self.obtener_subcelda(tipo)

            if cantidad < 0 or cantidad > subcelda.cantidad_actual:
                raise ValueError("Cantidad de billetes inválida o insuficiente")

        for tipo, cantidad in billetes.items():
            subcelda = self.obtener_subcelda(tipo)
            subcelda.retirar_billetes(cantidad)

    def obtener_subceldas_criticas(self):
        return [
            subcelda for subcelda in self.subceldas
            if subcelda.necesita_abastecimiento()
        ]

    def generar_mensaje(self, subceldas):
        partes = []

        for subcelda in subceldas:
            cantidad = subcelda.calcular_billetes_requeridos()
            tipo = subcelda.tipo_billete

            if cantidad > 0:
                partes.append(f"{cantidad} billetes de {tipo} dólares")

        if len(partes) > 1:
            detalle = ", ".join(partes[:-1]) + " y " + partes[-1]
        else:
            detalle = partes[0] if partes else ""

        return (
            f"Se requieren {detalle} "
            f"para abastecer el cajero {self.nombre}"
        )

    def verificar_efectivo(self, notificador: Notificador):
        if not self.activo or self.operador_asignado is None:
            return

        efectivo_insuficiente = (
            self.calcular_efectivo_total() <= self.monto_minimo
        )

        subceldas_criticas = self.obtener_subceldas_criticas()

        if efectivo_insuficiente or subceldas_criticas:

            if efectivo_insuficiente:
                subceldas_abastecer = self.subceldas
            else:
                subceldas_abastecer = subceldas_criticas

            notificacion = Notificacion(
                destinatario=self.operador_asignado,
                atm_nombre=self.nombre,
                efectivo_total_insuficiente=efectivo_insuficiente,
                subceldas_criticas=[
                    subcelda.tipo_billete
                    for subcelda in subceldas_criticas
                ],
                mensaje=self.generar_mensaje(subceldas_abastecer)
            )

            notificador.enviar_notificacion(notificacion)

    def verificar_efectivo_por_subcelda(self, notificador: Notificador):
        self.verificar_efectivo(notificador)