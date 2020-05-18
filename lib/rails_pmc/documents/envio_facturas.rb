module RailsPmc
  ## Example File
  ## REGISTROS
  # registros = [ { numero_referencia: num,
  #                 id_factura: num,
  #                 vto_1: yyyymmdd,
  #                 importe_1: num,
  #                 vto_2: yyyymmdd,
  #                 importe_2: num,
  #                 vto_3: yyyymmdd,
  #                 importe_3: num
  #                 codigo_barras: alph,
  #                 nro_ref_ant: num (opt),
  #                 detalle: alph (opt) }, { .. }, ..., { .. }]
  ## CONFIG_DATA
  # config_data = { codigo_prisma: num,
  #                 codigo_empresa: num,
  #                 fecha_archivo: yyyymmdd }
  class EnvioFacturas < Fixy::Document

    def initialize(attrs = {})
      @config_data = attrs[:config_data]
      @registros = attrs[:registros]
    end

    def build
      counter = 0
      total = 0
      append_record EnvioFacturasHeader.new(@config_data)
      @registros.each do |registro|
        append_record EnvioFacturasDetalle.new(registro)
        counter += 1
        total += registro[:importe_1]
      end
      append_record EnvioFacturasTrailer(@config_data, counter, total)
    end

  end
end