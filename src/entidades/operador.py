class Operador:

    def __init__(self):
        self.autorizado = True
        self.atms_asignados = []

    def asignar_atm(self, atm):
        if self.autorizado:
            self.atms_asignados.append(atm)
            atm.operador_asignado = self