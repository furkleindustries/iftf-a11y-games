VAR have_coin = false
VAR have_peach_pit = false
VAR have_lute = false
VAR waiting = false
VAR have_salmon = false


-> start


=== start ===
Ink of Access

+ [Play]->hallway
+ [Acknowledgements]->acknowledgements


=== acknowledgements ===
By furkle.

For the IFTF Accessibility Testathon.

This and other related documents are located at github.com/furkleindustries/iftf-a11y-games.

+ [Back]->start


=== hallway ===
You stand in the hallway of the castle. Ahead of you is the great hall.

{not have_coin:
    There is the smallest glint among the dirt and leaves.
    *  [Look in the dirt and leaves]
        ~ have_coin = true
        You find a weathered coin.
        -> hallway
}

+ [Go inside]->great_hall


=== great_hall ===
The great hall is filled with ancient, stained bricks, and thousands of people eating. The sounds of chewing and conversing, and the smell of countless thousands of pounds of food, remind you of an enormous family dinner.

{not have_peach_pit:     There's a single empty place as far as you can see, with a full meal at its place. Maybe the last free seat in the entire hall.}

* [Sit down]-> great_hall_sitting
+ [Go to the hallway]->hallway
+ [Go to the ballroom]->ballroom
+ [Go to the kitchen]->kitchen


=== great_hall_sitting ===
You sit down at the table, laden with delicious food. What to eat?
* [A juicy turkey,]
    A pile of gnawed bones,
- * ->
    * [a plate of potatoes,]
        an empty plate,
    - * a luscious, fleshy peach for dessert,
        * * [and a gnarled peach pit, which seems like it would make a nice souvenir.]
            ~ have_peach_pit = true
            and a gnarled peach pit, which you slip into your pocket.
        -> great_hall


=== ballroom ===
{not waiting: There are hundreds of couples dancing the night away in fanciful clothing.}

The current song is: 
{&Medieval Mambo|Castle Calypso}
~ waiting = false

{not have_lute: There's a dope-looking miniature lute in the corner. No one's currently playing it, which obviously means no one will ever miss it.}

{not waiting: You don't see anyone without a partner, so it's probably best to go back to the great hall.}

+ [Wait and listen]
    ~ waiting = true
    -> ballroom
* [Take the lute]
    ~ have_lute = true
    You put the lute in your pocket.
    -> ballroom
+ [Go back to the great hall]-> great_hall


=== kitchen ===
Lots of potatoes boiling on the stove! Smells delicious.

{not have_salmon: There is also an enormous red salmon sitting on a counter, unwatched by any of the busy cooks.}

There is a door in the corner leading down to the catacombs, but you should explore all the other rooms before going down there. Who knows, maybe you might need something, or several somethings?

* [Take salmon]
    ~ have_salmon = true
    You grab the salmon. Hopefully no one will notice three feet of fish sticking out of your back pocket.
    -> kitchen
+ [Go back to the great hall]-> great_hall
+ [Descend into the catacombs]-> catacombs


=== catacombs ===
You descend into the catacombs. You see a single pathway ahead of you. The pathway is barely lit, presumably by a torch somewhere beyond the bend.

+ [Go forward into the flickering quarter-light]-> catacombs_2
+ [Go back to the kitchen]-> kitchen
    
    
=== catacombs_2 ===
You walk for what feels like five or ten minutes, dipping in and out of oil-fragrant oases of torchlight. Finally you come to an exit, in which there is a ring of torches and a lamp in their exact center.

+ [Rub the lamp]-> rub_lamp
+ [Run all the way back upstairs and eat mutton or something]-> kitchen
    
    
=== rub_lamp ===
You reach down and pick up the lamp, rubbing it as you would a feisty kitten. Almost immediately, a thick cloud of mist erupts, and you hear a deafening voice inside your head:

"Did you bring the items to enact the ritual, mortal?"

~ temp have_all_items = have_coin and have_peach_pit and have_lute and have_salmon

* Uhh. What ritual?
    "The ritual of accessibility, you fool! To cast a spell across the whole of interactive fiction and make it accessible  regardless of ability! I need four items for the ritual: a coin, the leavings of a fruit, a stringed instrument, and something that has breathed water."
    -> rub_lamp
* {have_all_items} [Yeah, I got the stuff]->got_stuff
* {not have_all_items} [No, I don't have all that garbage yet]-> kitchen


=== got_stuff ===
You empty your pockets and present the contents to the cloud. After a second, you hear the djinn speak:

"Good! Now watch my science!"

The cloud expands until it fills the entire room, reaching into your clothes, into your lungs, through grout and brick. You can feel it coursing everywhere, through all of creation. And, though you don't know exactly how, you can feel the world got a little more accessible today.


-> DONE
