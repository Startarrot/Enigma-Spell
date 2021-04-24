package environment;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;

class Interactable extends FlxObject
{
    private var ob1:FlxSprite;
    private var arm:FlxSprite;
    public var ob1found:Bool = false;

    public function new(ob1:FlxSprite, arm:FlxSprite)
        {
            super();
            this.ob1 = ob1;
            this.arm = arm;
        }

    // override public function update(elapsed:Float):Void
    //     {
    //         if(FlxG.keys.justPressed.Z)
    //             {
    //                 FlxG.overlap(ob1, arm, check);
    //             }
    //     }

    //     public function check()
    //         {
    //             ob1.isFound = true;
    //         }
}