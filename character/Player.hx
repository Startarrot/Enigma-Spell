package character;

import flixel.FlxObject;
import flixel.math.FlxVector;
import flixel.input.FlxInput.FlxInputState;
import flixel.input.keyboard.FlxKeyboard;
import flixel.input.keyboard.FlxKey;
import flixel.FlxG;
import flixel.FlxSprite;

class Player extends FlxSprite {

    public static var WIDTH(default, never):Int = 16;
    public static var HEIGHT(default, never):Int = 16;

    public static var BASE_MOVE_SPEED:Float = 200;
    public var canMove:Bool = true;

    public var playerHealth(default, null):PlayerHealth;

    // Controls
    private static var INPUT_LEFT:FlxKey = FlxKey.LEFT;
    private static var INPUT_RIGHT:FlxKey = FlxKey.RIGHT;
    private static var INPUT_UP:FlxKey = FlxKey.UP;
    private static var INPUT_DOWN:FlxKey = FlxKey.DOWN;

    private static var ACTION_1:FlxKey = FlxKey.Z;
    private static var ACTION_2:FlxKey = FlxKey.X;

    // Stats
    private static var STARTING_MAX_HEALTH:Int = 10; //This is total number of fragments, not total hearts

    public function new(X:Float = 0, Y:Float = 0) {
        super(X, Y);
        playerHealth = new PlayerHealth(STARTING_MAX_HEALTH);
        health = STARTING_MAX_HEALTH;
        initializeGraphics();
    }

    private function initializeGraphics():Void {
        makeGraphic(WIDTH, HEIGHT);
    }

    override function update(elapsed:Float) {
        super.update(elapsed);

        var moveDirection:FlxVector = selectMoveDirection();
        while(canMove == true)
            standardMovement(moveDirection);

    }

    private function selectMoveDirection():FlxVector {
        var horizontalDirection:Int = 0;
        var verticalDirection:Int = 0;
        var moveDirection:FlxVector = FlxVector.weak(0, 0);

        var keys:FlxKeyboard = FlxG.keys;
        var pressed = FlxInputState.PRESSED;

        keys.checkStatus(INPUT_LEFT, pressed) ? horizontalDirection-- : horizontalDirection;
        keys.checkStatus(INPUT_RIGHT, pressed) ? horizontalDirection++ : horizontalDirection;
        keys.checkStatus(INPUT_UP, pressed) ? verticalDirection-- : verticalDirection;
        keys.checkStatus(INPUT_DOWN, pressed) ? verticalDirection++ : verticalDirection;

        updateFacing(horizontalDirection, verticalDirection);

        moveDirection.x = horizontalDirection;
        moveDirection.y = verticalDirection;
        if (!moveDirection.isZero()) {
            moveDirection.normalize();
        }

        return moveDirection;
    }

    private function updateFacing(horizontalDirection:Int, verticalDirection:Int):Void {
        if (horizontalDirection > 0) {
            facing = FlxObject.RIGHT;
        } 
        else if (horizontalDirection < 0) {
            facing = FlxObject.LEFT;
        }
        if (verticalDirection > 0) {
            facing = FlxObject.DOWN;
        }
        else if (verticalDirection < 0) {
            facing = FlxObject.UP;
        }
    }

    private function standardMovement(moveDirection:FlxVector):Void {
        if (!moveDirection.isZero()) {
            velocity = moveDirection.scale(BASE_MOVE_SPEED);
            velocity.x = Math.floor(velocity.x);
            velocity.y = Math.floor(velocity.y);
            //trace(velocity);
        } else {
            velocity.x = 0;
            velocity.y = 0;
        }
    }

    /**
	 * Override of FlxSprite hurt function.
     * @author Matt Lippelman
     * @param damageAmount an integer value in fragments (4 per heart) to be hurt the player
     * @return void
	 */
    public override function hurt(damageAmount:Float):Void {
        super.hurt(damageAmount);
        playerHealth.updateGraphics(health);
    }
}