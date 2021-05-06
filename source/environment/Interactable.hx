package environment;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Interactable extends FlxSprite
{
    public var found:Bool = false;
    public var fText:String;
    public var num:Int;

    public function new(X, Y, foundText, number)
        {
            super(X, Y);
            makeGraphic(10,10, FlxColor.ORANGE);
            fText = foundText;
            num = number;
        }

    override public function update(elapsed:Float):Void
        {
            
        }
}