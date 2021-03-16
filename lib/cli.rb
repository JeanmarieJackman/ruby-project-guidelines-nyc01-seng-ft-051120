
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


    def load_art(filename, color_me)
        fg = nil
        bg = nil
        file = File.open("./lib/resources/" + filename)
        file.readlines.map.with_index do |line, i|
            # check for a key in color_me hash equal to the current index
            if color_me.has_key? i+1
                # if key exists, then set fg and bg to values at hash key
                fg = color_me[i+1][:fg]
                bg = color_me[i+1][:bg]
            end
            
            puts line.chomp.colorize(fg).colorize( :background => bg)
        end
    end


   




    def greeting
        # pid = fork{ exec 'afplay', "/Users/jeanmariejackman/Development/code/Mod1/project/ruby-project-guidelines-nyc01-seng-ft-051120/lib/POL-reach-the-sky-short.wav" }
        
        
        self.load_art("greeting_art.txt", ::AsciiColors::GREETING_COLORS )
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

    def player_id
        player_id = Player.last.id
    end
        
    def info
        sleep(0.25)
        puts "    "
                # future todo: puts "You can say 'create' to create new player"
                future todo: puts "You can say 'log in' to enter your player name and start a new game"
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

    def add_lantern_to_inventory
        inventory = Inventory.new
        inventory.item_id = 39
        inventory.player_id = Player.last.id
        inventory.save
        puts "You have added a lantern to your inventory"
    end

    def add_health_potion_to_inventory
        inventory = Inventory.new
        inventory.item_id = 40
        inventory.player_id = Player.last.id
        inventory.save
        puts "You have added a health potion to your inventory"
    end
    
    def add_strength_potion_to_inventory
        inventory = Inventory.new
        inventory.item_id = 41
        inventory.player_id = Player.last.id
        inventory.save
        puts "You have added a strength potion to your inventory"
    end

    def add_thermal_pod_to_inventory
        inventory = Inventory.new
        inventory.item_id = 42
        inventory.player_id = Player.last.id
        inventory.save
        puts "You have added a thermal pood to your inventory"
    end

    # A User can view a list of their inventory items
    #       will return an array of hashes?
    #       []

    # def view_inventory
    # end
    
    # A User can inspect an item
    #   which returns a message saying the health and strength points
    #   and also "when you use this <item>, it will update your health by <value>
    #   and your attack points by <value>. This item can be used only once.
    #   After that it will no longer be in your inventory"

    # def inspect_item
    # end

    # A User can use an item from inventory, which will
    #   update player attributes, by adding health and strength value from the item, 
    #   and also, will then delete the item from inventory

    # def use_lantern
    #     #item = Inventory.find_by ???
    #     inventory.item_id = 39
    #     #item.delete
    #     #inventory.update? or inventory.save?
    #     puts "You can see! There is something glinting in the darkness"
    #     puts "It looks like a green vial of health potion!"
    # end

    # def use_health_potion
    #     #item = Inventory.find_by ???
    #     inventory.item_id = 40
    #     #item.delete
    #     #player update health +20
    #     #inventory.update? or inventory.save?
    #     puts "You have consumed the potion and received +20 health"
    # end
    
    # def use_strength_potion
    #     #item = Inventory.find_by ???
    #     inventory.item_id = 41
    #     #item.delete
    #     #player update strength +20
    #     #inventory.update? or inventory.save?
    #     puts "You have consumed the potion and received +20 attack points"
    # end

    # def players_inventory
    #     Inventory.all.select do |inventory|
    #         inventory.player == self
    #         inventory
    #     end
    # end

    # def id
    #     id = player.id
    # end

    # def players_inventory
    #     players_inventory = Inventory.all.where(id: id)
    #     players_inventory
    #     end
    # end

    # def players_inventory
    #     player = Player.last
    #     id = player.id
    # end

    def throw_thermal_pod
        #item = Inventory.find_by
        # inventory.item_id = 42
        #player update health -20
    #     item = Inventory.find_by
        
    # if
        #oif item in inventory = true 
        player = Player.last
        player.update(health: 0, attack_power: 60)
        player.save
        puts "The Thermal Pod melts the wizard. His shrieks of pain shake the cave. You win!"
    # else
    #     #if item in inventory = false
    #     puts "You are fozen..."
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
            puts "Which way do you want to go? (W/E)"
            input = gets.chomp

            break if input == "quit" || input == "exit"

            case input
            
            when 'W'
                puts "You crawl into the tunnel. Nasty cobwebs above you, and your hands feel the'"
                puts "slimy, cold, roughness of the cavern floor. LOOK. You see a LANTERN. "
                puts "Take lantern? or keep moving...somethings crawling on you!"
                puts "Type 'take' to grab that lantern, or just go South or East"
                puts "using the command prompt below:"

                until input == 'E'
                    sleep(0.01)
                    puts "   "
                    sleep(0.01)
                    puts "What do you want to do? (take/S/E)"
                    input = gets.chomp
        
                    break if input == "quit" || input == "exit"

                    case input
                    when 'take' 
                        puts "You take the lantern, and add it to your inventory. Thinking, this"
                        puts "could be useful if it keeps getting darker! Looking around, you see"
                        puts "there is nothing else here. Ahead of you, there seems to be a very"
                        puts "dark pit room. No choice now! At least you'll be out of this tunnel,"
                        puts "and up on your feet again, soon! You head South into the pit room."
                        add_lantern_to_inventory
                        next
                    when 'S'
                        puts "So, this is a trade-off, to say the least! You can stand up now in this'"
                        puts "pit room, but you cannot see your hands in front of your face!! Did"
                        puts "you take that Lantern?  Good thing you did!! Now we can see!!"
                        puts "LOOK! You see something glimmering"
                        puts "You see a glass vial, glowing green in the dank, darkness of the "
                        sleep(0.01)
                        puts "pit. It seems to contain a POTION of some sort. AHA!! It’s a green potion "
                        sleep(0.01)
                        puts "of life, this will increase your Health if used just before battle!!  "
                        sleep(0.01)
                        puts "(get)  will add this to your INVENTORY."
                        sleep(0.01)
                        puts "   "
                        sleep(0.01)
                        i = gets.chomp
                        if i == "get"
    
                        puts
                        add_health_potion_to_inventory
                        break
                        end
                    end
                end
            when 'E' 
                puts "You are standing in the cavern of the Evil Wizard. All around you"
                sleep(0.01)
                puts "are the carcasses of slain ice dwarves. "
                sleep(0.01)
                puts "When the wizard appears, MELT WIZARD. How do you want to"
                sleep(0.01)
                puts "  "
                sleep(0.25)
                puts "  "
                sleep(0.25)
                puts "                               XX                                   ".colorize(:white).colorize( :background => :black)
                sleep(0.25)
                puts "                                 XX                                 ".colorize(:white).colorize( :background => :black)
                sleep(0.25)
                puts "                               _ XX                                 ".colorize(:white).colorize( :background => :black)
                sleep(0.25)
                puts "                            .' . XX '.                              ".colorize(:white).colorize( :background => :black)
                sleep(0.25)
                puts "                           '_ '_XX_'  `_                            ".colorize(:white).colorize( :background => :black)
                sleep(0.25)
                puts "                           .  . XX  .  .                            ".colorize(:white).colorize( :background => :black)
                sleep(0.25)
                puts "                          .  . XX  .  .                             ".colorize(:white).colorize( :background => :black)
                sleep(0.25)
                puts "                         .==. ` XX' .'                              ".colorize(:ight_blue).colorize( :background => :black)
                sleep(0.25)
                puts "                  .Y|   (|bd|)   X,                                 ".colorize(:ight_blue).colorize( :background => :black)
                sleep(0.25)
                puts "                  Y_'`._(|__|)_.'`.;                                ".colorize(:ight_blue).colorize( :background => :black)
                sleep(0.25)
                puts "                    `.__      __,' XX                               ".colorize(:ight_blue).colorize( :background => :black)
                sleep(0.25)
                puts "                        |    |      XX                              ".colorize(:ight_blue).colorize( :background => :black)
                sleep(0.25)
                puts "                        |    |       `                              ".colorize(:ight_blue).colorize( :background => :black)
                sleep(0.25)
                puts "                        |    |                                      ".colorize(:blue).colorize( :background => :black)
                sleep(0.25)
                puts "                        |    |                                      ".colorize(:blue).colorize( :background => :black)
                sleep(0.25)
                puts "                        |____|                                      ".colorize(:blue).colorize( :background => :black)
                sleep(0.25)
                puts "                       =='  '==                                     ".colorize(:blue).colorize( :background => :black)
                puts "  "
                sleep(0.25)
                puts "  "
                sleep(0.25)
                puts "melt the wizard? (throw thermal pod)"
                sleep(0.01)
                puts "   "
                sleep(0.01)
                
                input = gets.chomp
                if input== "throw thermal pod"
                    throw_thermal_pod
                    puts "thank you for playing!!"
                    puts "type 'quit' to exit"
                end
                break
            end
        end
    end




    


end

