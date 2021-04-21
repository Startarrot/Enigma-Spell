package character;

import flixel.FlxSprite;

class HeartContainer extends FlxSprite {

    private static var FULL_HEART:String = "fullheart";
    private static var HALF_HEART:String = "halfheart";
    private static var EMPTY_HEART:String = "emptyheart";

    public static var SPRITE_WIDTH:Int = 32;
    public static var SPRITE_HEIGHT:Int = 32;
    public static var MAX_FRAG_AMOUNT:Int = 2;

    public var fragments(default, null):Int;


    public function new(X:Float = 0, Y:Float = 0, fragments:Int) {
        super(X,Y);
        this.fragments = fragments;
        addAnimations();
        updateGraphics();
    }

    /**
	 * Helper function to add graphics for this heart.
     * @author Matt Lippelman
     * @return void
	 */
    private function addAnimations():Void {
        loadGraphic(AssetPaths.Heart_Spritesheet__png, true, 32, 32);

        animation.add(FULL_HEART, [0], 1, false);
        animation.add(HALF_HEART, [2], 1, false);
        animation.add(EMPTY_HEART, [4], 1, false);
    }

    /**
	 * Function to update graphics for this heart.
     * @author Matt Lippelman
     * @return void
	 */
    public function updateGraphics():Void {
        switch (fragments) {
            case 2 : animation.play(FULL_HEART);
            case 1 : animation.play(HALF_HEART);
            default: animation.play(EMPTY_HEART);
        }
    }

    /**
	 * Function to set the fragment amount for this heart container.
     * @author Matt Lippelman
     * @param amount an integer value in fragments (4 per heart) to set this heart to
     * @return void
	 */
    public function setFragments(amount:Int):Void {
        if (amount > MAX_FRAG_AMOUNT) {
            fragments = MAX_FRAG_AMOUNT;
        } else {
            fragments = amount;
        }
        updateGraphics();
    }
}