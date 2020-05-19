module RailsPmc

  class EnvioFacturasTrailer < Fixy::Record
    include Fixy::Formatter::Numeric

    set_record_length 280

    # Fields Declaration:
    # -----------------------------------------------------------
    #       name          size      Range             Format
    # ------------------------------------------------------------
    field :codigo_registro, 1, '1-1', :numeric
    field :codigo_prisma, 3, '2-4', :numeric
    field :codigo_empresa, 4, '5-8', :numeric
    field :fecha_archivo, 8, '9-16', :numeric
    field :cantidad_registros, 7, '17-23', :numeric
    field :filler_1, 7, '24-30', :numeric
    field :total_importe, 16, '31-46', :numeric
    field :filler_2, 234, '47-280', :numeric

    def initialize(config_data, counter, total)
      @codigo_registro = 0
      @codigo_prisma = 400
      @codigo_empresa = config_data[:codigo_empresa]
      @fecha_archivo = config_data[:fecha_archivo].strftime('%Y%m%d')
      @cantidad_registros = counter
      @total_importe = total
      @filler_1 = @filler_2 = 0
    end

    attr_reader :codigo_registro, :codigo_prisma, :codigo_empresa, :fecha_archivo, :cantidad_registros, :total_importe,
    :filler_1, :filler_2

  end

end