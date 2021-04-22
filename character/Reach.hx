package character;

import flixel.FlxSprite;
import flixel.FlxObject;

class Item extends FlxSprite 
{
    private var owner:FlxSprite;

    private var xMod:Float = 0;
    private var yMod:Float = 0;
    
    public function new(owner:FlxSprite) {
        super();
        makeGraphic(1,1);
        this.owner = owner;
    }
    override public function update(elapsed:Float):Void
        {
            pos(owner.x + 6, owner.y);

            if(owner.facing == FlxObject.UP)
                {
                    xMod = 0;
                    yMod = -15;
                    makeGraphic(4,18);
                }
            else if(owner.facing == FlxObject.DOWN)
                {
                    xMod = 0;
                    yMod = 15;
                    makeGraphic(4,18);
                }
            else if(owner.facing == FlxObject.LEFT)
                {
                    xMod = -22;
                    yMod = 6;
                    makeGraphic(18,4);
                }
            else if(owner.facing == FlxObject.RIGHT)
                {
                    xMod = 8;
                    yMod = 6;
                    makeGraphic(18,4);
                }     

            super.update(elapsed);
        }

    public function pos(hX, hY)
        {
            x = hX + xMod;
            y = hY + yMod;
        }
}