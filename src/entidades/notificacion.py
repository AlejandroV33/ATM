class Notificacion:

    def __init__(self, destinatario, atm_nombre: str,
                 efectivo_total_insuficiente: bool,
                 subceldas_criticas: list, mensaje: str):

        self.destinatario = destinatario
        self.atm_nombre = atm_nombre
        self.efectivo_total_insuficiente = efectivo_total_insuficiente
        self.subceldas_criticas = subceldas_criticas
        self.mensaje = mensaje
