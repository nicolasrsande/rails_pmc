module RailsPmc
  class EnvioFacturasDetalle < Fixy::Record
    include Fixy::Formatter::Alphanumeric
    include Fixy::Formatter::Numeric

    set_record_length 280

    # Fields Declaration:
    # -----------------------------------------------------------
    #       name          size      Range             Format
    # ------------------------------------------------------------
    field :codigo_registro, 1, 1-1, :numeric


    def initialize(comprobante)

    end

    attr_reader

  end
end