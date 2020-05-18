module RailsPmc
  class EnvioFacturasDetalle < Fixy::Record
    include Fixy::Formatter::Alphanumeric
    include Fixy::Formatter::Numeric

    set_record_length 280

    # Fields Declaration:
    # -----------------------------------------------------------
    #       name          size      Range             Format
    # ------------------------------------------------------------
    field :codigo_registro, 1, '1-1', :numeric
    field :numero_referencia, 19, '2-20', :alphanumeric
    field :id_factura, 20, '21-40', :alphanumeric
    field :codigo_moneda, 1, '41-41', :numeric
    field :fecha_vencimiento_1, 8, '42-49', :numeric
    field :importe_vencimiento_1, 11, '50-60', :numeric
    field :fecha_vencimiento_2, 8, '61-68', :numeric
    field :importe_vencimiento_2, 11, '69-79', :numeric
    field :fecha_vencimiento_3, 8, '80-87', :numeric
    field :importe_vencimiento_3, 11, '88-98', :numeric
    field :filler_1, 19, '99-117', :numeric
    field :numero_referencia_ant, 19, '118-136', :alphanumeric
    field :mensaje_ticket, 40, '137-176', :alphanumeric
    field :mensaje_pantalla, 15, '177-191', :alphanumeric
    field :codigo_barras, 60, '192-251', :alphanumeric
    field :filler_2, 29, '252-280', :numeric

    def initialize(registro)
      @codigo_registro = 5
      @numero_referencia = registro[:numero_referencia]
      @id_factura = registro[:id_factura]
      @codigo_moneda = 0
      @fecha_vencimiento_1 = registro[:vto_1]
      @importe_vencimiento_1 = registro[:importe_1]
      @fecha_vencimiento_2 = registro[:vto_2] || @fecha_vencimiento_1
      @importe_vencimiento_2 = registro[:importe_2] || @importe_vencimiento_1
      @fecha_vencimiento_3 = registro[:vto_3]  || @fecha_vencimiento_1
      @importe_vencimiento_3 = registro[:importe_3] || @importe_vencimiento_1
      @filler_1 = 0
      @numero_referencia_ant = registro[:nro_ref_ant] || @numero_referencia
      @mensaje_ticket = registro[:detalle] || 'Pago C/C'
      @mensaje_pantalla = registro[:detalle] || 'Pago C/C'
      @codigo_barras = registro[:codigo_barras] || 0
      @filler_2 = 0
    end

    attr_reader :codigo_registro, :numero_referencia, :id_factura, :codigo_moneda, :fecha_vencimiento_1, :importe_vencimiento_1,
    :fecha_vencimiento_2, :importe_vencimiento_2, :fecha_vencimiento_3, :importe_vencimiento_3, :filler_1, :filler_2,
    :numero_referencia_ant, :mensaje_ticket, :mensaje_pantalla, :codigo_barras

  end
end