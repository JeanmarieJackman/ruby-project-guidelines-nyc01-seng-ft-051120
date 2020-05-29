class CLI

    def run
        # pid = fork{ exec 'afplay', "/Users/jeanmariejackman/Development/code/Mod1/project/ruby-project-guidelines-nyc01-seng-ft-051120/lib/POL-reach-the-sky-short.wav" }
        # self.greeting 
###need to require yes or no before moving to create player
###
###need method to validate player_exist_in_db? if no, create_player,
###     if in db is true, puts "welcome back #{player.name}"
        self.create_new_player
        while true
            # puts "\nType 'info' to get a list of options. Say 'quit' to exit game."
            sleep(0.25)
            puts "    "
            puts "What would you like to do?"
            input = gets.chomp

            break if input == "quit" || input == "exit"

            case input
            when "info"
                self.info
            when "help"
                self.info
            when "inspect"
                self.inspect_player
            when "delete"
                self.delete_player
            when "create"
                self.create_new_player
            when "go"
                self.enter_game
        else
            puts "Oops, I don't understand, try 'info' for help."
        end
    end
end  

    def greeting
        system "clear"
        puts ""                                                                                                                     
        puts "     _____                                    __   _   _            _____          __          ___                  _ "
        puts "    / ____|                                  / _| | | | |          |_   _|         X X        / (_)                | |"
        sleep(0.25)
        puts "   | |     __ ___   _____ _ __ _ __     ___ | |_  | |_| |__   ___    | |  ___ ___   X X  /X  / / _ ______ _ _ __ __| |"
        sleep(0.25)
        puts "   | |    / _` X X / / _ X '__| '_ X   / _ X|  _| | __| '_ X / _ X   | | / __/ _ X   X X/  X/ / | |_  / _` | '__/ _` |"
        sleep(0.25)
        puts "   | |___| (_| |X V /  __/ |  | | | | | (_) | |   | |_| | | |  __/  _| || (_|  __/    X  /X  /  | |/ / (_| | | | (_| |"
        sleep(0.25)
        puts "    X_____X__,_| X_/ X___|_|  |_| |_|  X___/|_|    X__|_| |_|X___| |_____X___X___|     X/  X/   |_/___X__,_|_|  X__,_|"
        puts " "
        puts " "
        puts " "
        puts " "
        puts "                                            /'X                                                         "
        sleep(0.25)
        puts "                                           /   X              /'X       _                               "
        sleep(0.25)
        puts "                                      /'.,/     X_         .,'   X     / X_                             "
        sleep(0.25)
        puts "                                     /            X      _/       X_  /    X     _                      "
        sleep(0.25)
        puts "                            X__,.   /              X    /           X/.,   _|  _/ X                     "
        sleep(0.25)
        puts "                           /     X_/                X  /',.,''X      X_ X_/  X/    X                    "
        sleep(0.25)
        puts "                           |                      _  X/   /    ',../',.X    _/      X                   "
        sleep(0.25)
        puts "                          /         /           _XmX  X  /    |         X  /.,/'X   _X                  "
        sleep(0.25)
        puts "                         /        _/           XMMmmX  X_     |          X/      X_/  X                 "
        sleep(0.25)
        puts "                        /        /      X     XMMMMmmX   X__   X          X_       X   X_               "
        sleep(0.25)
        puts "                       /        /        X   XMMMMMMmX      X   X           X       X    X              "
        sleep(0.25)
        puts "                     _/        /          X  XMMMMMMmmX      X___            X_      X_   X             "
        sleep(0.25)
        puts "                    /         /            XXMMMMMMMMmmX____.'  /X_            X       X   X_           "
        sleep(0.25)
        puts "   ________________/_________/             /'.,___________...,,'   X            X   X        X________________________ "
        puts " "
        puts " "
        sleep(0.25)
        puts " "
        puts " "
        puts "Welcome to Cavern of the Ice Wizard!!  Would you like instructions?"
        reply = gets.chomp
        if reply.downcase == "yes"
            puts " "
            sleep(0.25)
            puts " "
            puts "The story begins at the entrance of a dark cave. Legend holds that an evil Ice Wizard lurks deep within the cavern,"
            puts "with all the gold and treasure that he has plundered from many an unsuspecting traveller. If you defeat the Wizard,"
            puts "you will claim ALL the treasure and WIN the game. However, many have tried, and were not seen again for a thousand years!"
            puts "Go forth! But be stealthy, attentive, and prudent in your decisions. You can move through the game with simple one- or"
            puts "two-word commands, such as: LOOK, GET, USE, GO NORTH, or USE ITEM. At any time during your journey, type “info” to get"
            puts "information on how to continue your journey"
            puts " "
            puts "You are standing at the entrance of a dark cave..."
        elsif reply.downcase == "no"
            puts "You are standing at the entrance of a dark cave..."
        # else 
        #     puts "Please answer yes or no. Would you like instructions?"
        end
    end
    # A User can create and save a Player
    def create_new_player
        puts "Please type in your player name"
        sleep(0.25)
        puts "    "
        name = gets.chomp
        player = Player.new 
        player.name = name
        player.save
        puts "    "
        puts "Welcome #{name}"
        sleep(0.25)
        puts "    "
    end

    def name
        name = Player.last.name
    end

    def health
        health = Player.last.health
    end

    def strength
        strength = Player.last.attack_power
    end

    def player
        player = Player.last
    end
        
    def info
        sleep(0.25)
        puts "    "
                # future todo: puts "You can say 'create' to create new player"
                # future todo: puts "You can say 'log in' to enter your player name and start a new game"
        puts "You can say 'inspect' to inspect your player stats"
        puts "You can say 'go' to enter the game"
        puts "You can say 'delete' to delete your most recently created player and start over"
        sleep(0.25)
        puts "    "
    end

    ## A User can see the Player's attributes
    def inspect_player
        sleep(0.25)
        puts "    "
        puts "Report:  #{name}, you have #{health} health, and #{strength} attack points"            
    end
    
    ## A User can delete a Player
    def delete_player
        while true
            puts "Are you sure you want to delete this player? (y/n)"
            input = gets.chomp

            # break if input == "quit" || input == "exit"

            case input
            when 'n'
                self.info 
                break
            when 'y'
                puts "To create a new player, type 'new'"
                puts "or to leave the game now, type 'quit', then type 'quit' again at the prompt."
            when "new"
                player.delete
                puts "You have deleted this player!"
                puts "You can now create a new player name"
                self.create_new_player
                self.info
                break
            else
                puts "Oops, I don't understand, try again."
            end
        end
    end




    # A User can play the game
    def enter_game
        puts "You have entered the cave text...etc"
        puts "interior cave text"
        puts "  "
        puts "You see a passage and a tunnel"
        puts "What would you like to do?"
        reply = gets.chomp
        if reply.downcase == "passage"
            puts "you enter the passage"
        elsif
            reply.downcase == "tunnel"
            puts "you enter the tunnel"
        else
            puts "sorry, I didn't understand"
            puts "please type 'passage' or 'tunnel' to continue the game"
            puts "or type 'exit' to quit the game"
            info
            #need to create loop error message
        end
    end

    # A User can have many items in their inventory,
    #   gets or takes item will add it to inventory
        #   and return a message saying "you have added <item> to inventory"
        #   and also "when you use this <item>, it will update your health by <value>
        #   and your attack points by <value>. This item can be used only once.
        #   After that it will no longer be in your inventory"

    # A User can view a list of their inventory items

    # A User can use an item from inventory, which will
    #   update player attributes, by adding health and strength value from the item, 
    #   and also, will then delete the item from inventory

    def end_game
        system "clear"
        puts "Thank you for playing!"
        puts "Come again soon!"
    end

    # def my_method; 
    #     loop do; 
    #         next = gets.chomp; 
    #         return nil 
    #         if next == "close"; <do something>; end

end
