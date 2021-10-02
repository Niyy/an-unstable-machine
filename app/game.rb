class Game
    attr_accessor :args, :outputs, :state, :inputs, :player_machine

    def tick
        inputs
        logic
        renders
    end


    def initialize init_opt
        @args = init_opt[:args]
        @outputs = @args.outputs
        @inputs = @args.inputs
        @state = @args.state
        @player_machine = {
            x: 0,
            y: 0,
            w: 64,
            h: 64,
            path: 'sprites/square/violet.png',
            velocity: 0, 
            angle: 0
        }
    end


    def renders
        render_machine
    end


    def render_machine
        @args.outputs.sprites << @player_machine
    end


    def inputs
        if(@inputs.keyboard.w)
            if @player_machine[:velocity] < 5
                @player_machine[:velocity] += 0.1
            end
        end
        if(@inputs.keyboard.s)
            if @player_machine[:velocity] > -1
                @player_machine[:velocity] -= 0.1
            end
        end
        if(@inputs.keyboard.space)
            @player_machine[:velocity] = 0
        end
        if(@inputs.keyboard.a)
            @player_machine[:angle] += 2.0 
        end
        if(@inputs.keyboard.d)
            @player_machine[:angle] -= 2.0 
        end
    end


    def logic
        @player_machine[:x] += @player_machine[:velocity] * Math.cos((Math::PI / 180) * @player_machine[:angle])
        @player_machine[:y] += @player_machine[:velocity] * Math.sin((Math::PI / 180) * @player_machine[:angle])
    end


    def serialize
        { player_machine: player_machine }
    end


    def inspect
        serialize.to_s
    end


    def to_s
        serialize.to_s
    end
end