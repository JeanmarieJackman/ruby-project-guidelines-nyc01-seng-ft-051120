class CLI

    def run
        system "clear"
        self.greeting 
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
        pid = fork{ exec 'afplay', "/Users/jeanmariejackman/Development/code/Mod1/project/ruby-project-guidelines-nyc01-seng-ft-051120/lib/POL-reach-the-sky-short.wav" }
        system "clear"
        puts ""                                                                                                                     
        puts "     _____                                    __   _   _            _____          __          ___                  _ ".colorize(:light_blue)
        puts "    / ____|                                  / _| | | | |          |_   _|         X X        / (_)                | |".colorize(:light_blue)
        sleep(0.25)
        puts "   | |     __ ___   _____ _ __ _ __     ___ | |_  | |_| |__   ___    | |  ___ ___   X X  /X  / / _ ______ _ _ __ __| |".colorize(:light_blue)
        sleep(0.25)
        puts "   | |    / _` X X / / _ X '__| '_ X   / _ X|  _| | __| '_ X / _ X   | | / __/ _ X   X X/  X/ / | |_  / _` | '__/ _` |".colorize(:light_blue)
        sleep(0.25)
        puts "   | |___| (_| |X V /  __/ |  | | | | | (_) | |   | |_| | | |  __/  _| || (_|  __/    X  /X  /  | |/ / (_| | | | (_| |".colorize(:light_blue)
        sleep(0.25)
        puts "    X_____X__,_| X_/ X___|_|  |_| |_|  X___/|_|    X__|_| |_|X___| |_____X___X___|     X/  X/   |_/___X__,_|_|  X__,_|".colorize(:light_blue)
        puts " "
        puts " "
        puts " "
        puts " "
        puts "                                            /'X                                                                        ".colorize(:white).colorize( :background => :black)
        sleep(0.25)
        puts "                                           /   X              /'X       _                                              ".colorize(:white).colorize( :background => :black)
        sleep(0.25)
        puts "                                      /'.,/     X_         .,'   X     / X_                                            ".colorize(:white).colorize( :background => :black)
        sleep(0.25)
        puts "                                     /            X      _/       X_  /    X     _                                     ".colorize(:light_blue).colorize( :background => :black)
        sleep(0.25)
        puts "                            X__,.   /              X    /           X/.,   _|  _/ X                                    ".colorize(:light_blue).colorize( :background => :black)
        sleep(0.25)
        puts "                           /     X_/                X  /',.,''X      X_ X_/  X/    X                                   ".colorize(:light_blue).colorize( :background => :black)
        sleep(0.25)
        puts "                           |                      _  X/   /    ',../',.X    _/      X                                  ".colorize(:light_blue).colorize( :background => :black)
        sleep(0.25)
        puts "                          /         /           _XmX  X  /    |         X  /.,/'X   _X                                 ".colorize(:light_cyan).colorize( :background => :black)
        sleep(0.25)
        puts "                         /        _/           XMMmmX  X_     |          X/      X_/  X                                ".colorize(:light_cyan).colorize( :background => :black)
        sleep(0.25)
        puts "                        /        /      X     XMMMMmmX   X__   X          X_       X   X_                              ".colorize(:light_cyan).colorize( :background => :black)
        sleep(0.25)
        puts "                       /        /        X   XMMMMMMmX      X   X           X       X    X                             ".colorize(:cyan).colorize( :background => :black)
        sleep(0.25)
        puts "                     _/        /          X  XMMMMMMmmX      X___            X_      X_   X                            ".colorize(:cyan).colorize( :background => :black)
        sleep(0.25)
        puts "                    /         /            XXMMMMMMMMmmX____.'  /X_            X       X   X_                          ".colorize(:cyan).colorize( :background => :black)
        sleep(0.25)
        puts "   ________________/_________/             /'.,___________...,,'   X            X   X        X________________________ ".colorize(:cyan).colorize( :background => :black)
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
        puts "you can say 'quit' to exit the game early."
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

            break if input == "quit" || input == "exit"

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

    # A User can have many items in their inventory,
#   gets or takes item will add it to inventory
    #   and return a message saying "you have added <item> to inventory"
    #   and also "when you use this <item>, it will update your health by <value>
    #   and your attack points by <value>. This item can be used only once.
    #   After that it will no longer be in your inventory"
   

    def add_lantern_to_inventory
        inventory = Inventory.new
        inventory.item_id = 01
        inventory.save
        puts "You have added a lantern to your inventory"
        end

    # A User can play the game

    def enter_game
        puts "You have entered the cave. Dim light filters in from outdoors."
        sleep(0.01)
        puts "You think to yourself, 'hmmmmm... should I turn back?' Mustering"
        sleep(0.01)
        puts "your courage, you decide to pursue the quest. It is damp. The walls"
        sleep(0.01)
        puts "glisten with some sort of...moisture. And, a feculant smell permeates"
        sleep(0.01)
        puts "the still, dead air.  You look around, there is a passage to the south"
        sleep(0.01)
        puts "and a tunnel to the west. The passage is wider, and looks comparatively"
        sleep(0.01)
        puts "more well-trodden. The tunnel is darker, narrower, and more foreboding."
        puts "  "
        sleep(0.01)
        puts "  "
        sleep(0.25)
        while true
            puts "Which way do you want to go? (S/W)"
            input = gets.chomp

            break if input == "quit" || input == "exit"

            case input
            
            when 'W'
                puts "You crawl into the tunnel. Nasty cobwebs above you, and your hands feel the'"
                puts "slimy, cold, roughness of the cavern floor. LOOK. You see a LANTERN. "

                loop do
                    puts "What do you want to do? "
                    puts "Take lantern? or keep moving...somethings crawling on you! (take/S)"
                    input = gets.chomp
        
                    break if input == "quit" || input == "exit"

                    case input
                    when 'take' 
###need method to add item to inventory here!    
                        puts "You take the lantern, and add it to your inventory. Thinking, this"
                        puts "could be useful if it keeps getting darker! Looking around, you see"
                        puts "there is nothing else here. Ahead of you, there seems to be a very"
                        puts "dark pit room. No choice now! At least you'll be out of this tunnel,"
                        puts "and up on your feet again, soon! You head South into the pit room."
                        self.add_lantern_to_inventory
                        next
                    when 'S'
                        puts "So, this is a trade-off, to say the least! You can stand up now in this'"
                        puts "pit room, but you cannot see your hands in front of your face!! Did"
                        puts "you take that Lantern?"
                        puts "next....passageway to the East***"
                        puts "You find yourself in the passageway. LOOK! You see something glimmering"
                        puts "....."
                        puts
                        break
                    end
                end
            when 'S' 
                puts "You find yourself in the passageway. LOOK! You see something glimmering"
                puts "....."
                puts
                break
            end
        end
    end




    # A User can view a list of their inventory items

    # A User can use an item from inventory, which will
    #   update player attributes, by adding health and strength value from the item, 
    #   and also, will then delete the item from inventory


end
