class Subcelda:

    def __init__(self, tipo_billete: int,
                 cantidad_maxima: int, monto_minimo: int):

        self.tipo_billete = tipo_billete
        self.cantidad_maxima = cantidad_maxima
        self.monto_minimo = monto_minimo
        self.cantidad_actual = 0

    def establecer_cantidad(self, cantidad: int):
        if 0 <= cantidad <= self.cantidad_maxima:
            self.cantidad_actual = cantidad
        else:
            raise ValueError("Cantidad de billetes no válida")

    def calcular_monto(self):
        return self.tipo_billete * self.cantidad_actual

    def necesita_abastecimiento(self):
        return self.calcular_monto() <= self.monto_minimo

    def calcular_billetes_requeridos(self):
        return self.cantidad_maxima - self.cantidad_actual

    def retirar_billetes(self, cantidad: int):
        if 0 <= cantidad <= self.cantidad_actual:
            self.cantidad_actual -= cantidad
        else:
            raise ValueError("Cantidad de billetes insuficiente o inválida")
