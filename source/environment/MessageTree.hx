package environment;

import flixel.FlxObject;

class MessageTree extends FlxObject
{
    //"Gun", "Body", "Door", "Book", "Report"
    var found:Array<Bool> = [false,false,false,false,false];
    public var display:String;
    var reportBody:String = "Definitly a necrosis bullet.  Never a pretty sight and a even worse smell.  Doesn't look like he put up a fight.  Must of been taken by suprise.";
    var nothing:String = "I should get back to work.";
    

    public function new()
    {
        super();
    }

    override public function update(elapsed:Float):Void
    {
        //
    }

    public function checkDialoge(num, selection)
    {
        //
        if(num == 2 && selection == 4)
        {
            return reportBody;
        }
        else
        {
            return nothing;
        }
    }
}