class Game
    attr_accessor :args, :outputs, :state, :inputs, :player_machine

    def tick
        inputs
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
            direction: 0
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
            if @player_machine[:velocity] < 20
                @player_machine[:velocity] += 1
            end
        end
    end


    def logic

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