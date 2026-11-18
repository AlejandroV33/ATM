from src.entidades.notificacion import Notificacion

class Notificador:

    def __init__(self):
        self.disponible = False
        self.notificaciones = []

    def activar(self):
        self.disponible = True

    def enviar_notificacion(self, notificacion: Notificacion):
        if self.disponible:
            self.notificaciones.append(notificacion)

    def notificacion_enviada(self):
        return len(self.notificaciones) > 0

    def obtener_ultima_notificacion(self):
        if self.notificacion_enviada():
            return self.notificaciones[-1]

        return None
