class Zones
    attr_rect
    attr_accessor :sprite_pieces, :fill_type


    def initialize init_opt
        @x = init_opt[:x]
        @y = init_opt[:y]
        @radius = init_opt[:radius]
    end


    def refill machine
        machine[@fill_type.to_sym]
    end
end