package;

import activities.SplashActivity;
import flash.Lib;
import flash.events.Event;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.system.scaleModes.RatioScaleMode;
import openfl.display.Sprite;

class Main extends Sprite {
	public static function main():Void {
		Lib.current.addChild(new Main());
	}

	public function new():Void {
		super();
		init();
	}

	private function init(?E:Event):Void {
		FlxG.autoPause = false;
		addChild(new FlxGame(0, 0, SplashActivity, 1, 60, 60, true));
	}
}
