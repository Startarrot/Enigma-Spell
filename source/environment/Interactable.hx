package environment;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Interactable extends FlxSprite
{
    public var found:Bool = false;
    public var fText:String;

    public function new(X, Y, foundText)
        {
            super(X, Y);
            makeGraphic(10,10, FlxColor.ORANGE);
            fText = foundText;
        }

    override public function update(elapsed:Float):Void
        {
            
        }
}