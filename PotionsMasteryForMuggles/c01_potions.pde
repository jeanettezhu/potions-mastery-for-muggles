/****************************************************************************************************************************************
 * COMPONENT: Potions
 ****************************************************************************************************************************************/

/**************************
 * GUIDE
 * [i][0] = Name
 * [i][1] = Image Link
 * [i][2] = Description
 * [i][3] = Recipe
 **************************/
 
String[][] POTIONS = { 
  
  { "AGEING POTION", 
    /* Image Link */ "images/potions/ageing-potion.png", 
    /* Description */ "A potion that temporarily causes the drinker to age."
      + "\n" + "Increasing the amount you drink increases the amount"
      + "\n" + "you age.", 
    /* Recipe */ "ASK GEORGE WEASLEY." },
    
  { "ANTIDOTE TO COMMON POISONS", 
    /* Image Link */ "images/potions/antidote-to-common-poisons.png", 
    /* Description */ "A potion that counteracts ordinary poisons, such as"
      + "\n" + "creature bites and stings.", 
    /* Recipe */ "1     " + "BEZOAR"
      + "\n" + "2    " + "STANDARD INGREDIENTS" 
      + "\n" + "1     " + "UNICORN HORN" 
      + "\n" + "2    " + "MISTLETOE BERRIES" },
    /* Formula = { "BEZOAR", "STANDARD INGREDIENT", "STANDARD INGREDIENT", "UNICORN HORN", 
    "MISTLETOE BERRY", "MISTLETOE BERRY" } */
      
  { "BEAUTIFICATION POTION",
    /* Image Link */ "images/potions/beautification-potion.png", 
    /* Description */ "A potion that enhances the drinker's physical"
      + "\n" + "appearance, making them appear attractive even if"
      + "\n" + "they originally were not.",
    /* Recipe */ "6    " + "FAIRY WINGS"
      + "\n" + "1     " + "MORNING DEW" 
      + "\n" + "7    " + "ROSE PETALS" 
      + "\n" + "1     " + "LADY'S MANTLE"
      + "\n" + "1     " + "UNICORN TAIL HAIR"
      + "\n" + "1     " + "GINGER ROOT" },
    /* Formula = { "FAIRY WING", "FAIRY WING", "FAIRY WING", "FAIRY WING", "FAIRY WING", 
    "FAIRY WING", "MORNING DEW", "ROSE PETAL", "ROSE PETAL", "ROSE PETAL", "ROSE PETAL", 
    "ROSE PETAL", "ROSE PETAL", "ROSE PETAL", "LADY'S MANTLE", "UNICORN TAIL HAIR", 
    "GINGER ROOT" } */
    
  { "CURE FOR BOILS", 
    /* Image Link */ "images/potions/cure-for-boils.png", 
    /* Description */ "A potion that cures boils, pustules, hives, and many"
      + "\n" + "other scrofulous conditions. Brew with care, however,"
      + "\n" + "because incorrect preparation of this potion has been"
      + "\n" + "known to cause boils, rather than cure them.",
    /* Recipe */ "6    " + "SNAKE FANGS"
      + "\n" + "4    " + "HORNED SLUGS" 
      + "\n" + "2    " + "PORCUPINE QUILLS" },
    /* Formula = { "SNAKE FANG", "SNAKE FANG", "SNAKE FANG", "SNAKE FANG", "SNAKE FANG", 
    "SNAKE FANG", "HORNED SLUG", "HORNED SLUG", "HORNED SLUG", "HORNED SLUG", 
    "PORCUPINE QUILL", "PORCUPINE QUILL" } */
      
  { "DOXYCIDE", 
    /* Image Link */ "images/potions/doxycide.png", 
    /* Description */ "A foul-smelling pesticide for doxies, annoying biting"
      + "\n" + "fairies that can infest houses. When sprayed, the doxy"
      + "\n" + "is temporarily paralyzed, allowing the user to remove it"
      + "\n" + "without being bitten.",
    /* Recipe */ "1     " + "BUNDIMUN OOZE"
      + "\n" + "3    " + "STREELER SHELLS" 
      + "\n" + "1     " + "DRAGON LIVER" 
      + "\n" + "1     " + "HEMLOCK ESSENCE"
      + "\n" + "1     " + "TINCTURE OF TORMENTIL" },
    /* Formula = { "BUNDIMUN OOZE", "STREELER SHELL", "STREELER SHELL", "STREELER SHELL", 
    "DRAGON LIVER", "HEMLOCK ESSENCE", "TINCTURE OF TORMENTIL" } */
    
  { "DRAGON DUNG FERTILIZER", 
    /* Image Link */ "images/potions/dragon-dung-fertilizer.png", 
    /* Description */ "A solution that promotes plant growth. It is known to"
      + "\n" + "be Professor Sprout's fertilizer of choice.",
    /* Recipe */ "1     " + "SLOTH BRAIN"
      + "\n" + "7    " + "DRAGON DUNGS" 
      + "\n" + "1     " + "STEWED MANDRAKE" 
      + "\n" + "2    " + "RAT SPLEENS" 
      + "\n" + "4    " + "DRAGONFLY THORAXES" },
    /* Formula = { "SLOTH BRAIN", "DRAGON DUNG", "DRAGON DUNG", "DRAGON DUNG", 
    "DRAGON DUNG", "DRAGON DUNG", "DRAGON DUNG", "DRAGON DUNG", "STEWED MANDRAKE", 
    "RAT SPLEEN", "RAT SPLEEN", "DRAGONFLY THORAX", "DRAGONFLY THORAX", 
    "DRAGONFLY THORAX", "DRAGONFLY THORAX" } */
    
  { "DRAUGHT OF LIVING DEATH", 
    /* Image Link */ "images/potions/draught-of-living-death.png", 
    /* Description */ "An extremely powerful sleeping draught that sends the"
      + "\n" + "drinker into a death-like slumber.",
    /* Recipe */ "1     " + "INFUSION OF WORMWOOD"
      + "\n" + "1     " + "ASPHODEL" 
      + "\n" + "1     " + "SLOTH BRAIN" 
      + "\n" + "1     " + "SOPOPHOROUS BEAN" },
    /* Formula = { "INFUSION OF WORMWOOD", "ASPHODEL", "SLOTH BRAIN", 
    "SOPOPHOROUS BEAN" } */
    
  { "DRAUGHT OF PEACE", 
    /* Image Link */ "images/potions/draught-of-peace.png", 
    /* Description */ "A potion which relieves anxiety and agitation."
      + "\n" + "Ironically, it is an extremely difficult potion to make,"
      + "\n" + "and incorrect concoctions can put the drinker into a"
      + "\n" + "deep - and possibly irreversible - sleep.",
    /* Recipe */ "1     " + "POWDERED MOONSTONE"
      + "\n" + "1     " + "SYRUP OF HELLEBORE" 
      + "\n" + "2    " + "PORCUPINE QUILLS" 
      + "\n" + "1     " + "UNICORN HORN" 
      + "\n" + "1     " + "POWDERED MOONSTONE"
      + "\n" + "1     " + "PORCUPINE QUILL" },
    /* Formula = { "POWDERED MOONSTONE", "SYRUP OF HELLEBORE", "PORCUPINE QUILL", 
    "PORCUPINE QUILL", "UNICORN HORN", "POWDERED MOONSTONE", "PORCUPINE QUILL" } */
    
  { "ELIXIR OF LIFE", 
    /* Image Link */ "images/potions/elixir-of-life.png", 
    /* Description */ "A powerful potion that grants the drinker an"
      + "\n" + "indefinitely extended life when regularly consumed."
      + "\n" + "It is produced using the Philosopher's Stone.",
    /* Recipe */ "ASK NICOLAS FLAMEL." },
      
  { "ELIXIR TO INDUCE EUPHORIA", 
    /* Image Link */ "images/potions/elixir-to-induce-euphoria.png", 
    /* Description */ "A potion that induces a sense of inexplicable,"
      + "\n" + "irrational happiness upon the drinker. Possible side effects"
      + "\n" + "include excessive singing and nose-tweaking.",
    /* Recipe */ "1     " + "SHRIVELFIG"
      + "\n" + "3    " + "PORCUPINE QUILLS" 
      + "\n" + "1     " + "PEPPERMINT" 
      + "\n" + "2    " + "SOPOPHOROUS BEANS" 
      + "\n" + "1     " + "INFUSION OF WORMWOOD" },
    /* Formula = { "SHRIVELFIG", "PORCUPINE QUILL", "PORCUPINE QUILL", "PORCUPINE QUILL", 
    "PEPPERMINT", "SOPOPHOROUS BEAN", "SOPOPHOROUS BEAN", "INFUSION OF WORMWOOD" } */
      
  { "EMERALD POTION", 
    /* Image Link */ "images/potions/emerald-potion.png", 
    /* Description */ "The infamous \"Drink of Despair\" which induces fear,"
      + "\n" + "delirium, intense pain, and extreme thirst in the drinker."
      + "\n" + "According to Dumbledore, it can only be drained away"
      + "\n" + "by drinking.",
    /* Recipe */ "ASK HE-WHO-MUST-NOT-"
      + "\n" + "BE-NAMED." },
      
  { "FELIX FELICIS", 
    /* Image Link */ "images/potions/felix-felicis.png", 
    /* Description */ "A potion that increases the luck of the drinker for a"
      + "\n" + "limited period of time, during which everything they"
      + "\n" + "attempt will likely be successful. However, it must be"
      + "\n" + "used sparingly, as this so-called \"liquid luck\" is highly"
      + "\n" + "toxic and causes recklessness if taken in excess.",
    /* Recipe */ "1     " + "ASHWINDER EGG"
      + "\n" + "1     " + "SQUILL BULB" 
      + "\n" + "1     " + "MURTLAP TENTACLE" 
      + "\n" + "1     " + "TINCTURE OF THYME" 
      + "\n" + "1     " + "OCCAMY EGGSHELL"
      + "\n" + "1     " + "FLUXWEED" },
    /* Formula = { "ASHWINDER EGG", "SQUILL BULB", "MURTLAP TENTACLE", "TINCTURE OF THYME", 
    "OCCAMY EGGSHELL", "FLUXWEED" } */
      
  { "FIRE PROTECTION POTION", 
    /* Image Link */ "images/potions/fire-protection-potion.png", 
    /* Description */ "A potion that protects the drinker from fire and allows"
      + "\n" + "them to move through flames unscathed. It induces a"
      + "\n" + "sensation of ice and frigidity.",
    /* Recipe */ "3    " + "BURSTING MUSHROOMS"
      + "\n" + "1     " + "SALAMANDER BLOOD" 
      + "\n" + "1     " + "WARTCAP POWDER" },
    /* Formula = { "BURSTING MUSHROOM", "BURSTING MUSHROOM", "BURSTING MUSHROOM", 
    "SALAMANDER BLOOD", "WARTCAP POWDER" } */
      
  { "FLESH-EATING SLUG REPELLENT", 
    /* Image Link */ "images/potions/flesh-eating-slug-repellent.png", 
    /* Description */ "A pesticide used to get rid of flesh-eating slugs.",
    /* Recipe */ "TRADEMARKED."
      + "\n" + "PURCHASE AT KNOCKTURN" 
      + "\n" + "ALLEY." },
    
  { "FORGETFULNESS POTION", 
    /* Image Link */ "images/potions/forgetfulness-potion.png", 
    /* Description */ "A potion that causes an unknown degree of memory"
      + "\n" + "loss to the drinker.",
    /* Recipe */ "2    " + "LETHE RIVER WATERS"
      + "\n" + "2    " + "VALERIAN SPRIGS" 
      + "\n" + "2    " + "STANDARD INGREDIENTS" 
      + "\n" + "4    " + "MISTLETOE BERRIES" },
    /* Formula = { "LETHE RIVER WATER", "LETHE RIVER WATER", "VALERIAN SPRIG", 
    "VALERIAN SPRIG", "STANDARD INGREDIENT", "STANDARD INGREDIENT", "MISTLETOE BERRIES", 
    "MISTLETOE BERRIES", "MISTLETOE BERRIES", "MISTLETOE BERRIES" } */
      
  { "GIRDING POTION", 
    /* Image Link */ "images/potions/girding-potion.png", 
    /* Description */ "A foul-smelling potion that gives the drinker extra"
      + "\n" + "endurance.",
    /* Recipe */ "2    " + "FAIRY WINGS"
      + "\n" + "1     " + "DOXY EGG" 
      + "\n" + "5    " + "DRAGONFLY THORAXES" 
      + "\n" + "3    " + "DOXY EGGS" 
      + "\n" + "3    " + "DRAGONFLY THORAXES"
      + "\n" + "3    " + "FLYING SEAHORSES" },
    /* Formula = { "FAIRY WING", "FAIRY WING", "DOXY EGG", "DRAGONFLY THORAX", 
    "DRAGONFLY THORAX", "DRAGONFLY THORAX", "DRAGONFLY THORAX", "DRAGONFLY THORAX", 
    "DOXY EGG", "DOXY EGG", "DOXY EGG", "DRAGONFLY THORAX", "DRAGONFLY THORAX", 
    "DRAGONFLY THORAX", "FLYING SEAHORSE", "FLYING SEAHORSE", "FLYING SEAHORSE" } */
      
  { "HERBICIDE POTION", 
    /* Image Link */ "images/potions/herbicide-potion.png", 
    /* Description */ "A potion that kills or damages plants. It has a"
      + "\n" + "disgusting taste and is not meant for human"
      + "\n" + "consumption.",
    /* Recipe */ "4    " + "LIONFISH SPINES"
      + "\n" + "2    " + "STANDARD INGREDIENTS" 
      + "\n" + "2    " + "HORKLUMP JUICES" 
      + "\n" + "2    " + "FLOBBERWORM MUCUS" },
    /* Formula = { "LIONFISH SPINE", "LIONFISH SPINE", "LIONFISH SPINE", "LIONFISH SPINE", 
    "STANDARD INGREDIENT", "STANDARD INGREDIENT", "HORKLUMP JUICE", "HORKLUMP JUICE", 
    "FLOBBERWORM MUCUS", "FLOBBERWORM MUCUS" } */
      
  { "INVIGORATION DRAUGHT", 
    /* Image Link */ "images/potions/invigoration-draught.png", 
    /* Description */ "A potion that boosts the drinker's energy level.",
    /* Recipe */ "JUST LEAVE IT ALONE." },
    
  { "LOVE POTION", 
    /* Image Link */ "images/potions/love-potion.png", 
    /* Description */ "A potion that causes the drinker to become infatuated"
      + "\n" + "with the person who gave him/her the potion. While"
      + "\n" + "the potion can produce powerful attachments, no one"
      + "\n" + "has managed to create a truly unbreakable, eternal"
      + "\n" + "bond of love.",
    /* Recipe */ "6    " + "ROSE THORNS"
      + "\n" + "2    " + "ASHWINDER EGGS" 
      + "\n" + "1     " + "PEPPERMINT" 
      + "\n" + "1     " + "POWDERED MOONSTONE" },
    /* Formula = { "ROSE THORN", "ROSE THORN", "ROSE THORN", "ROSE THORN", "ROSE THORN", 
    "ROSE THORN", "ASHWINDER EGG", "ASHWINDER EGG", "PEPPERMINT", "POWDERED MOONSTONE" } */
      
  { "OCULUS POTION", 
    /* Image Link */ "images/potions/oculus-potion.png", 
    /* Description */ "A healing potion that restores the drinker's sight and"
      + "\n" + "counteracts the effects of the Conjunctivitis Curse.",
    /* Recipe */ "1     " + "UNICORN HORN"
      + "\n" + "1     " + "STEWED MANDRAKE" 
      + "\n" + "1     " + "UNICORN HORN" 
      + "\n" + "1     " + "INFUSION OF WORMWOOD" 
      + "\n" + "1     " + "STEWED MANDRAKE"
      + "\n" + "1     " + "INFUSION OF WORMWOOD" },
    /* Formula = { "UNICORN HORN", "STEWED MANDRAKE", "UNICORN HORN", 
    "INFUSION OF WORMWOOD", "STEWED MANDRAKE", "INFUSION OF WORMWOOD" } */
      
  { "POLYJUICE POTION", 
    /* Image Link */ "images/potions/polyjuice-potion.png", 
    /* Description */ "A potion that allows the drinker to assume the form"
      + "\n" + "of someone else. It is extremely difficult to brew"
      + "\n" + "correctly.",
    /* Recipe */ "3    " + "FLUXWEEDS"
      + "\n" + "2    " + "KNOTGRASSES" 
      + "\n" + "4    " + "LEECHES" 
      + "\n" + "2    " + "LACEWING FLIES" 
      + "\n" + "3    " + "BOOMSLANG SKINS"
      + "\n" + "1     " + "BICORN HORN"
      + "\n" + "1     " + "LACEWING FLY"
      + "\n" + "1     " + "SLYTHERIN STUDENT'S HAIR" },
    /* Formula = { "FLUXWEED", "FLUXWEED", "FLUXWEED", "KNOTGRASS", "KNOTGRASS", "LEECH", 
    "LEECH", "LEECH", "LEECH", "LACEWING FLY", "LACEWING FLY", "BOOMSLANG SKIN", 
    "BOOMSLANG SKIN", "BOOMSLANG SKIN", "BICORN HORN", "LACEWING FLY", 
    "SLYTHERIN STUDENT'S HAIR" } */
      
  { "POTION FOR DREAMLESS SLEEP", 
    /* Image Link */ "images/potions/potion-for-dreamless-sleep.png", 
    /* Description */ "A medicinal potion that induces drowsiness and, if"
      + "\n" + "done properly, a dreamless sleep in the drinker.",
    /* Recipe */ "ASK MADAM POMFREY." },
      
  { "RAT TONIC", 
    /* Image Link */ "images/potions/rat-tonic.png", 
    /* Description */ "A healing potion for rats.",
    /* Recipe */ "TRADEMARKED."
      + "\n" + "PURCHASE AT DIAGON ALLEY." },
    
  { "SHRINKING SOLUTION", 
    /* Image Link */ "images/potions/shrinking-solution.png", 
    /* Description */ "A potion that causes the drinker to shrink to a younger"
      + "\n" + "form. If prepared incorrectly, it can be poisonous.",
    /* Recipe */ "5    " + "CATERPILLARS"
      + "\n" + "1     " + "SHRIVELFIG" 
      + "\n" + "4    " + "RAT SPLEENS" 
      + "\n" + "3    " + "DAISY ROOTS" 
      + "\n" + "5    " + "LEECHES"
      + "\n" + "1     " + "CATERPILLAR" },
    /* Formula = { "CATERPILLAR", "CATERPILLAR", "CATERPILLAR", "CATERPILLAR", 
    "CATERPILLAR", "SHRIVELFIG", "RAT SPLEEN", "RAT SPLEEN", "RAT SPLEEN", 
    "RAT SPLEEN", "DAISY ROOT", "DAISY ROOT", "DAISY ROOT", "LEECH", "LEECH", "LEECH", 
    "LEECH", "LEECH", "CATERPILLAR" } */ 
      
  { "SKELE-GRO", 
    /* Image Link */ "images/potions/skele-gro.png", 
    /* Description */ "A dreadful-tasting potion that causes vanished or lost"
      + "\n" + "bones to regrow in an extremely slow, painful process.",
    /* Recipe */ "3    " + "PUFFERFISH EYES"
      + "\n" + "1     " + "STANDARD INGREDIENT" 
      + "\n" + "5    " + "SCARAB BEETLE BODIES" },
    /* Formula = { "PUFFERFISH EYE", "PUFFERFISH EYE", "PUFFERFISH EYE", 
    "STANDARD INGREDIENT", "SCARAB BEETLE BODY", "SCARAB BEETLE BODY", 
    "SCARAB BEETLE BODY", "SCARAB BEETLE BODY", "SCARAB BEETLE BODY" } */
      
  { "SLEEPING DRAUGHT", 
    /* Image Link */ "images/potions/sleeping-draught.png", 
    /* Description */ "A potion that causes the drinker to quickly fall into a"
      + "\n" + "deep but temporary sleep.",
    /* Recipe */ "4    " + "LAVENDERS"
      + "\n" + "2    " + "STANDARD INGREDIENTS" 
      + "\n" + "2    " + "FLOBBERWORM MUCUS" 
      + "\n" + "4    " + "STANDARD INGREDIENTS" 
      + "\n" + "4    " + "VALERIAN SPRIGS"},
    /* Formula = { "LAVENDER", "LAVENDER", "LAVENDER", "LAVENDER", "STANDARD INGREDIENT", 
    "STANDARD INGREDIENT", "FLOBBERWORM MUCUS", "FLOBBERWORM MUCUS", "STANDARD INGREDIENT", 
    "STANDARD INGREDIENT", "STANDARD INGREDIENT", "STANDARD INGREDIENT", "VALERIAN SPRIG", 
    "VALERIAN SPRIG", "VALERIAN SPRIG", "VALERIAN SPRIG" } */
      
  { "SWELLING SOLUTION", 
    /* Image Link */ "images/potions/swelling-solution.png", 
    /* Description */ "A potion that causes whatever it touches to swell in"
      + "\n" + "size.",
    /* Recipe */ "2    " + "DRIED NETTLES"
      + "\n" + "3    " + "PUFFERFISH EYES" 
      + "\n" + "1     " + "BAT SPLEEN" },
    /* Formula = { "DRIED NETTLE", "DRIED NETTLE", "PUFFERFISH EYE", "PUFFERFISH EYE", 
    "PUFFERFISH EYE", "BAT SPLEEN" } */
      
  { "VERITASERUM", 
    /* Image Link */ "images/potions/veritaserum.png", 
    /* Description */ "The most powerful truth serum in existence, which"
      + "\n" + "forces its drinker to speak truthfully. It can be resisted"
      + "\n" + "through Occlumency or an antidote.",
    /* Recipe */ "ASK THE MINISTRY OF"
      + "\n" + "MAGIC." },
      
  { "VOLUBILIS POTION", 
    /* Image Link */ "images/potions/volubilis-potion.png", 
    /* Description */ "A potion that alters the drinker's voice. It can also"
      + "\n" + "counteract a Silencing Charm by restoring the drinker's"
      + "\n" + "voice.",
    /* Recipe */ "1     " + "HONEY"
      + "\n" + "4    " + "PEPPERMINTS" 
      + "\n" + "1     " + "STEWED MANDRAKE" 
      + "\n" + "1     " + "SYRUP OF HELLEBORE" },
    /* Formula = { "HONEY", "PEPPERMINT", "PEPPERMINT", "PEPPERMINT", "PEPPERMINT", 
    "STEWED MANDRAKE", "SYRUP OF HELLEBORE" } */
      
  { "WIDEYE POTION", 
    /* Image Link */ "images/potions/wideye-potion.png", 
    /* Description */ "A potion that prevents the drinker from falling asleep."
      + "\n" + "It can also awaken someone from slumber, including"
      + "\n" + "those induced by drugging or concussion.",
    /* Recipe */ "6    " + "SNAKE FANGS"
      + "\n" + "4    " + "STANDARD INGREDIENTS" 
      + "\n" + "6    " + "DRIED BILLYWIG STINGS" 
      + "\n" + "2    " + "WOLFSBANES" },
    /* Formula = { "SNAKE FANG", "SNAKE FANG", "SNAKE FANG", "SNAKE FANG", "SNAKE FANG", 
    "SNAKE FANG", "STANDARD INGREDIENT", "STANDARD INGREDIENT", "STANDARD INGREDIENT", 
    "STANDARD INGREDIENT", "DRIED BILLYWIG STING", "DRIED BILLYWIG STING", 
    "DRIED BILLYWIG STING", "DRIED BILLYWIG STING", "DRIED BILLYWIG STING", 
    "DRIED BILLYWIG STING", "WOLFSBANE", "WOLFSBANE" } */
      
  { "WIGGENWELD POTION", 
    /* Image Link */ "images/potions/wiggenweld-potion.png", 
    /* Description */ "A healing potion that can awaken a person from a"
      + "\n" + "magically-induced sleep, including those affected by"
      + "\n" + "the Draught of Living Death.",
    /* Recipe */ "4    " + "SALAMANDER BLOOD"
      + "\n" + "10   " + "LIONFISH SPINES" 
      + "\n" + "2    " + "FLOBBERWORM MUCUS" 
      + "\n" + "3    " + "HONEY" 
      + "\n" + "1     " + "SALAMANDER BLOOD" },
    /* Formula = { "SALAMANDER BLOOD", "SALAMANDER BLOOD", "SALAMANDER BLOOD", 
    "SALAMANDER BLOOD", "LIONFISH SPINE", "LIONFISH SPINE", "LIONFISH SPINE", 
    "LIONFISH SPINE", "LIONFISH SPINE", "LIONFISH SPINE", "LIONFISH SPINE", 
    "LIONFISH SPINE", "LIONFISH SPINE", "LIONFISH SPINE", "FLOBBERWORM MUCUS", 
    "FLOBBERWORM MUCUS", "HONEY", "HONEY", "HONEY", "SALAMANDER BLOOD" } */
      
  { "WIT-SHARPENING POTION", 
    /* Image Link */ "images/potions/wit-sharpening-potion.png", 
    /* Description */ "A potion that enhances the drinker's clarity of thought"
      + "\n" + "and counteracts the effects of the Confundus Charm.",
    /* Recipe */ "1     " + "GINGER ROOT"
      + "\n" + "1     " + "ARMADILLO BILE" 
      + "\n" + "3    " + "SCARAB BEETLE BODIES" 
      + "\n" + "1     " + "ARMADILLO BILE" 
      + "\n" + "1     " + "GINGER ROOT" }
    /* Formula = { "GINGER ROOT", "ARMADILLO BILE", "SCARAB BEETLE BODY", 
    "SCARAB BEETLE BODY", "SCARAB BEETLE BODY", "ARMADILLO BILE", "GINGER ROOT" } */
      
};

/**************************
 * FORMULAS
 **************************/
 
String[] ANTIDOTE_TO_COMMON_POISONS = { "BEZOAR", "STANDARD INGREDIENT", "STANDARD INGREDIENT", 
  "UNICORN HORN", "MISTLETOE BERRY", "MISTLETOE BERRY" };
  
String[] BEAUTIFICATION_POTION = { "FAIRY WING", "FAIRY WING", "FAIRY WING", "FAIRY WING", 
  "FAIRY WING", "FAIRY WING", "MORNING DEW", "ROSE PETAL", "ROSE PETAL", "ROSE PETAL", 
  "ROSE PETAL", "ROSE PETAL", "ROSE PETAL", "ROSE PETAL", "LADY'S MANTLE", "UNICORN TAIL HAIR", 
  "GINGER ROOT" };

String[] CURE_FOR_BOILS = { "SNAKE FANG", "SNAKE FANG", "SNAKE FANG", "SNAKE FANG", "SNAKE FANG", 
  "SNAKE FANG", "HORNED SLUG", "HORNED SLUG", "HORNED SLUG", "HORNED SLUG", "PORCUPINE QUILL", 
  "PORCUPINE QUILL" };

String[] DOXYCIDE = { "BUNDIMUN OOZE", "STREELER SHELL", "STREELER SHELL", "STREELER SHELL", 
  "DRAGON LIVER", "HEMLOCK ESSENCE", "TINCTURE OF TORMENTIL" };

String[] DRAGON_DUNG_FERTILIZER = { "SLOTH BRAIN", "DRAGON DUNG", "DRAGON DUNG", "DRAGON DUNG", 
  "DRAGON DUNG", "DRAGON DUNG", "DRAGON DUNG", "DRAGON DUNG", "STEWED MANDRAKE", "RAT SPLEEN", 
  "RAT SPLEEN", "DRAGONFLY THORAX", "DRAGONFLY THORAX", 
  "DRAGONFLY THORAX", "DRAGONFLY THORAX" };

String[] DRAUGHT_OF_LIVING_DEATH = { "INFUSION OF WORMWOOD", "ASPHODEL", "SLOTH BRAIN", 
  "SOPOPHOROUS BEAN" };

String[] DRAUGHT_OF_PEACE = { "POWDERED MOONSTONE", "SYRUP OF HELLEBORE", "PORCUPINE QUILL", 
  "PORCUPINE QUILL", "UNICORN HORN", "POWDERED MOONSTONE", "PORCUPINE QUILL" };

String[] ELIXIR_TO_INDUCE_EUPHORIA = { "SHRIVELFIG", "PORCUPINE QUILL", "PORCUPINE QUILL", 
  "PORCUPINE QUILL", "PEPPERMINT", "SOPOPHOROUS BEAN", "SOPOPHOROUS BEAN", 
  "INFUSION OF WORMWOOD" };

String[] FELIX_FELICIS = { "ASHWINDER EGG", "SQUILL BULB", "MURTLAP TENTACLE", 
  "TINCTURE OF THYME", "OCCAMY EGGSHELL", "FLUXWEED" };

String[] FIRE_PROTECTION_POTION = { "BURSTING MUSHROOM", "BURSTING MUSHROOM", "BURSTING MUSHROOM", 
  "SALAMANDER BLOOD", "WARTCAP POWDER" };

String[] FORGETFULNESS_POTION = { "LETHE RIVER WATER", "LETHE RIVER WATER", "VALERIAN SPRIG", 
  "VALERIAN SPRIG", "STANDARD INGREDIENT", "STANDARD INGREDIENT", "MISTLETOE BERRIES", 
  "MISTLETOE BERRIES", "MISTLETOE BERRIES", "MISTLETOE BERRIES" };

String[] GIRDING_POTION = { "FAIRY WING", "FAIRY WING", "DOXY EGG", "DRAGONFLY THORAX", 
  "DRAGONFLY THORAX", "DRAGONFLY THORAX", "DRAGONFLY THORAX", "DRAGONFLY THORAX", 
  "DOXY EGG", "DOXY EGG", "DOXY EGG", "DRAGONFLY THORAX", "DRAGONFLY THORAX", 
  "DRAGONFLY THORAX", "FLYING SEAHORSE", "FLYING SEAHORSE", "FLYING SEAHORSE" };

String[] HERBICIDE_POTION = { "LIONFISH SPINE", "LIONFISH SPINE", "LIONFISH SPINE", 
  "LIONFISH SPINE", "STANDARD INGREDIENT", "STANDARD INGREDIENT", "HORKLUMP JUICE", 
  "HORKLUMP JUICE", "FLOBBERWORM MUCUS", "FLOBBERWORM MUCUS" };

String[] LOVE_POTION = { "ROSE THORN", "ROSE THORN", "ROSE THORN", "ROSE THORN", "ROSE THORN", 
  "ROSE THORN", "ASHWINDER EGG", "ASHWINDER EGG", "PEPPERMINT", "POWDERED MOONSTONE" };

String[] OCULUS_POTION = { "UNICORN HORN", "STEWED MANDRAKE", "UNICORN HORN", 
  "INFUSION OF WORMWOOD", "STEWED MANDRAKE", "INFUSION OF WORMWOOD" };

String[] POLYJUICE_POTION = { "FLUXWEED", "FLUXWEED", "FLUXWEED", "KNOTGRASS", "KNOTGRASS", 
  "LEECH", "LEECH", "LEECH", "LEECH", "LACEWING FLY", "LACEWING FLY", "BOOMSLANG SKIN", 
  "BOOMSLANG SKIN", "BOOMSLANG SKIN", "BICORN HORN", "LACEWING FLY", 
  "SLYTHERIN STUDENT'S HAIR" };

String[] SHRINKING_SOLUTION = { "CATERPILLAR", "CATERPILLAR", "CATERPILLAR", "CATERPILLAR", 
  "CATERPILLAR", "SHRIVELFIG", "RAT SPLEEN", "RAT SPLEEN", "RAT SPLEEN", "RAT SPLEEN", 
  "DAISY ROOT", "DAISY ROOT", "DAISY ROOT", "LEECH", "LEECH", "LEECH", "LEECH", "LEECH", 
  "CATERPILLAR" };

String[] SKELE_GRO = { "PUFFERFISH EYE", "PUFFERFISH EYE", "PUFFERFISH EYE", 
  "STANDARD INGREDIENT", "SCARAB BEETLE BODY", "SCARAB BEETLE BODY", "SCARAB BEETLE BODY", 
  "SCARAB BEETLE BODY", "SCARAB BEETLE BODY" };

String[] SLEEPING_DRAUGHT = { "LAVENDER", "LAVENDER", "LAVENDER", "LAVENDER", 
  "STANDARD INGREDIENT", "STANDARD INGREDIENT", "FLOBBERWORM MUCUS", "FLOBBERWORM MUCUS", 
  "STANDARD INGREDIENT", "STANDARD INGREDIENT", "STANDARD INGREDIENT", "STANDARD INGREDIENT", 
  "VALERIAN SPRIG", "VALERIAN SPRIG", "VALERIAN SPRIG", "VALERIAN SPRIG" };

String[] SWELLING_SOLUTION = { "DRIED NETTLE", "DRIED NETTLE", "PUFFERFISH EYE", 
  "PUFFERFISH EYE", "PUFFERFISH EYE", "BAT SPLEEN" };

String[] VOLUBILIS_POTION = { "HONEY", "PEPPERMINT", "PEPPERMINT", "PEPPERMINT", "PEPPERMINT", 
  "STEWED MANDRAKE", "SYRUP OF HELLEBORE" };

String[] WIDEYE_POTION = { "SNAKE FANG", "SNAKE FANG", "SNAKE FANG", "SNAKE FANG", 
  "SNAKE FANG", "SNAKE FANG", "STANDARD INGREDIENT", "STANDARD INGREDIENT", 
  "STANDARD INGREDIENT", "STANDARD INGREDIENT", "DRIED BILLYWIG STING", 
  "DRIED BILLYWIG STING", "DRIED BILLYWIG STING", "DRIED BILLYWIG STING", 
  "DRIED BILLYWIG STING", "DRIED BILLYWIG STING", "WOLFSBANE", "WOLFSBANE" };

String[] WIGGENWELD_POTION = { "SALAMANDER BLOOD", "SALAMANDER BLOOD", "SALAMANDER BLOOD", 
  "SALAMANDER BLOOD", "LIONFISH SPINE", "LIONFISH SPINE", "LIONFISH SPINE", "LIONFISH SPINE", 
  "LIONFISH SPINE", "LIONFISH SPINE", "LIONFISH SPINE", "LIONFISH SPINE", "LIONFISH SPINE", 
  "LIONFISH SPINE", "FLOBBERWORM MUCUS", "FLOBBERWORM MUCUS", "HONEY", "HONEY", "HONEY", 
  "SALAMANDER BLOOD" };

String[] WIT_SHARPENING_POTION = { "GINGER ROOT", "ARMADILLO BILE", "SCARAB BEETLE BODY", 
  "SCARAB BEETLE BODY", "SCARAB BEETLE BODY", "ARMADILLO BILE", "GINGER ROOT" };

