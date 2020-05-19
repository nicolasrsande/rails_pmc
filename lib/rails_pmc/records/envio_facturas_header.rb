module RailsPmc
  class EnvioFacturasHeader < Fixy::Record
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
    field :filler, 264, '17-280', :numeric

    def initialize(config_data)
      @codigo_registro = 9
      @codigo_prisma = 400
      @codigo_empresa = config_data[:codigo_empresa]
      @fecha_archivo = config_data[:fecha_archivo].strftime('%Y%m%d')
      @filler = 0
    end

    attr_reader :codigo_registro, :codigo_prisma, :codigo_empresa, :fecha_archivo, :filler

  end
end