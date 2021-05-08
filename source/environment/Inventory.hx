package environment;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;

class Inventory extends FlxSprite
{
    public var beenFound:Bool = false;
    public var selection:Int;
    var items:Array<String> = ["Gun", "Body", "Door", "Book", "Report"];
    var found:Array<Bool> = [false,false,false,false,false];
    public var display:String;
    

    public function new()
        {
            super(540, 0);
            makeGraphic(200, 30, FlxColor.BLACK);
        }

    override public function update(elapsed:Float):Void
        {
            //check if inventory is being cycled
            if(FlxG.keys.justPressed.C && beenFound)
                cycleUp();
            if(FlxG.keys.justPressed.X && beenFound)
                cycleDown();
        }

    public function cycleUp()
    {
        if(beenFound == true)
        {
            selection = (selection + 1) % 5;
            while(found[selection] != true)
            {
                selection = (selection + 1) % 5;
            }
        }
        display = items[selection];
    }

    public function cycleDown()
    {
        if(beenFound == true)
        {
            selection = (selection - 1);
            if(selection == -1)
            {
                selection = 4;
            }
            while(found[selection] != true)
            {
                selection = (selection - 1);
                {
                    if(selection == -1)
                    {
                        selection = 4;
                    }
                }
            }
        }

        display = items[selection];
    }
    

    public function foundItem(num)
    {
        if(beenFound == false)
        {
            beenFound = true;
            selection = num;
            display = items[selection];
        }

        found[num] = true;
    }
}